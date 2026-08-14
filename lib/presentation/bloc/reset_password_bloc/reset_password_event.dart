part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.reset({required String email}) = _Reset;
  const factory ResetPasswordEvent.submitNewPassword({
    required String hash,
    required String password,
  }) = _SubmitNewPassword;
}