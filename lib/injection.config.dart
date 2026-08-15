// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cookie_jar/cookie_jar.dart' as _i557;
import 'package:dio/dio.dart' as _i361;
import 'package:elan/core/cache/cache_manager.dart' as _i685;
import 'package:elan/core/cache/cache_manager_impl.dart' as _i275;
import 'package:elan/core/endpoints/api_endpoints.dart' as _i684;
import 'package:elan/data/api_service/auth_api_service.dart' as _i26;
import 'package:elan/data/api_service/google_maps_api_service.dart' as _i522;
import 'package:elan/data/api_service/i_auth_api_service.dart' as _i329;
import 'package:elan/data/api_service/i_public_api_service.dart' as _i988;
import 'package:elan/data/api_service/i_trace_api_service.dart' as _i766;
import 'package:elan/data/api_service/i_user_api_service.dart' as _i28;
import 'package:elan/data/api_service/public_api_service.dart' as _i376;
import 'package:elan/data/api_service/trace_api_service.dart' as _i658;
import 'package:elan/data/api_service/user_api_service.dart' as _i231;
import 'package:elan/data/interceptor/cookie_refresh_interceptor.dart' as _i589;
import 'package:elan/data/location_request_service/i_location_request_service.dart'
    as _i264;
import 'package:elan/data/location_request_service/location_request_service.dart'
    as _i839;
import 'package:elan/data/module/network_module.dart' as _i156;
import 'package:elan/data/repository/auth_repository.dart' as _i47;
import 'package:elan/data/repository/direction_repository.dart' as _i354;
import 'package:elan/data/repository/public_repository.dart' as _i1047;
import 'package:elan/data/repository/user_repository.dart' as _i1010;
import 'package:elan/data/service/cookie_refresh_service.dart' as _i1051;
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart' as _i676;
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart'
    as _i407;
import 'package:elan/presentation/bloc/bottom_navigation/bottom_navigation_bloc.dart'
    as _i820;
import 'package:elan/presentation/bloc/complete_ride_bloc/complete_ride_bloc.dart'
    as _i541;
import 'package:elan/presentation/bloc/confirm_email_bloc/confirm_email_bloc.dart'
    as _i816;
import 'package:elan/presentation/bloc/date_picker_bloc/date_picker_bloc.dart'
    as _i576;
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart'
    as _i643;
import 'package:elan/presentation/bloc/earnings_summary_bloc/earnings_summary_bloc.dart'
    as _i21;
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart'
    as _i650;
import 'package:elan/presentation/bloc/generate_referral_code_bloc/generate_referral_code_bloc.dart'
    as _i1015;
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart'
    as _i915;
import 'package:elan/presentation/bloc/instructor_onboarding_bloc/instructor_onboarding_bloc.dart'
    as _i733;
import 'package:elan/presentation/bloc/instructor_ride_bloc/instructor_ride_bloc.dart'
    as _i30;
import 'package:elan/presentation/bloc/instructor_summary_bloc/instructor_summary_bloc.dart'
    as _i461;
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart'
    as _i488;
import 'package:elan/presentation/bloc/otp_verification_bloc/otp_verification_bloc.dart'
    as _i871;
import 'package:elan/presentation/bloc/pricing_config_bloc/pricing_config_bloc.dart'
    as _i868;
import 'package:elan/presentation/bloc/referral_summary_bloc/referral_summary_bloc.dart'
    as _i629;
import 'package:elan/presentation/bloc/registration_bloc/registration_bloc.dart'
    as _i794;
import 'package:elan/presentation/bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i641;
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart'
    as _i244;
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart'
    as _i214;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i684.ApiEndpoints>(() => _i684.ApiEndpoints());
    await gh.factoryAsync<_i557.PersistCookieJar>(
      () => networkModule.cookieJar,
      preResolve: true,
    );
    gh.factory<_i522.GoogleMapsApiService>(() => _i522.GoogleMapsApiService());
    gh.factory<_i820.BottomNavigationBloc>(() => _i820.BottomNavigationBloc());
    gh.factory<_i576.DatePickerBloc>(() => _i576.DatePickerBloc());
    gh.lazySingleton<_i685.CacheManager>(() => _i685.CacheManager());
    gh.lazySingleton<_i839.LocationRequestService>(
        () => _i264.ILocationRequestService());
    gh.factory<_i488.LocationBloc>(
        () => _i488.LocationBloc(gh<_i839.LocationRequestService>()));
    gh.lazySingleton<_i589.CookieRefreshInterceptor>(
        () => networkModule.cookieInterceptor(gh<_i557.PersistCookieJar>()));
    gh.lazySingleton<_i354.DirectionRepository>(
        () => _i354.IDirectionRepository(gh<_i522.GoogleMapsApiService>()));
    gh.lazySingleton<_i275.CacheManagerImpl>(
        () => _i275.CacheManagerImpl(gh<_i685.CacheManager>()));
    gh.factory<_i643.DirectionBloc>(
        () => _i643.DirectionBloc(gh<_i354.DirectionRepository>()));
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(
          gh<_i557.PersistCookieJar>(),
          gh<_i589.CookieRefreshInterceptor>(),
        ));
    gh.lazySingleton<_i658.TraceApiService>(
        () => _i766.ITraceApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i26.AuthApiService>(
        () => _i329.IAuthApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i231.UserApiService>(
        () => _i28.IUserApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i1010.UserRepository>(
        () => _i1010.IUserRepository(gh<_i231.UserApiService>()));
    gh.lazySingleton<_i376.PublicApiService>(
        () => _i988.IPublicApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i47.AuthRepository>(
        () => _i47.IAuthRepository(gh<_i26.AuthApiService>()));
    gh.factory<_i244.StripeOnboardingBloc>(
        () => _i244.StripeOnboardingBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i21.EarningsSummaryBloc>(
        () => _i21.EarningsSummaryBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i1015.GenerateReferralCodeBloc>(
        () => _i1015.GenerateReferralCodeBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i407.AvailableRideBloc>(
        () => _i407.AvailableRideBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i915.InstructorInfoBloc>(
        () => _i915.InstructorInfoBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i629.ReferralSummaryBloc>(
        () => _i629.ReferralSummaryBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i461.InstructorSummaryBloc>(
        () => _i461.InstructorSummaryBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i650.FileUploadBloc>(
        () => _i650.FileUploadBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i214.UpcomingRideBloc>(
        () => _i214.UpcomingRideBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i733.InstructorOnboardingBloc>(
        () => _i733.InstructorOnboardingBloc(gh<_i1010.UserRepository>()));
    gh.factory<_i541.CompleteRideBloc>(
        () => _i541.CompleteRideBloc(gh<_i1010.UserRepository>()));
    gh.lazySingleton<_i1047.PublicRepository>(
        () => _i1047.IPublicRepository(gh<_i376.PublicApiService>()));
    gh.factory<_i816.ConfirmEmailBloc>(
        () => _i816.ConfirmEmailBloc(gh<_i47.AuthRepository>()));
    gh.factory<_i794.RegistrationBloc>(
        () => _i794.RegistrationBloc(gh<_i47.AuthRepository>()));
    gh.factory<_i871.OtpVerificationBloc>(
        () => _i871.OtpVerificationBloc(gh<_i47.AuthRepository>()));
    gh.factory<_i30.InstructorRideBloc>(() => _i30.InstructorRideBloc(
          gh<_i1010.UserRepository>(),
          gh<_i275.CacheManagerImpl>(),
        ));
    gh.lazySingleton<_i1051.CookieRefreshService>(
        () => _i1051.CookieRefreshService(gh<_i47.AuthRepository>()));
    gh.factory<_i641.ResetPasswordBloc>(
        () => _i641.ResetPasswordBloc(gh<_i1047.PublicRepository>()));
    gh.lazySingleton<_i868.PricingConfigBloc>(
        () => _i868.PricingConfigBloc(gh<_i1047.PublicRepository>()));
    gh.factory<_i676.AuthBloc>(() => _i676.AuthBloc(
          gh<_i47.AuthRepository>(),
          gh<_i557.PersistCookieJar>(),
          gh<_i1051.CookieRefreshService>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i156.NetworkModule {}
