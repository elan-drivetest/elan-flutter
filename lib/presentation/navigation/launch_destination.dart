import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';

/// Where a cold start ends up.
enum LaunchDestination {
  /// Not enough is known yet — keep showing the brand mark.
  undecided,

  dashboard,

  /// Stay on the splash route and show the carousel. It routes to login itself
  /// when the instructor finishes it.
  onboarding,

  login,
}

/// Resolves the launch destination from the two checks a cold start runs.
///
/// Pulled out of `SplashPage` as a pure function because the bug it encodes was
/// a routing rule, not a rendering one: onboarding and auth used to be nested
/// inside a single `if`, so the app only ever checked the session on the
/// already-onboarded branch. Any launch that could not find the onboarding flag
/// — a reinstall, a cleared store, or the storage-backend mismatch this shipped
/// alongside — walked a signed-in instructor through the carousel and left them
/// at a login screen with perfectly good cookies on disk.
///
/// [hasSeenOnboarding] is null while the flag is still being read. The two
/// checks finish in an unpredictable order, so every combination has to have an
/// answer — including "wait".
LaunchDestination resolveLaunchDestination({
  required AuthStatus authStatus,
  required bool? hasSeenOnboarding,
}) {
  // A signed-in instructor never sees onboarding, first launch or not. Checked
  // before the flag is even consulted: that ordering *is* the fix.
  if (authStatus.isAuthenticated) return LaunchDestination.dashboard;

  switch (authStatus) {
    case AuthStatus.initial:
    case AuthStatus.loading:
      return LaunchDestination.undecided;

    case AuthStatus.refreshFailed:
    case AuthStatus.error:
    case AuthStatus.logout:
      // Waiting rather than defaulting: guessing "seen" would flash the login
      // screen over the carousel on a slow storage read, and guessing "unseen"
      // would show the carousel to a returning user for a frame.
      if (hasSeenOnboarding == null) return LaunchDestination.undecided;
      return hasSeenOnboarding
          ? LaunchDestination.login
          : LaunchDestination.onboarding;

    case AuthStatus.success:
    case AuthStatus.restoredUnverified:
      // Unreachable — isAuthenticated covers both above. Named explicitly so
      // adding a status to the enum breaks the switch instead of silently
      // falling through to a default.
      return LaunchDestination.dashboard;
  }
}
