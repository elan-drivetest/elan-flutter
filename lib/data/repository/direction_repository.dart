import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/core/error/friendly_error_messages.dart';
import 'package:elan/data/api_service/google_maps_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

typedef DirectionResult = ({List<LatLng> points, String distance, String duration});

abstract class DirectionRepository {
  final GoogleMapsApiService apiService;

  DirectionRepository(this.apiService);

  Future<Either<ErrorResponse, DirectionResult>> getDirections({
    required LatLng origin,
    required LatLng destination,
  });
}

@LazySingleton(as: DirectionRepository)
class IDirectionRepository extends DirectionRepository {
  IDirectionRepository(super.apiService);

  @override
  Future<Either<ErrorResponse, DirectionResult>> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final result = await apiService.getDirections(origin, destination);
      if (result.points.isNotEmpty) {
        return right(result);
      } else {
        return left(const ErrorResponse(message: "No route found"));
      }
    } on DioException catch (e) {
      final err = ApiErrorMapper.toAppError(e);
      return left(ErrorResponse(statusCode: err.statusCode, message: err.message));
    } catch (_) {
      return left(const ErrorResponse(message: FriendlyErrorMessages.generic));
    }
  }
}
