import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:elan/domain/refresh_error_response/refresh_error_response.dart';
import 'package:elan/domain/register_error_response/register_error_response.dart';
import 'package:elan/domain/verification_error_response/verification_error_response.dart';

abstract class AuthApiService {
  Future<Either<LoginErrorResponse, Response<dynamic>>> login({
    required String email,
    required String password,
  });

  Future<Either<RegisterErrorResponse, Response<dynamic>>> register(
      {required Map<String, String> fields});

  Future<Either<RefreshErrorResponse, Response<dynamic>>> refresh();
  Future<Either<ErrorResponse, Response<dynamic>>> logOut();
  Future<Either<ErrorResponse, Response<dynamic>>> confirmEmail({required String hash});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> verifyOtp({required String email, required String otp});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> resendOtp({required String email});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> verifyForgotPasswordOtp({required String email, required String otp});
}
