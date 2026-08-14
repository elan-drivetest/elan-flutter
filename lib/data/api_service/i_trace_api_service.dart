import 'dart:convert';
import 'package:elan/core/log/app_log.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/data/api_service/trace_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TraceApiService)
class ITraceApiService extends TraceApiService {
  final Dio _client;
  ITraceApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    AppLog.d("error_response -> ${err.response}");
    return ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  @override
  Future<Either<ErrorResponse, Response>> locationTracking(
      {required int rideSessionId,
      required double latitude,
      required double longitude,
      required double accuracy,
      required double speed,
      required double bearing,
      required double altitude,
      required int batteryLevel,
      required String timezone}) async {
    try {
      var data = json.encode({
        "ride_session_id": rideSessionId,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "speed": speed,
        "bearing": bearing,
        "altitude": altitude,
        "battery_level": batteryLevel,
        "timezone": timezone
      });

      Response response = await _client.post(
          Uri.encodeFull(ApiEndpoints.baseUrl + ApiEndpoints.locationTrackingUrl),
          data: data);
      //var result = SuccessResponse.fromJson(response.data);
      AppLog.d("sendLocationGpx -> ${jsonEncode(response.data)}");
      return right(response);
    } on DioException catch (e) {
      AppLog.d("sendLocationGpx_error ->$e");
      return left(checkErrorResponse(e));
    }
  }
}
