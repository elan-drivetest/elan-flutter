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
    required String timezone,

    /// Capture time — when the fix was **taken**, not when it is uploaded.
    ///
    /// A ride's reported distance is now summed from these points ordered by
    /// this field (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §8.5). Omit it and the
    /// server stamps arrival time, so a buffered offline batch replays out of
    /// order and scrambles the track.
    required DateTime timestamp,
  });
}
