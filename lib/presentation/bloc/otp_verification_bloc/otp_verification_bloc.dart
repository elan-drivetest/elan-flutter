import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/domain/verification_error_response/verification_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';
part 'otp_verification_bloc.freezed.dart';

@injectable
class OtpVerificationBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final AuthRepository repository;

  OtpVerificationBloc(this.repository) : super(const OtpVerificationState()) {
    on<_Verify>(_onVerify);
    on<_Resend>(_onResend);
  }

  Future<void> _onVerify(
    _Verify event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(state.copyWith(status: OtpVerificationStatus.loading));

    final result = event.isForgotPassword
        ? await repository.verifyForgotPasswordOtp(email: event.email, otp: event.otp)
        : await repository.verifyOtp(email: event.email, otp: event.otp);

    result.fold(
      (VerificationErrorResponse error) {
        emit(
          state.copyWith(
            status: OtpVerificationStatus.error,
            errorResponse: error,
          ),
        );
      },
      (response) {
        final data = response.data;
        emit(
          state.copyWith(
            status: OtpVerificationStatus.success,
            message: data?['message']?.toString(),
            token: data?['token']?.toString(),
          ),
        );
      },
    );
  }

  Future<void> _onResend(
    _Resend event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(state.copyWith(status: OtpVerificationStatus.resendLoading));

    final result = await repository.resendOtp(email: event.email);

    result.fold(
      (VerificationErrorResponse error) {
        emit(
          state.copyWith(
            status: OtpVerificationStatus.resendError,
            errorResponse: error,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: OtpVerificationStatus.resendSuccess,
            message: "OTP resent successfully",
          ),
        );
      },
    );
  }
}
