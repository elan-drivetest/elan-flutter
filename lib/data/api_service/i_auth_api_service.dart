import 'dart:convert';
import 'package:elan/core/log/app_log.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:elan/domain/refresh_error_response/refresh_error_response.dart';
import 'package:elan/domain/register_error_response/register_error_response.dart';
import 'package:elan/domain/verification_error_response/verification_error_response.dart';
import 'package:injectable/injectable.dart';

import 'auth_api_service.dart';

@LazySingleton(as: AuthApiService)
class IAuthApiService extends AuthApiService {
  final Dio dio;
  IAuthApiService(this.dio);

  LoginErrorResponse checkResponseError(DioException err) {
    AppLog.d("auth_error -> ${err.response}");
    return LoginErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  RefreshErrorResponse checkRefreshResponseError(DioException err) {
    AppLog.d("refresh_error -> ${err.response}");
    return RefreshErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  RegisterErrorResponse checkRegisterResponseError(DioException err) {
    AppLog.d("register_error -> ${err.response}");
    return RegisterErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  ErrorResponse checkErrorResponse(DioException err) {
    AppLog.d("error_response -> ${err.response}");
    return ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  VerificationErrorResponse checkVerificationErrorResponse(DioException err) {
    AppLog.d("verification_error_response -> ${err.response}");
    return VerificationErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  @override
  Future<Either<LoginErrorResponse, Response<dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      AppLog.d("auth_check -> $email -- $password");
      var loginInfo = jsonEncode({"email": email, "password": password});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.loginInstructorUrl,
        data: loginInfo,
      );

      AppLog.d("auth_check -> ${response.statusCode}");
      AppLog.d("auth_header -> ${response.headers}");

      // // ✅ Check and log cookies right after login
      // final cookies = await cookieJar.loadForRequest(Uri.parse(ApiEndpoints.baseUrl));
      // AppLog.d('Cookies after login:');
      // for (var c in cookies) {
      //   AppLog.d('${c.name} = ${c.value}; Expires: ${c.expires}');
      // }

      return right(response);
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<RefreshErrorResponse, Response>> refresh() async {
    try {
      // // ✅ Check and log cookies right after login
      // final cookies = await cookieJar.loadForRequest(Uri.parse(ApiEndpoints.baseUrl));
      // AppLog.d('Cookies after refresh:');
      // for (var c in cookies) {
      //   AppLog.d('${c.name} = ${c.value}; Expires: ${c.expires}');
      // }
      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.refreshCookieUrl,
      );

      AppLog.d("refresh_check -> ${response.statusCode}");
      AppLog.d("refresh_header -> ${response.headers}");

      return right(response);
    } on DioException catch (e) {
      return left(checkRefreshResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Response>> logOut() async {
    try {
      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.refreshCookieUrl,
      );

      AppLog.d("logout_header -> ${response.statusCode}");
      AppLog.d("logout_header -> ${response.headers}");

      return right(response);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<RegisterErrorResponse, Response>> register({required Map<String, String> fields}) async {
    try {
      var registerInfo = jsonEncode(fields);

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.registerInstructorUrl,
        data: registerInfo,
      );

      AppLog.d("register_header -> ${response.statusCode}");
      AppLog.d("register_header -> ${response.headers}");

      return right(response);
    } on DioException catch (e) {
      return left(checkRegisterResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Response>> confirmEmail({required String hash}) async {
    try {
      AppLog.d('📧 Confirming email with hash: $hash');
      
      var data = jsonEncode({"hash": hash});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.confirmEmailUrl,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      AppLog.d('✅ Email confirmation response: ${response.statusCode}');
      AppLog.d('📄 Response data: ${response.data}');

      return right(response);
    } on DioException catch (e) {
      AppLog.d('❌ Email confirmation failed: ${e.message}');
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> verifyOtp({required String email, required String otp}) async {
    try {
      var data = jsonEncode({"email": email, "otp": otp});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.verifyOtpUrl,
        data: data,
      );

      AppLog.d('✅ verifyOtp response: ${response.statusCode}');
      return right(response);
    } on DioException catch (e) {
      AppLog.d('❌ verifyOtp failed: ${e.response}');
      return left(checkVerificationErrorResponse(e));
    }
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> resendOtp({required String email}) async {
    try {
      var data = jsonEncode({"email": email});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.resendOtpUrl,
        data: data,
      );

      AppLog.d('✅ resendOtp response: ${response.statusCode}');
      return right(response);
    } on DioException catch (e) {
      AppLog.d('❌ resendOtp failed: ${e.response}');
      return left(checkVerificationErrorResponse(e));
    }
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> verifyForgotPasswordOtp({required String email, required String otp}) async {
    try {
      var data = jsonEncode({"email": email, "otp": otp});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.forgotPasswordVerifyUrl,
        data: data,
      );

      AppLog.d('✅ verifyForgotPasswordOtp response: ${response.statusCode}');
      return right(response);
    } on DioException catch (e) {
      AppLog.d('❌ verifyForgotPasswordOtp failed: ${e.response}');
      return left(checkVerificationErrorResponse(e));
    }
  }
}
