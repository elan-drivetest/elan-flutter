part of 'otp_verification_bloc.dart';

@freezed
class OtpVerificationEvent with _$OtpVerificationEvent {
  const factory OtpVerificationEvent.verify({
    required String email,
    required String otp,
    required bool isForgotPassword,
  }) = _Verify;

  const factory OtpVerificationEvent.resend({
    required String email,
  }) = _Resend;
}
