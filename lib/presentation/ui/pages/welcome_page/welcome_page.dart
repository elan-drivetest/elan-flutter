import 'dart:async';

import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/widgets/common/animated_brand_mark.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shown for three seconds after signup verification, then hands off to the
/// dashboard.
///
/// `POST /v1/auth/instructor/otp/verify` ends with `issueAuthCookies`
/// (`auth.service.ts:906`), so verifying the code *is* signing in — the app
/// used to discard that and send the instructor to a login form to re-enter
/// credentials they had just proved. This screen covers the hand-off so the
/// jump from "enter your code" to a populated dashboard reads as a welcome
/// rather than a flicker.
///
/// Deliberately the same black backdrop and brand mark as [SplashPage]: this is
/// the third screen in a chain the OS splash started, and changing the backdrop
/// mid-chain shows up as a flash.
const Color _welcomeBackground = Color(0xFF000000);

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, this.name});

  /// First name, when the signup flow knows it. Falls back to a generic
  /// greeting rather than rendering "Welcome, null".
  final String? name;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const Duration _dwell = Duration(seconds: 3);

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Timer rather than `await Future.delayed` so it can be cancelled if the
    // instructor is routed away early — a pending go() on a dead context
    // throws, and this screen sits directly after a network call.
    _timer = Timer(_dwell, () {
      if (!mounted) return;
      context.go(PagesName.dashboardPage.path);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final greeting = (widget.name?.trim().isNotEmpty ?? false)
        ? 'Welcome, ${widget.name!.trim()}'
        : 'Welcome to Elan';

    return Scaffold(
      backgroundColor: _welcomeBackground,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // showProgress: the dashboard is fetching behind this screen,
                // so the hairline is honest about the wait rather than
                // decorative.
                const AnimatedBrandMark(),
                const SizedBox(height: 32),
                Text(
                  greeting,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "You're all set. Let's get you on the road.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
