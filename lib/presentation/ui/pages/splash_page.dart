import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/open_setting_dialog.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/permission_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool? _isFirstTime;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    String? hasLaunched = await _storage.read(key: 'has_launched');
    if (hasLaunched == null) {
      await _storage.write(key: 'has_launched', value: 'true');
      if (mounted) {
        setState(() {
          _isFirstTime = true;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _isFirstTime = false;
        });
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.read<AuthBloc>().add(AuthEvent.refresh());
        context.read<LocationBloc>().add(const LocationEvent.checkAllPermissions());
      });
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
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.green),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocListener(
        listeners: [
          // ── Auth: navigate when the session check completes ──────────────
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.success) {
                context.go(PagesName.dashboardPage.path);
              } else if (state.status == AuthStatus.refreshFailed ||
                  state.status == AuthStatus.error) {
                context.go(PagesName.loginPage.path);
              }
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

              if (state.status == LocationStatus.backgroundPermissionNotGranted) {
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
    return Center(
      child: Image.asset("assets/eclan_logo.png", width: 200),
    );
  }

  Widget _buildOnboarding() {
    return Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // First Screen
                ScreenTemplate(
                  backgroundImage: 'assets/onboard_1.png',
                  title: "Hassle Free\nDrive Test.\nMade Simple.",
                  description:
                  "Join a growing network of certified instructors helping learners succeed.",
                  buttonText: "Get Started",
                  currentPage: _currentPage,
                  onButtonPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  imageOverlay: 0.4,
                ),

                // Second Screen
                ScreenTemplate(
                  backgroundImage: 'assets/onboard_2.png',
                  title: "Hassle Free\nYou're in\nControl.",
                  description:
                  "Review ride requests, accept the ones that fit your schedule",
                  buttonText: "Continue",
                  currentPage: _currentPage,
                  onButtonPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  imageOverlay: 0.5,
                ),

                // Third Screen
                ScreenTemplate(
                  backgroundImage: 'assets/onboard_3.png',
                  title: "Reliable\nRides, Real\nRewards.",
                  description: "We bring the students. You bring the expertise.",
                  buttonText: "Login Now",
                  currentPage: _currentPage,
                  onButtonPressed: () {
                    context.go(PagesName.loginPage.path);
                  },
                  imageOverlay: 0.5,
                ),
              ],
            ),

            // Logo
            Positioned(
              top: 60,
              right: 20,
              child: Container(
                alignment: Alignment.topLeft,
                height: 50,
                child: Image.asset("assets/eclan_logo.png", height: 32),
              ),
            ),
          ],
        );
  }
}

class ScreenTemplate extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String description;
  final String buttonText;
  final double imageOverlay;
  final int currentPage;
  final VoidCallback onButtonPressed;

  const ScreenTemplate({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    required this.currentPage,
    this.imageOverlay = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(imageOverlay),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.4),

            // Green Badge Icon
            Image.asset(
              "assets/announce_icon.png",
              width: 50,
              height: 45,
            ),

            const SizedBox(height: 16),

            // Title Text
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.3,
              ),
            ),

            const Spacer(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context,state) {
                if(state.status == AuthStatus.loading){
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageIndicator(
                      count: 3,
                      currentIndex: currentPage,
                    ),
                    const SizedBox(height: 16),
                    // Button
                    CustomButton(text: buttonText, onPressed: onButtonPressed),
                  ],
                );
              }
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.green : Colors.grey,
          ),
        );
      }),
    );
  }
}
