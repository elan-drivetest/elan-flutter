part of 'reset_password_bloc.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  error;
}

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(ResetPasswordStatus.initial) ResetPasswordStatus status,
    LoginErrorResponse? errorResponse,
    int? statusCode,
    String? message,
    @JsonKey(name: 'phone_hint') String? phoneHint,
  }) = _ResetPasswordState;

  factory ResetPasswordState.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordStateFromJson(json);
}