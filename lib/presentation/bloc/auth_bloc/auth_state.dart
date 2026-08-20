part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  success,

  /// The **server** rejected the session: a 401 or 403 from refresh. This is
  /// the only failure that means "sign in again".
  refreshFailed,

  logout,

  /// A refresh that failed for a reason unrelated to auth — no connection, a
  /// timeout, a 5xx — on a device that has a stored session.
  ///
  /// Treated as signed in. The alternative is throwing an instructor out of the
  /// app because their train went into a tunnel, and the cost of being wrong is
  /// low: the next authenticated request 401s and the interceptor ends the
  /// session properly.
  restoredUnverified,

  error;

  /// Whether this status means the instructor may see the app.
  bool get isAuthenticated =>
      this == AuthStatus.success || this == AuthStatus.restoredUnverified;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    LoginErrorResponse? errorResponse,
    int? statusCode,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
