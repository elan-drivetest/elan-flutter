import 'package:elan/core/ride_windows.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fixed reference point so every case is deterministic.
final _now = DateTime.utc(2026, 8, 15, 12, 0, 0);

DateTime _inHours(double h) =>
    _now.add(Duration(microseconds: (h * Duration.microsecondsPerHour).round()));

void main() {
  group('RideWindows.hoursUntil', () {
    test('measures fractional hours ahead', () {
      expect(RideWindows.hoursUntil(_inHours(6), now: _now), closeTo(6.0, 1e-9));
      expect(RideWindows.hoursUntil(_inHours(2.5), now: _now), closeTo(2.5, 1e-9));
    });

    test('goes negative once the test date has passed', () {
      expect(RideWindows.hoursUntil(_inHours(-3), now: _now), closeTo(-3.0, 1e-9));
    });

    test('compares in UTC regardless of the input offset', () {
      final local = _inHours(6).toLocal();
      expect(RideWindows.hoursUntil(local, now: _now), closeTo(6.0, 1e-9));
    });
  });

  group('RideWindows.canStart', () {
    // Server: throws when `diff > startWindowHours` -> allowed at diff <= window.
    test('blocked while the test is further away than the window', () {
      expect(
        RideWindows.canStart(
            testDate: _inHours(6.1), startWindowHours: 6, now: _now),
        isFalse,
      );
    });

    test('allowed exactly at the boundary', () {
      expect(
        RideWindows.canStart(
            testDate: _inHours(6), startWindowHours: 6, now: _now),
        isTrue,
      );
    });

    test('allowed inside the window', () {
      expect(
        RideWindows.canStart(
            testDate: _inHours(1), startWindowHours: 6, now: _now),
        isTrue,
      );
    });

    test('still allowed after the test date — the server sets no lower bound', () {
      expect(
        RideWindows.canStart(
            testDate: _inHours(-2), startWindowHours: 6, now: _now),
        isTrue,
      );
    });

    test('follows the configured window, not a hardcoded 6', () {
      // An admin widening the window must immediately enable the button.
      expect(
        RideWindows.canStart(
            testDate: _inHours(10), startWindowHours: 6, now: _now),
        isFalse,
      );
      expect(
        RideWindows.canStart(
            testDate: _inHours(10), startWindowHours: 12, now: _now),
        isTrue,
      );
    });

    test('a missing test date is not startable', () {
      expect(
        RideWindows.canStart(
            testDate: null, startWindowHours: 6, now: _now),
        isFalse,
      );
    });
  });

  group('RideWindows.canTransfer', () {
    // Server: throws when `diff <= transferCutoffHours` -> allowed at diff > cutoff.
    test('allowed while the start is further away than the cutoff', () {
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(6.1), transferCutoffHours: 6, now: _now),
        isTrue,
      );
    });

    test('blocked exactly at the boundary', () {
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(6), transferCutoffHours: 6, now: _now),
        isFalse,
      );
    });

    test('blocked inside the cutoff and after the test date', () {
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(1), transferCutoffHours: 6, now: _now),
        isFalse,
      );
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(-1), transferCutoffHours: 6, now: _now),
        isFalse,
      );
    });

    test('follows the configured cutoff, not a hardcoded 6', () {
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(8), transferCutoffHours: 6, now: _now),
        isTrue,
      );
      expect(
        RideWindows.canTransfer(
            testDate: _inHours(8), transferCutoffHours: 12, now: _now),
        isFalse,
      );
    });

    test('a missing test date is not transferable', () {
      expect(
        RideWindows.canTransfer(
            testDate: null, transferCutoffHours: 6, now: _now),
        isFalse,
      );
    });
  });

  group('the two gates at a shared boundary', () {
    test('are exact complements when window == cutoff', () {
      // At diff == 6 with both settings at 6 the server permits Start and
      // rejects Transfer, so the UI must do the same.
      final testDate = _inHours(6);
      expect(
        RideWindows.canStart(
            testDate: testDate, startWindowHours: 6, now: _now),
        isTrue,
      );
      expect(
        RideWindows.canTransfer(
            testDate: testDate, transferCutoffHours: 6, now: _now),
        isFalse,
      );
    });
  });
}
