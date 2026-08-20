import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/navigation/launch_destination.dart';
import 'package:flutter_test/flutter_test.dart';

/// Cover for where a cold start lands.
///
/// The reported bug: log in, close the app, reopen — and get the onboarding
/// carousel followed by the login screen, with a valid session sitting on disk
/// the whole time.
///
/// The cause was that onboarding and auth were nested in one `if`. The session
/// check only ran on the "already onboarded" branch, so losing the onboarding
/// flag for *any* reason also cost you your session. They are unrelated
/// questions, and the first group here is the rule that says so.

void main() {
  group('a signed-in instructor goes to the dashboard', () {
    for (final status in [AuthStatus.success, AuthStatus.restoredUnverified]) {
      test('$status, even on a first launch', () {
        // The regression. `hasSeenOnboarding: false` used to mean the session
        // was never checked at all.
        expect(
          resolveLaunchDestination(
              authStatus: status, hasSeenOnboarding: false),
          LaunchDestination.dashboard,
        );
      });

      test('$status, before the onboarding flag has even been read', () {
        // Auth can settle first. Nothing about the carousel should hold up a
        // restored session.
        expect(
          resolveLaunchDestination(authStatus: status, hasSeenOnboarding: null),
          LaunchDestination.dashboard,
        );
      });

      test('$status, returning user', () {
        expect(
          resolveLaunchDestination(authStatus: status, hasSeenOnboarding: true),
          LaunchDestination.dashboard,
        );
      });
    }
  });

  group('no session', () {
    for (final status in [
      AuthStatus.refreshFailed,
      AuthStatus.error,
      AuthStatus.logout,
    ]) {
      test('$status with onboarding unseen shows the carousel', () {
        expect(
          resolveLaunchDestination(
              authStatus: status, hasSeenOnboarding: false),
          LaunchDestination.onboarding,
        );
      });

      test('$status with onboarding seen goes straight to login', () {
        expect(
          resolveLaunchDestination(authStatus: status, hasSeenOnboarding: true),
          LaunchDestination.login,
        );
      });

      test('$status waits while the onboarding flag is unknown', () {
        // Guessing either way flashes the wrong screen for a frame: "seen"
        // paints login over the carousel, "unseen" shows the carousel to a
        // returning user.
        expect(
          resolveLaunchDestination(authStatus: status, hasSeenOnboarding: null),
          LaunchDestination.undecided,
        );
      });
    }
  });

  group('auth has not settled', () {
    for (final status in [AuthStatus.initial, AuthStatus.loading]) {
      for (final seen in [true, false, null]) {
        test('$status with hasSeenOnboarding=$seen waits', () {
          // Nothing is decided until the refresh answers — including for a
          // first-time user, so a valid session never gets pre-empted by the
          // carousel.
          expect(
            resolveLaunchDestination(
                authStatus: status, hasSeenOnboarding: seen),
            LaunchDestination.undecided,
          );
        });
      }
    }
  });
}
