import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:elan/domain/ride_session/ride_session.dart';
import 'package:elan/domain/vehicle_request_response/vehicle_request_response.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:elan/presentation/bloc/referral_summary_bloc/referral_summary_bloc.dart';
import 'package:elan/presentation/bloc/ride_route_bloc/ride_route_bloc.dart';
import 'package:elan/presentation/bloc/registration_bloc/registration_bloc.dart';
import 'package:elan/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:elan/presentation/bloc/earnings_summary_bloc/earnings_summary_bloc.dart';
import 'package:elan/presentation/ui/pages/add_license_page/add_license_page.dart';
import 'package:elan/presentation/ui/pages/add_vehicle_page/add_vehicle_page.dart';
import 'package:elan/presentation/ui/pages/auth_page/forget_password_page.dart';
import 'package:elan/presentation/ui/pages/auth_page/otp_verification_page.dart';
import 'package:elan/presentation/ui/pages/auth_page/reset_password_page.dart';
import 'package:elan/presentation/bloc/otp_verification_bloc/otp_verification_bloc.dart';
import 'package:elan/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:elan/presentation/ui/pages/direction_map_page/direction_map_page.dart';
import 'package:elan/presentation/ui/pages/ride_map_page/ride_map_page.dart';
import 'package:elan/presentation/ui/pages/stripe_verify_page/stripe_verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/pages/main_page.dart';
import 'package:elan/presentation/ui/pages/splash_page.dart';
import 'package:elan/presentation/ui/pages/upcoming_ride_map_page/upcoming_ride_map_page.dart';
import 'package:elan/presentation/ui/pages/auth_page/login_page.dart';
import 'package:elan/presentation/ui/pages/auth_page/registration_page.dart';
import 'package:elan/presentation/ui/pages/profile_page/profile_setting_page.dart';
import 'package:elan/presentation/ui/pages/dashboard_page/dashboard_page.dart';
import 'package:elan/presentation/ui/pages/available_rides_page/available_rides_page.dart';
import 'package:elan/presentation/ui/pages/referral_code_page/referral_code_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>();
final _shellNavigatorRidesKey = GlobalKey<NavigatorState>();
final _shellNavigatorReferralCodeKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: PagesName.splashPage.path,
  redirect: (context, state) {
    try {
      final authState = context.read<AuthBloc>().state;

      // If auth failed/logged out and we're not already on Login, send user there
      if ((authState.status == AuthStatus.refreshFailed ||
              authState.status == AuthStatus.logout) &&
          state.uri.path != PagesName.loginPage.path) {
        return PagesName.loginPage.path;
      }
    } catch (e) {
      AppLog.d('Redirect error: $e');
    }
    return null;
  },
  routes: [
    /// Shell route for bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: [
        /// Dashboard Tab
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboardKey,
          routes: [
            GoRoute(
              path: PagesName.dashboardPage.path,
              builder: (context, state) => const DashboardPage(),
              routes: [
                GoRoute(
                  path: PagesName.addVehiclePage.path,
                  builder: (context, state) {
                    final vehicleRequest =
                        state.extra as VehicleRequestResponse?;
                    return AddVehiclePage(vehicleRequest: vehicleRequest);
                  },
                ),
                GoRoute(
                  path: PagesName.addLicensePage.path,
                  builder: (context, state) {
                    final instructorInfo = state.extra as Instructor?;
                    return AddLicensePage(instructorInfo: instructorInfo);
                  },
                ),
                GoRoute(
                  path: PagesName.directionMapPage.path,
                  builder: (context, state) {
                    final rideSession = state.extra as RideSession?;
                    // Screen-scoped: the leg set belongs to one ride, and a
                    // fresh instance avoids showing a previous ride's route
                    // for a frame when reopening.
                    return BlocProvider(
                      create: (_) => getIt<RideRouteBloc>(),
                      child: DirectionMapPage(rideSession: rideSession),
                    );
                  },
                ),
                GoRoute(
                  path: PagesName.upcomingRideMapPage.path,
                  builder: (context, state) {
                    final ride = state.extra as Ride;
                    return UpcomingRideMapPage(rideInfo: ride);
                  },
                ),
              ],
            ),
          ],
        ),

        /// Rides Tab
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRidesKey,
          routes: [
            GoRoute(
              path: PagesName.availableRidesPage.path,
              builder: (context, state) => const AvailableRidesPage(),
              routes: [
                GoRoute(
                  path: PagesName.rideMapPage.path,
                  builder: (context, state) {
                    final ride = state.extra as Ride;
                    return RideMapPage(rideInfo: ride);
                  },
                ),
              ],
            ),
          ],
        ),

        /// Referral Code Tab
        StatefulShellBranch(
          navigatorKey: _shellNavigatorReferralCodeKey,
          routes: [
            GoRoute(
              path: PagesName.referralCodePage.path,
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<ReferralSummaryBloc>()..add(const ReferralSummaryEvent.fetchSummary()),
                child: const ReferralCodePage(),
              ),
            ),
          ],
        ),
      ],
    ),

    /// Top-level pages (outside shell)
    GoRoute(
      path: PagesName.splashPage.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: PagesName.loginPage.path,
      builder: (context, state) {
        final hash = state.uri.queryParameters['hash'];
        return BlocProvider(
          create: (context) => getIt<OtpVerificationBloc>(),
          child: LoginPage(confirmationHash: hash),
        );
      },
      routes: [
        GoRoute(
          path: PagesName.registrationPage.path,
          builder: (context, state) => BlocProvider(
              create: (context) => getIt<RegistrationBloc>(),
              child: const RegistrationPage()),
        ),
        GoRoute(
          path: PagesName.forgetPasswordPage.path,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<ResetPasswordBloc>(),
            child: const ForgetPasswordPage(),
          ),
        ),
        GoRoute(
          path: PagesName.otpVerificationPage.path,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>? ?? {};
            final email = extra['email'] as String? ?? '';
            final verificationType = extra['verificationType'] as VerificationType? ?? VerificationType.registration;
            final message = extra['message'] as String?;
            final phoneHint = extra['phoneHint'] as String?;
            return BlocProvider(
              create: (context) => getIt<OtpVerificationBloc>(),
              child: OtpVerificationPage(
                email: email,
                verificationType: verificationType,
                message: message,
                phoneHint: phoneHint,
              ),
            );
          },
        ),
        GoRoute(
          path: PagesName.resetPasswordPage.path,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>? ?? {};
            final token = extra['token'] as String? ?? '';
            return BlocProvider(
              create: (context) => getIt<ResetPasswordBloc>(),
              child: ResetPasswordPage(token: token),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: PagesName.profilePage.path,
      builder: (context, state) => const ProfileSettingsPage(),
    ),
    GoRoute(
      path: PagesName.stripeVerifyPage.path,
      builder: (context, state) {
        final url = state.extra as String;
        return StripeVerifyPage(onboardUrl: url);
      },
    ),

    // Deep link handler for email confirmation
    GoRoute(
      path: '/confirm-email',
      redirect: (context, state) {
        AppLog.d('🔗 Deep link received: ${state.uri}');
        AppLog.d('🔗 Matched location: ${state.matchedLocation}');

        final hash = state.uri.queryParameters['hash'];
        AppLog.d(
            '🔗 Hash parameter: ${hash != null ? "✅ Found (${hash.substring(0, 20)}...)" : "❌ Missing"}');

        String redirectUrl;
        if (hash != null) {
          redirectUrl =
              '${PagesName.loginPage.path}?hash=$hash&source=email_confirmation';
        } else {
          redirectUrl = '${PagesName.loginPage.path}?source=email_confirmation';
        }

        AppLog.d('🔗 Redirecting to: $redirectUrl');
        return redirectUrl;
      },
    ),
  ],
);
