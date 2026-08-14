part of 'confirm_email_bloc.dart';

enum ConfirmEmailStatus {
  initial,
  loading,
  success,
  error;
}

@freezed
class ConfirmEmailState with _$ConfirmEmailState {
  const factory ConfirmEmailState({
    @Default(ConfirmEmailStatus.initial) ConfirmEmailStatus status,
    ErrorResponse? errorResponse,
    int? statusCode,
  }) = _ConfirmEmailState;

  factory ConfirmEmailState.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEmailStateFromJson(json);
}
