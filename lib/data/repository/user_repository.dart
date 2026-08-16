import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

abstract class UserRepository {
  final UserApiService userApiService;

  UserRepository(this.userApiService);

  Future<Either<ErrorResponse, FileResponse>> fileUpload({required File file});
  Future<Either<ErrorResponse, InstructorResponse>> getInstructorInfo();
  Future<Either<ErrorResponse, InstructorResponse>> updateInstructorInfo(
      {required Map<String, String> params});

  Future<Either<ErrorResponse, VehicleRequestResponse>> updateVehicleInfo(
      {required Map<String, String> params});

  Future<Either<ErrorResponse, RideResponse>> getAvailableRides(
      {required int? limit, required String? cursor});
  Future<Either<ErrorResponse, CompleteRideResponse>> getCompletedRides(
      {required int? limit, required String? cursor});
  Future<Either<ErrorResponse, RideResponse>> searchAvailableRides(
      {required int? limit, required String? cursor, required String query});

  Future<Either<ErrorResponse, StripeOnboardResponse>> getStripeOnboardInfo();
  Future<Either<ErrorResponse, StripeOnboardUrlResponse>>
      requestStripeOnboardUrl();

  /// ride api
  Future<Either<ErrorResponse, RideResponse>> getUpcomingRides(
      {required int? limit});
  Future<Either<ErrorResponse, AcceptResponse>> acceptRide({required int? id});
  Future<Either<ErrorResponse, TransferResponse>> transferRide(
      {required int? id, required String? reason});

  Future<Either<ErrorResponse, RideSession>> getCurrentActiveRide();
  Future<Either<ErrorResponse, Response<dynamic>>> stopRide(
      {required int? id, required double? lat, required double? lon});
  Future<Either<ErrorResponse, Response<dynamic>>> startRide({
    required int bookingId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required double speed,
    required double bearing,
    required double altitude,
    required int batteryLevel,
    required String timezone,
  });

  /// referral code
  Future<Either<ErrorResponse, ReferralCodeSummaryResponse>> getReferralCodeSummary();
  Future<Either<ErrorResponse, ReferralCodeResponse>> getGenerateReferralCodes(
      {required String? cursor, required int? limit});
  Future<Either<ErrorResponse, Response<dynamic>>> generateReferralCode(
      {required int? amount});
  Future<Either<ErrorResponse, ReferralCodeResponse>> getClaimReferralCodes(
      {required String? cursor, required int? limit});
  Future<Either<ErrorResponse, Response<dynamic>>> claimReferralCode(
      {required String? code});

  /// earnings
  Future<Either<ErrorResponse, EarningsSummary>> getEarningsSummary();
}

@LazySingleton(as: UserRepository)
class IUserRepository extends UserRepository {
  IUserRepository(super.userApiService);

  @override
  Future<Either<ErrorResponse, FileResponse>> fileUpload({required File file}) {
    return userApiService.fileUpload(file: file);
  }

  @override
  Future<Either<ErrorResponse, InstructorResponse>> getInstructorInfo() {
    return userApiService.getInstructorInfo();
  }

  @override
  Future<Either<ErrorResponse, InstructorResponse>> updateInstructorInfo(
      {required Map<String, String> params}) {
    return userApiService.updateInstructorInfo(params: params);
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> getAvailableRides(
      {required int? limit, required String? cursor}) {
    return userApiService.getAvailableRides(limit: limit, cursor: cursor);
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> searchAvailableRides(
      {required int? limit, required String? cursor, required String query}) {
    return userApiService.searchAvailableRides(
        limit: limit, cursor: cursor, query: query);
  }

  @override
  Future<Either<ErrorResponse, StripeOnboardResponse>> getStripeOnboardInfo() {
    return userApiService.getStripeOnboardInfo();
  }

  @override
  Future<Either<ErrorResponse, StripeOnboardUrlResponse>>
      requestStripeOnboardUrl() {
    return userApiService.requestStripeOnboardUrl();
  }

  @override
  Future<Either<ErrorResponse, VehicleRequestResponse>> updateVehicleInfo(
      {required Map<String, String> params}) {
    return userApiService.updateVehicleInfo(params: params);
  }

  @override
  Future<Either<ErrorResponse, AcceptResponse>> acceptRide({required int? id}) {
    return userApiService.acceptRide(id: id);
  }

  @override
  Future<Either<ErrorResponse, RideResponse>> getUpcomingRides(
      {required int? limit}) {
    return userApiService.getUpcomingRides(limit: limit);
  }

  @override
  Future<Either<ErrorResponse, TransferResponse>> transferRide(
      {required int? id, required String? reason}) {
    return userApiService.transferRide(id: id, reason: reason);
  }

  @override
  Future<Either<ErrorResponse, Response>> claimReferralCode(
      {required String? code}) {
    return userApiService.claimReferralCode(code: code);
  }

  @override
  Future<Either<ErrorResponse, Response>> generateReferralCode(
      {required int? amount}) {
    return userApiService.generateReferralCode(amount: amount);
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeResponse>> getClaimReferralCodes(
      {required String? cursor, required int? limit}) {
    return userApiService.getClaimReferralCodes(cursor: cursor, limit: limit);
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeSummaryResponse>> getReferralCodeSummary() {
    return userApiService.getReferralCodeSummary();
  }

  @override
  Future<Either<ErrorResponse, ReferralCodeResponse>> getGenerateReferralCodes(
      {required String? cursor, required int? limit}) {
    return userApiService.getGenerateReferralCodes(
        cursor: cursor, limit: limit);
  }

  @override
  Future<Either<ErrorResponse, Response>> startRide(
      {required int bookingId,
      required double latitude,
      required double longitude,
      required double accuracy,
      required double speed,
      required double bearing,
      required double altitude,
      required int batteryLevel,
      required String timezone}) {
    return userApiService.startRide(
        bookingId: bookingId,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        speed: speed,
        bearing: bearing,
        altitude: altitude,
        batteryLevel: batteryLevel,
        timezone: timezone);
  }

  @override
  Future<Either<ErrorResponse, CompleteRideResponse>> getCompletedRides(
      {required int? limit, required String? cursor}) {
    return userApiService.getCompletedRides(limit: limit, cursor: cursor);
  }

  @override
  Future<Either<ErrorResponse, RideSession>> getCurrentActiveRide() {
    return userApiService.getCurrentActiveRide();
  }

  @override
  Future<Either<ErrorResponse, Response>> stopRide(
      {required int? id, required double? lat, required double? lon}) {
    return userApiService.stopRide(id: id, lat: lat, lon: lon);
  }

  @override
  Future<Either<ErrorResponse, EarningsSummary>> getEarningsSummary() {
    return userApiService.getEarningsSummary();
  }
}
