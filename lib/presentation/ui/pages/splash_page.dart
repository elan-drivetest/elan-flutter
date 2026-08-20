import 'dart:async';

import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:elan/presentation/navigation/launch_destination.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/open_setting_dialog.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/permission_warning_dialog.dart';
import 'package:elan/presentation/ui/widgets/common/animated_brand_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

/// Splash backdrop. Must stay in sync with the two native launch screens —
/// `android/app/src/main/res/values/colors.xml` (`brand_splash_background`) and
/// `ios/Runner/Base.lproj/LaunchScreen.storyboard`. A mismatch shows up as a
/// colour flash on the very first frame.
const Color _splashBackground = Color(0xFF000000);

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool? _isFirstTime;

  /// One store, shared with the rest of the app. The previous bare
  /// `FlutterSecureStorage()` used a different Android backend to
  /// [CacheManager], so this flag was being written somewhere nothing else
  /// touched — and when it failed to come back, the launch fell into the
  /// first-run branch, which never checked auth at all.
  final _cacheManager = getIt<CacheManagerImpl>();

  /// Set once we have routed away, so the auth listener and the onboarding
  /// lookup — which finish in either order — cannot both navigate.
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    // Auth is checked on **every** launch, independently of onboarding.
    //
    // These used to be coupled: the refresh only ran on the
    // already-onboarded branch, so any launch that did not find the
    // onboarding flag — a reinstall, a cleared store, or the storage-backend
    // mismatch fixed above — walked a signed-in instructor through the
    // carousel and dropped them on the login screen with valid cookies
    // sitting on disk. "Have you seen the intro" and "are you signed in" are
    // unrelated questions and are now asked separately.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<AuthBloc>().add(const AuthEvent.refresh());
      context
          .read<LocationBloc>()
          .add(const LocationEvent.checkAllPermissions());
    });

    unawaited(_checkFirstLaunch());
  }

  Future<void> _checkFirstLaunch() async {
    final seenOnboarding = await _cacheManager.getHasSeenOnboarding();
    if (!seenOnboarding) {
      await _cacheManager.setHasSeenOnboarding();
    }
    if (!mounted) return;

    AppLog.d('splash: seenOnboarding=$seenOnboarding');
    setState(() => _isFirstTime = !seenOnboarding);

    // The auth result may already have arrived while this was reading storage,
    // in which case the listener has nothing left to fire.
    _resolveDestination();
  }

  /// Decides where the launch ends, from whatever both checks have settled on.
  ///
  /// Called from the auth listener and from [_checkFirstLaunch] because the two
  /// complete in an unpredictable order — a warm storage read can easily beat a
  /// network round-trip, or lose to it.
  void _resolveDestination() {
    if (!mounted || _navigated) return;

    final destination = resolveLaunchDestination(
      authStatus: context.read<AuthBloc>().state.status,
      hasSeenOnboarding: _isFirstTime == null ? null : !_isFirstTime!,
    );

    switch (destination) {
      case LaunchDestination.undecided:
      // The carousel is this route's own body, so there is nowhere to go — it
      // is already on screen.
      case LaunchDestination.onboarding:
        return;
      case LaunchDestination.dashboard:
        _navigated = true;
        AppLog.d('splash: session restored -> dashboard');
        context.go(PagesName.dashboardPage.path);
      case LaunchDestination.login:
        _navigated = true;
        AppLog.d('splash: no session -> login');
        context.go(PagesName.loginPage.path);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstTime == null) {
      // Same background and same mark as the resolved splash below, so deciding
      // first-launch-vs-returning is invisible. This used to be a green spinner
      // on black, which made a cold start flash three different screens:
      // OS splash -> spinner -> logo -> destination.
      return const Scaffold(
        backgroundColor: _splashBackground,
        body: Center(child: AnimatedBrandMark()),
      );
    }

    return Scaffold(
      backgroundColor: _splashBackground,
      body: MultiBlocListener(
        listeners: [
          // ── Auth: navigate when the session check completes ──────────────
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // `isAuthenticated` covers restoredUnverified as well as
              // success: a launch that could not reach the server, on a device
              // with a stored session, goes to the dashboard. The screens there
              // fetch their own data and a genuinely dead session surfaces as a
              // 401, which CookieRefreshInterceptor turns into a real logout.
              AppLog.d('splash: auth -> ${state.status}');
              _resolveDestination();
            },
          ),

          // ── Location: show permission dialogs from the splash screen ──────
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state.status == LocationStatus.permissionDenied) {
                showDialog(
                  context: context,
                  builder: (_) => OpenSettingDialog(
                    open: () => context
                        .read<LocationBloc>()
                        .add(const LocationEvent.checkAllPermissions()),
                    cancel: () => Navigator.of(context).pop(false),
                    title: 'Location Access Needed',
                    description:
                        'This app needs location access to track rides. Please enable it in settings.',
                    bTitle: 'Enable Permission',
                  ),
                );
              }

              if (state.status == LocationStatus.permissionPermanentlyDenied) {
                showDialog(
                  context: context,
                  builder: (_) => OpenSettingDialog(
                    open: () => openAppSettings(),
                    cancel: () => Navigator.of(context).pop(false),
                    title: 'Location Permission Disabled',
                    description:
                        'Location access is permanently denied. Please allow it in your device settings.',
                    bTitle: 'Open App Settings',
                  ),
                );
              }

              if (state.status == LocationStatus.gpsDisabled) {
                showDialog(
                  context: context,
                  builder: (_) => PermissionWarningDialog(
                    close: () => Navigator.of(context).pop(false),
                    message:
                        'Location services are disabled. Please enable GPS to use this app.',
                  ),
                );
              }

              if (state.status ==
                  LocationStatus.backgroundPermissionNotGranted) {
                showDialog(
                  context: context,
                  builder: (_) => OpenSettingDialog(
                    open: () => openAppSettings(),
                    cancel: () => Navigator.of(context).pop(false),
                    title: 'Background Permission Needed',
                    description: state.errorMessage ??
                        'To track your rides properly, please allow location access all the time in your device settings.',
                    bTitle: 'Open App Settings',
                  ),
                );
              }
            },
          ),
        ],
        child: _isFirstTime! ? _buildOnboarding() : _buildSimpleSplash(),
      ),
    );
  }

  Widget _buildSimpleSplash() {
    return const Center(child: AnimatedBrandMark());
  }

  /// Onboarding.
  ///
  /// Layout rule: **only the background travels.** The pager holds nothing but
  /// the photographs, so a swipe (or Continue) slides the imagery while the
  /// logo, copy, dots and button hold their position. Previously all of those
  /// lived inside the pager and slid with it, which read as a whole-screen
  /// shove rather than a considered transition.
  ///
  /// The copy is not static, though — it re-animates in place on every page
  /// change, so the screen still feels alive without anything sliding around.
  Widget _buildOnboarding() {
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    final page = _onboardPages[_currentPage];
    final isLast = _currentPage == _onboardPages.length - 1;

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1 — the only thing that moves.
        PageView.builder(
          controller: _pageController,
          itemCount: _onboardPages.length,
          onPageChanged: (p) => setState(() => _currentPage = p),
          itemBuilder: (context, i) => Image.asset(
            _onboardPages[i].image,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),

        // 2 — one scrim for all three photos. Weighted to the bottom where the
        // copy sits, which holds contrast steadier than the per-image darken
        // filters this replaced. IgnorePointer keeps the screen swipeable.
        const IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66000000),
                  Color(0x33000000),
                  Color(0xD9000000),
                  Color(0xF2000000),
                ],
                stops: [0.0, 0.35, 0.78, 1.0],
              ),
            ),
          ),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IgnorePointer(
                  child: _FadeSlideIn(
                    reduceMotion: reduceMotion,
                    child: Image.asset(
                      'assets/eclan_logo.png',
                      height: 30,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    ),
                  ),
                ),
                const Spacer(),

                // 3 — re-animates in place whenever the page changes.
                IgnorePointer(
                  child: _OnboardCopy(
                    key: ValueKey(_currentPage),
                    page: page,
                    reduceMotion: reduceMotion,
                  ),
                ),
                const SizedBox(height: 28),

                // 4 — fixed controls.
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state.status == AuthStatus.loading) {
                      return const SizedBox(
                        height: 96,
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        _PageDots(
                          count: _onboardPages.length,
                          currentIndex: _currentPage,
                          reduceMotion: reduceMotion,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: page.cta,
                          reduceMotion: reduceMotion,
                          onPressed: () {
                            if (isLast) {
                              context.go(PagesName.loginPage.path);
                            } else {
                              _pageController.nextPage(
                                duration: reduceMotion
                                    ? Duration.zero
                                    : const Duration(milliseconds: 420),
                                curve: Curves.easeOutCubic,
                              );
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Onboarding content
// ─────────────────────────────────────────────────────────────────────────────

class _OnboardPage {
  const _OnboardPage({
    required this.image,
    required this.title,
    required this.description,
    required this.cta,
  });

  final String image;
  final String title;
  final String description;
  final String cta;
}

const List<_OnboardPage> _onboardPages = [
  _OnboardPage(
    image: 'assets/onboard_1.png',
    title: 'Hassle Free\nDrive Test.\nMade Simple.',
    description:
        'Join a growing network of certified instructors helping learners succeed.',
    cta: 'Get Started',
  ),
  _OnboardPage(
    image: 'assets/onboard_2.png',
    // Copy preserved verbatim. This one opens with "Hassle Free" like page 1,
    // which looks like a copy/paste slip — worth a look from whoever owns the
    // wording.
    title: "Hassle Free\nYou're in\nControl.",
    description: 'Review ride requests, accept the ones that fit your schedule',
    cta: 'Continue',
  ),
  _OnboardPage(
    image: 'assets/onboard_3.png',
    title: 'Reliable\nRides, Real\nRewards.',
    description: 'We bring the students. You bring the expertise.',
    cta: 'Login Now',
  ),
];

/// The headline block, staggered so the eye lands icon → title → body.
///
/// Rebuilt with a fresh [ValueKey] per page, so changing pages restarts the
/// sequence. Each line rises 18 px as it fades — enough to read as intentional
/// motion without the text appearing to fly in.
class _OnboardCopy extends StatefulWidget {
  const _OnboardCopy({
    super.key,
    required this.page,
    required this.reduceMotion,
  });

  final _OnboardPage page;
  final bool reduceMotion;

  @override
  State<_OnboardCopy> createState() => _OnboardCopyState();
}

class _OnboardCopyState extends State<_OnboardCopy>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    );
    if (widget.reduceMotion) {
      _c.value = 1;
    } else {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  /// One staggered step; [start] and [end] are fractions of the controller.
  Widget _step(double start, double end, Widget child) {
    final curve = CurvedAnimation(
      parent: _c,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
    return AnimatedBuilder(
      animation: curve,
      builder: (context, c) => Opacity(
        opacity: curve.value,
        child: Transform.translate(
          offset: Offset(0, 18 * (1 - curve.value)),
          child: c,
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _step(
          0.0,
          0.45,
          Image.asset('assets/announce_icon.png', width: 50, height: 45),
        ),
        const SizedBox(height: 16),
        _step(
          0.15,
          0.70,
          Text(
            widget.page.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 14),
        _step(
          0.32,
          1.0,
          Text(
            widget.page.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

/// A one-shot fade-and-rise for chrome that appears once and then stays.
class _FadeSlideIn extends StatefulWidget {
  const _FadeSlideIn({required this.child, required this.reduceMotion});

  final Widget child;
  final bool reduceMotion;

  @override
  State<_FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<_FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  );

  @override
  void initState() {
    super.initState();
    if (widget.reduceMotion) {
      _c.value = 1;
    } else {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curve = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    return AnimatedBuilder(
      animation: curve,
      builder: (context, child) => Opacity(
        opacity: curve.value,
        child: Transform.translate(
          offset: Offset(0, 12 * (1 - curve.value)),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}

/// Dots that stay put and animate the *active* one into a pill, rather than
/// swapping colours between three identical circles.
class _PageDots extends StatelessWidget {
  const _PageDots({
    required this.count,
    required this.currentIndex,
    required this.reduceMotion,
  });

  final int count;
  final int currentIndex;
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == currentIndex;
        return AnimatedContainer(
          duration:
              reduceMotion ? Duration.zero : const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active ? 26 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: active ? const Color(0xFF4CAF50) : Colors.white38,
          ),
        );
      }),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.reduceMotion = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        // The control never moves; only its label crosses over, so advancing a
        // page reads as the label changing rather than the button being
        // replaced.
        child: AnimatedSwitcher(
          duration:
              reduceMotion ? Duration.zero : const Duration(milliseconds: 260),
          transitionBuilder: (child, anim) => FadeTransition(
            opacity: anim,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.35),
                end: Offset.zero,
              ).animate(anim),
              child: child,
            ),
          ),
          child: Text(
            text,
            key: ValueKey(text),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
