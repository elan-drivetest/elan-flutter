import 'package:dartz/dartz.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/pricing_config/pricing_config.dart';

abstract class PricingConfigApiService {
  Future<Either<ErrorResponse, PricingConfig>> getPricingConfig();
}
