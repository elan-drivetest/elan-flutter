import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool isDarkMode = false;
  String themeName = "Glow Mode";

  void navRoute(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stripe onboarding returns a one-time URL, and whoever asked for it has to
    // push the verify page. Three places ask — the dashboard's bank card, the
    // profile bank sheet, and the job-board gate — and only the dashboard ever
    // pushed, so the other two silently did nothing whenever the dashboard was
    // not mounted in exactly the right state. Handled once here, above every
    // branch, so any caller works and none of them push twice.
    return BlocListener<StripeOnboardingBloc, StripeOnboardingState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == StripeOnboardingStatus.update,
      listener: (context, state) {
        final url = state.onboardUrlResponse?.onboardingUrl;
        if (url == null || url.isEmpty) return;
        context.push(PagesName.stripeVerifyPage.path, extra: url);
      },
      child: _buildShell(context),
    );
  }

  Widget _buildShell(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
      return Scaffold(
        key: _scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                backgroundColor: Colors.white,
                indicatorColor:
                    LightModeColor.navActive.color.withValues(alpha: 0.15),
                labelTextStyle: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: LightModeColor.navActive.color,
                      fontFamily: 'Inter',
                    );
                  }
                  return TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    fontFamily: 'Inter',
                  );
                }),
              ),
              child: NavigationBar(
                selectedIndex: state.tabIndex,
                elevation: 0,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.dashboard_outlined,
                        size: 26, color: Colors.grey),
                    selectedIcon: Icon(Icons.dashboard_rounded, size: 26),
                    label: 'Dashboard',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.directions_car_outlined,
                        size: 26, color: Colors.grey),
                    selectedIcon: Icon(Icons.directions_car_rounded, size: 26),
                    label: 'Available Rides',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.card_giftcard_outlined,
                        size: 26, color: Colors.grey),
                    selectedIcon: Icon(Icons.card_giftcard, size: 26),
                    label: 'Referral',
                  ),
                ],
                onDestinationSelected: (index) {
                  context
                      .read<BottomNavigationBloc>()
                      .add(BottomNavigationEvent.tabChange(index));
                },
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      state.when(route: navRoute);
    });
  }
}
