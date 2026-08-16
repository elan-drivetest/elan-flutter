import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/api_service/pricing_config_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/pricing_config/pricing_config.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PricingConfigApiService)
class IPricingConfigApiService extends PricingConfigApiService {
  final Dio dio;
  IPricingConfigApiService(this.dio);

  ErrorResponse checkResponseError(DioException err) {
    AppLog.d("pricing_config_error -> ${err.response}");
    return ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  @override
  Future<Either<ErrorResponse, PricingConfig>> getPricingConfig() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.pricingConfigUrl,
      );

      AppLog.d("getPricingConfig -> ${response.data}");
      return right(PricingConfig.fromJson(response.data));
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }
}
