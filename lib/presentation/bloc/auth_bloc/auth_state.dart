part of 'auth_bloc.dart';


enum AuthStatus {
  initial,
  loading,
  success,
  refreshFailed,
  logout,
  error;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    LoginErrorResponse ? errorResponse,
    int? statusCode,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}