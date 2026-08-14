import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/data/api_service/auth_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:elan/domain/refresh_error_response/refresh_error_response.dart'
    show RefreshErrorResponse;
import 'package:elan/domain/register_error_response/register_error_response.dart';
import 'package:elan/domain/verification_error_response/verification_error_response.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  final AuthApiService authApiService;

  AuthRepository(this.authApiService);

  Future<Either<LoginErrorResponse, Response<dynamic>>> login(
      {required String email, required String password});
  Future<Either<RegisterErrorResponse, Response<dynamic>>> register(
      {required Map<String, String> fields});
  Future<Either<RefreshErrorResponse, Response<dynamic>>> refresh();
  Future<Either<ErrorResponse, Response<dynamic>>> logOut();
  Future<Either<ErrorResponse, Response<dynamic>>> confirmEmail({required String hash});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> verifyOtp({required String email, required String otp});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> resendOtp({required String email});
  Future<Either<VerificationErrorResponse, Response<dynamic>>> verifyForgotPasswordOtp({required String email, required String otp});
}

@LazySingleton(as: AuthRepository)
class IAuthRepository extends AuthRepository {
  IAuthRepository(super.authApiService);

  @override
  Future<Either<LoginErrorResponse, Response<dynamic>>> login(
      {required String email, required String password}) {
    return authApiService.login(email: email, password: password);
  }

  @override
  Future<Either<RefreshErrorResponse, Response>> refresh() {
    return authApiService.refresh();
  }

  @override
  Future<Either<ErrorResponse, Response>> logOut() {
    return authApiService.logOut();
  }

  @override
  Future<Either<RegisterErrorResponse, Response>> register(
      {required Map<String, String> fields}) {
    return authApiService.register(fields: fields);
  }

  @override
  Future<Either<ErrorResponse, Response>> confirmEmail({required String hash}) {
    return authApiService.confirmEmail(hash: hash);
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> verifyOtp({required String email, required String otp}) {
    return authApiService.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> resendOtp({required String email}) {
    return authApiService.resendOtp(email: email);
  }

  @override
  Future<Either<VerificationErrorResponse, Response>> verifyForgotPasswordOtp({required String email, required String otp}) {
    return authApiService.verifyForgotPasswordOtp(email: email, otp: otp);
  }
}
