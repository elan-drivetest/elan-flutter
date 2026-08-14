part of 'confirm_email_bloc.dart';

@freezed
class ConfirmEmailEvent with _$ConfirmEmailEvent {
  const factory ConfirmEmailEvent.confirmEmail({required String hash}) = _ConfirmEmail;
}
