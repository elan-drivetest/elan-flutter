import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';

abstract class PublicApiService {
  Future<Either<LoginErrorResponse, Response<dynamic>>> forgetPassword({
    required String email
  });

  Future<Either<LoginErrorResponse, Response<dynamic>>> submitNewPassword({
    required String hash,
    required String newPassword,
  });
}



