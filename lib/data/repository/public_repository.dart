import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/data/api_service/public_api_service.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:elan/domain/pricing_config_response/pricing_config_response.dart';
import 'package:injectable/injectable.dart';

abstract class PublicRepository {
  final PublicApiService publicApiService;

  PublicRepository(this.publicApiService);

  Future<Either<LoginErrorResponse, Response<dynamic>>> forgetPassword({
    required String email
  });

  Future<Either<LoginErrorResponse, Response<dynamic>>> submitNewPassword({
    required String hash,
    required String newPassword,
  });

  Future<Either<LoginErrorResponse, PricingConfigResponse>> getPricingConfig();
}

@LazySingleton(as: PublicRepository)
class IPublicRepository extends PublicRepository {
  IPublicRepository(super.publicApiService);

  @override
  Future<Either<LoginErrorResponse, Response>> forgetPassword({required String email}) {
    return publicApiService.forgetPassword(email: email);
  }

  @override
  Future<Either<LoginErrorResponse, Response>> submitNewPassword({
    required String hash,
    required String newPassword,
  }) {
    return publicApiService.submitNewPassword(hash: hash, newPassword: newPassword);
  }

  @override
  Future<Either<LoginErrorResponse, PricingConfigResponse>> getPricingConfig() {
    return publicApiService.getPricingConfig();
  }
}
