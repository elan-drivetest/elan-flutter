part of 'registration_bloc.dart';


enum RegistrationStatus {
  initial,
  loading,
  success,
  error;
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(RegistrationStatus.initial) RegistrationStatus status,
    RegisterErrorResponse? errorResponse,
    int? statusCode,
    String? message,
    @JsonKey(name: 'phone_hint') String? phoneHint,
  }) = _RegistrationState;

  factory RegistrationState.fromJson(Map<String, dynamic> json) =>
      _$RegistrationStateFromJson(json);
}