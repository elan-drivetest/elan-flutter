import 'package:elan/core/app_themes.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart';
import 'package:elan/presentation/bloc/complete_ride_bloc/complete_ride_bloc.dart';
import 'package:elan/presentation/bloc/confirm_email_bloc/confirm_email_bloc.dart';
import 'package:elan/presentation/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';
import 'package:elan/presentation/bloc/generate_referral_code_bloc/generate_referral_code_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/bloc/instructor_ride_bloc/instructor_ride_bloc.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:elan/presentation/bloc/pricing_config_bloc/pricing_config_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:elan/presentation/bloc/earnings_summary_bloc/earnings_summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'navigation/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BottomNavigationBloc>()),
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        // Server-owned config. Unauthenticated, so it is fetched immediately at
        // app start rather than after login, and it never blocks a screen —
        // state.config falls back to cached-then-default values.
        BlocProvider(
          create: (context) =>
              getIt<PricingConfigBloc>()..add(const PricingConfigEvent.fetch()),
        ),
        BlocProvider(create: (context) => getIt<InstructorInfoBloc>()),
        BlocProvider(create: (context) => getIt<AvailableRideBloc>()),
        BlocProvider(create: (context) => getIt<UpcomingRideBloc>()),
        BlocProvider(create: (context) => getIt<CompleteRideBloc>()),
        BlocProvider(create: (context) => getIt<InstructorRideBloc>()),
        BlocProvider(create: (context) => getIt<StripeOnboardingBloc>()),
        BlocProvider(create: (context) => getIt<FileUploadBloc>()),
        BlocProvider(create: (context) => getIt<DatePickerBloc>()),
        BlocProvider(create: (context) => getIt<LocationBloc>()),
        BlocProvider(create: (context) => getIt<GenerateReferralCodeBloc>()),
        BlocProvider(create: (context) => getIt<ConfirmEmailBloc>()),
        BlocProvider(create: (context) => getIt<DirectionBloc>()),
        BlocProvider(create: (context) => getIt<EarningsSummaryBloc>()),
        // `.value` because PricingConfigBloc is a get_it @lazySingleton —
        // BlocProvider(create:) would close the singleton on dispose, and any
        // later `add()` would throw "Cannot add new events after calling
        // close".
        BlocProvider.value(
          value: getIt<PricingConfigBloc>()
            ..add(const PricingConfigEvent.fetch()),
        ),
      ],
      child: MaterialApp.router(
        // Android's task switcher reads this, so it has to match the launcher
        // label in AndroidManifest.xml rather than being a shorter nickname.
        title: 'Elan Instructor',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
