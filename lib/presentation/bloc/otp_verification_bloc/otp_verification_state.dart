part of 'otp_verification_bloc.dart';

enum OtpVerificationStatus { initial, loading, success, error, resendLoading, resendSuccess, resendError }

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    @Default(OtpVerificationStatus.initial) OtpVerificationStatus status,
    VerificationErrorResponse? errorResponse,
    String? message,
    String? token,
  }) = _OtpVerificationState;
}
