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
      required String timezone,
      required DateTime timestamp}) async {
    try {
      final data = json.encode({
        "ride_session_id": rideSessionId,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "speed": speed,
        "bearing": bearing,
        "altitude": altitude,
        "battery_level": batteryLevel,
        "timezone": timezone,
        // Capture time, not upload time. The server sorts the track by this and
        // clamps anything in the future or before the session started, so a
        // skewed device clock cannot distort the distance sum (§8.5).
        "timestamp": timestamp.toUtc().toIso8601String(),
      });

      final Response response = await _client.post(
          Uri.encodeFull(
              ApiEndpoints.baseUrl + ApiEndpoints.locationTrackingUrl),
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
