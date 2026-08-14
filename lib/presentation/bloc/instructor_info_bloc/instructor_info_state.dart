part of 'instructor_info_bloc.dart';

enum InstructorInfoStatus { initial, loading, actionLoading, success, updateSuccess, error }

enum LicenseInfoStatus { complete, incomplete }
enum PaymentInfoStatus { complete, incomplete }
enum CarInfoStatus { complete, incomplete }

@freezed
class InstructorInfoState with _$InstructorInfoState {
  const factory InstructorInfoState({
    @Default(InstructorInfoStatus.initial) InstructorInfoStatus status,
    ErrorResponse? errorResponse,
    Instructor? instructorInfo,
    Vehicle? vehicleInfo,
    User? userInfo,
    @Default(0) int profileCompletePercentage,
    @Default(LicenseInfoStatus.incomplete) LicenseInfoStatus licenseStatus,
    @Default(PaymentInfoStatus.incomplete) PaymentInfoStatus paymentStatus,
    @Default(CarInfoStatus.incomplete) CarInfoStatus vehicleStatus,
  }) = _InstructorInfoState;

  factory InstructorInfoState.fromJson(Map<String, dynamic> json) =>
      _$InstructorInfoStateFromJson(json);
}
