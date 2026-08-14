import 'dart:convert';
import 'package:elan/core/log/app_log.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/data/api_service/public_api_service.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PublicApiService)
class IPublicApiService extends PublicApiService {
  final Dio dio;
  IPublicApiService(this.dio);

  LoginErrorResponse checkResponseError(DioException err) {
    AppLog.d("auth_error -> ${err.response}");
    return LoginErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  @override
  Future<Either<LoginErrorResponse, Response>> forgetPassword(
      {required String email}) async {
    try {
      AppLog.d("auth_check -> $email");
      var loginInfo = jsonEncode({"email": email});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.resetPasswordUrl,
        data: loginInfo,
      );

      AppLog.d("auth_check -> ${response.statusCode}");
      AppLog.d("auth_header -> ${response.headers}");

      return right(response);
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<LoginErrorResponse, Response>> submitNewPassword({
    required String hash,
    required String newPassword,
  }) async {
    try {
      var data = jsonEncode({
        "hash": hash,
        "password": newPassword,
      });

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.submitNewPasswordUrl,
        data: data,
      );

      AppLog.d('✅ submitNewPassword response status: ${response.statusCode}');
      AppLog.d('📄 submitNewPassword response data: ${response.data}');

      return right(response);
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }
}
