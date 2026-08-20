part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required String email, required String password}) = _Login;
  const factory AuthEvent.refresh() = _Refresh;
  const factory AuthEvent.logout() = _Logout;

  /// The server has just issued auth cookies outside the login flow.
  ///
  /// `POST /v1/auth/instructor/otp/verify` ends with `issueAuthCookies`
  /// (`auth.service.ts:906`), so a freshly verified instructor is already
  /// signed in by the time the OTP screen sees the response. This tells the
  /// bloc to adopt that session — record the marker and start the refresh
  /// timer — rather than bouncing them to a login form for credentials they
  /// just proved.
  const factory AuthEvent.sessionEstablished() = _SessionEstablished;
}
