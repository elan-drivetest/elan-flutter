import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/domain/error_response/error_response.dart';

abstract class TraceApiService {

  Future<Either<ErrorResponse, Response<dynamic>>> locationTracking({
    required int rideSessionId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required double speed,
    required double bearing,
    required double altitude,
    required int batteryLevel,
    required String timezone
  });
}
