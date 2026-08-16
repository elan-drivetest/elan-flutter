import 'dart:convert';
import 'package:elan/core/log/app_log.dart';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/data/api_service/user_api_service.dart';
import 'package:elan/domain/accept_response/accept_response.dart';
import 'package:elan/domain/complete_ride_response/complete_ride_response.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/file_response/file_response.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:elan/domain/common/earnings/earnings_summary.dart';
import 'package:elan/domain/referral_code_response/referral_code_response.dart';
import 'package:elan/domain/referral_code_summary_response/referral_code_summary_response.dart';
import 'package:elan/domain/ride_response/ride_response.dart';
import 'package:elan/domain/ride_session/ride_session.dart';
import 'package:elan/domain/stripe_onboard_response/stripe_onboard_response.dart';
import 'package:elan/domain/stripe_onboard_url_response/stripe_onboard_url_response.dart';
import 'package:elan/domain/transfer_response/transfer_response.dart';
import 'package:elan/domain/vehicle_request_response/vehicle_request_response.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

@LazySingleton(as: UserApiService)
class IUserApiService extends UserApiService {
  final Dio dio;
  IUserApiService(this.dio);

  ErrorResponse checkResponseError(DioException err) {
    AppLog.d("user_api_error -> ${err.response}");
    return ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  DioMediaType _getDioMediaType(String fileExtension) {
    switch (fileExtension) {
      case 'jpg':
      case 'jpeg':
        return DioMediaType('image', 'jpeg');
      case 'png':
        return DioMediaType('image', 'png');
      case 'gif':
        return DioMediaType('image', 'gif');
      case 'webp':
        return DioMediaType('image', 'webp');
      case 'pdf':
        return DioMediaType('application', 'pdf');
      default:
        return DioMediaType('application', 'octet-stream');
    }
  }

  @override
  Future<Either<ErrorResponse, FileResponse>> fileUpload({
    required File file,
  }) async {
    try {
      // Validate file extension (from the path, not name)
      final fileExtension =
          path.extension(file.path).replaceFirst('.', '').toLowerCase();
      final allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'pdf'];

      if (!allowedExtensions.contains(fileExtension)) {
        return left(ErrorResponse(
          message:
              'Invalid file type. Only images (JPEG, PNG, GIF, WebP) and PDF files are allowed.',
          statusCode: 400,
        ));
      }

      final filename = path.basename(file.path);

      // Prepare FormData
      final data = FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(
            file.path,
            filename: filename,
            contentType: _getDioMediaType(fileExtension),
          ),
        ],
      });

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.fileUploadUrl,
        data: data,
      );
      AppLog.d("Upload success: ${response.statusCode}");
      final fileResponse = FileResponse.fromJson(response.data);

      return right(fileResponse);
    } on DioException catch (e) {
      AppLog.d("File upload error: ${e.message}");
      AppLog.d("Error type: ${e.type}");
      AppLog.d("Error response: ${e.response}");

      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, InstructorResponse>> getInstructorInfo() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.instructorInfoUrl,
      );

      AppLog.d("get_instructor_check -> ${response.data}");
      AppLog.d("get_instructor_header -> ${response.headers}");
      var result = InstructorResponse.fromJson(response.data);
      AppLog.d(
          "get_instructor_header -> ${result.instructor?.profileCompletionPercentage}");
      return right(result);
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, InstructorResponse>> updateInstructorInfo(
      {required Map<String, String> params}) async {
    try {
      AppLog.d("update_instructor_info_check -> fields: ${params.toString()}");

      final response = await dio.patch(
          ApiEndpoints.baseUrl + ApiEndpoints.patchInstructorInfoUrl,
          data: params);

      AppLog.d("update_instructor_check -> ${response.data}");
      var result = InstructorResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("update_instructor_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, VehicleRequestResponse>> updateVehicleInfo(
      {required Map<String, String> params}) async {
    try {
      AppLog.d("update_vehicle_info_check -> fields: ${params.toString()}");

      final response = await dio.post(
          ApiEndpoints.baseUrl + ApiEndpoints.updateInstructorVehicleInfoUrl,
          data: params);

      AppLog.d("update_vehicle_check -> ${response.data}");
      var result = VehicleRequestResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("update_vehicle_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> getAvailableRides(
      {required int? limit, required String? cursor}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl +
            ApiEndpoints.getAvailableRidesUrl,
          queryParameters: {
            'limit': limit,
            'cursor': cursor,
          }
      );
      AppLog.d("getAvailableRides -> ${response.data}");
      var result = RideResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getAvailableRides_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> searchAvailableRides(
      {required int? limit, required String? cursor, required String query}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl +
            ApiEndpoints.getAvailableRidesUrl,
        queryParameters: {
          'limit': limit,
          'cursor': cursor,
          'search': query
        }
      );
      AppLog.d("getAvailableRides -> ${response.data}");
      var result = RideResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getAvailableRides_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, StripeOnboardResponse>>
      getStripeOnboardInfo() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.getStripeStatusUrl,
      );
      AppLog.d("getStripeOnboardInfo -> ${response.data}");
      var result = StripeOnboardResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getStripeOnboardInfo_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, StripeOnboardUrlResponse>>
      requestStripeOnboardUrl() async {
    try {
      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.requestStripeUrl,
      );
      AppLog.d("requestStripeOnboardUrl -> ${response.data}");
      var result = StripeOnboardUrlResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("requestStripeOnboardUrl_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, AcceptResponse>> acceptRide(
      {required int? id}) async {
    try {
      var data = json.encode({"booking_id": id});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.acceptRideUrl,
        data: data,
      );
      AppLog.d("acceptRide_success: ${response.data}");
      final result = AcceptResponse.fromJson(response.data);

      return right(result);
    } on DioException catch (e) {
      AppLog.d("acceptRide_response: ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> getUpcomingRides(
      {required int? limit}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.getUpcomingRidesUrl(limit: limit),
      );
      AppLog.d("getUpcomingRides -> ${response.data}");
      var result = RideResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getUpcomingRides_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Response>> startRide({
    required int bookingId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required double speed,
    required double bearing,
    required double altitude,
    required int batteryLevel,
    required String timezone,
  }) async {
    try {
      final params = {
        "booking_id": bookingId,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "speed": speed,
        "bearing": bearing,
        "altitude": altitude,
        "battery_level": batteryLevel,
        "timezone": timezone,
      };

      AppLog.d("start_ride_request -> $params");

      final response = await dio.patch(
        ApiEndpoints.startRideUrl,
        data: params,
      );

      AppLog.d("start_ride_response -> ${response.data}");

      return right(response);
    } on DioException catch (e) {
      AppLog.d("start_ride_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, TransferResponse>> transferRide(
      {required int? id, required String? reason}) async {
    try {
      var data = json.encode({"booking_id": id, "transfer_reason": reason});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.transferRideUrl,
        data: data,
      );
      AppLog.d("transferRide_success: ${response.data}");
      final result = TransferResponse.fromJson(response.data);

      return right(result);
    } on DioException catch (e) {
      AppLog.d("transferRide_response: ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeSummaryResponse>> getReferralCodeSummary() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.referralCodeSummaryUrl,
      );
      AppLog.d("getReferralCodeSummary_success: ${response.data}");
      final result = ReferralCodeSummaryResponse.fromJson(response.data);

      return right(result);
    } on DioException catch (e) {
      AppLog.d("getReferralCodeSummary_error: ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Response>> claimReferralCode(
      {required String? code}) async {

    try {
      var data = json.encode({"code": code});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.claimReferralCodesUrl,
        data: data,
      );
      AppLog.d("claim_code_success: ${response.data}");

      return right(response);
    } on DioException catch (e) {
      AppLog.d("claim_code_error: ${e.response}");
      return left(checkResponseError(e));
    }

  }

  @override
  Future<Either<ErrorResponse, Response>> generateReferralCode(
      {required int? amount}) async {
    try {
      var data =
      json.encode({"amount": amount});

      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.generateReferralCodeUrl,
        data: data,
      );
      AppLog.d("refer_codeRide_success: ${response.data}");
      //final result = TransferResponse.fromJson(response.data);

      return right(response);
    } on DioException catch (e) {
      AppLog.d("refer_codeRide_response: ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeResponse>> getClaimReferralCodes(
      {required String? cursor, required int? limit}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl +
            ApiEndpoints.getCompletedRidesUrl(limit: limit, cursor: cursor),
      );
      AppLog.d("getClaimedCodes -> ${response.data}");
      var result = ReferralCodeResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getClaimedCodes_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeResponse>> getGenerateReferralCodes(
      {required String? cursor, required int? limit}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl +
            ApiEndpoints.getGenerateReferralCodesUrl(limit: limit),
      );
      AppLog.d("getGenerateReferralCodes -> ${response.data}");
      var result = ReferralCodeResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getGenerateReferralCodes_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CompleteRideResponse>> getCompletedRides(
      {required int? limit, required String? cursor}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl +
            ApiEndpoints.getCompletedRidesUrl(limit: limit, cursor: cursor),
      );
      AppLog.d("getCompleteRides -> ${response.data}");
      var result = CompleteRideResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getCompleteRides_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RideSession>> getCurrentActiveRide() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.currentRideUrl,
      );

      AppLog.d("get_current_rides -> ${jsonEncode(response.data)}");

      final data = response.data;

      // Case 1: backend returns empty string -> no active ride
      if (data == null || data == "" || (data is String && data.isEmpty)) {
        return left(const ErrorResponse(
          message: "No active ride found",
          statusCode: 404,
        ));
      }

      // Case 2: valid JSON object
      if (data is Map<String, dynamic>) {
        final result = RideSession.fromJson(data);
        return right(result);
      }

      // Case 3: unexpected format
      return left(const ErrorResponse(
        message: "Invalid response format from server",
        statusCode: 500,
      ));
    } on DioException catch (e) {
      AppLog.d("getCurrent_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Response<dynamic>>> stopRide(
      {required int? id, required double? lat, required double? lon}) async {
    try {
      var data =
          json.encode({"ride_id": id, "latitude": lat, "longitude": lon});

      final response = await dio.patch(
        ApiEndpoints.baseUrl + ApiEndpoints.stopRideUrl,
        data: data,
      );
      AppLog.d("stopRide_success: ${response.data}");
      //final result = TransferResponse.fromJson(response.data);

      return right(response);
    } on DioException catch (e) {
      AppLog.d("stopRide_response: ${e.response}");
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, EarningsSummary>> getEarningsSummary() async {
    try {
      final response = await dio.get(
        ApiEndpoints.baseUrl + ApiEndpoints.instructorDashboardUrl,
      );

      AppLog.d("getEarningsSummary -> ${response.data}");
      var result = EarningsSummary.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      AppLog.d("getEarningsSummary_error -> ${e.response}");
      return left(checkResponseError(e));
    }
  }
}
