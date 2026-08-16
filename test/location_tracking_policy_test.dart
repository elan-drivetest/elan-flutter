import 'package:elan/data/trace/location_tracking_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final t0 = DateTime.utc(2026, 9, 14, 13, 0, 0);

  bool capture({
    required Duration since,
    required bool fromDisplacement,
  }) =>
      LocationTrackingPolicy.shouldCapture(
        lastCaptureAt: t0,
        now: t0.add(since),
        fromDisplacement: fromDisplacement,
      );

  group('cadence matches the backend contract', () {
    test('10 s floor and a 50 m filter', () {
      // §12.6 — the distance sum is only as good as these two numbers.
      expect(LocationTrackingPolicy.interval, const Duration(seconds: 10));
      expect(LocationTrackingPolicy.distanceFilterMetres, 50);
    });
  });

  group('periodic ticks', () {
    test('fire once the interval has elapsed', () {
      expect(capture(since: const Duration(seconds: 10), fromDisplacement: false),
          isTrue);
      expect(capture(since: const Duration(seconds: 30), fromDisplacement: false),
          isTrue);
    });

    test('are skipped inside the interval', () {
      // A tick landing between two displacement events must not add a
      // redundant point.
      expect(capture(since: const Duration(seconds: 4), fromDisplacement: false),
          isFalse);
      expect(capture(since: const Duration(seconds: 9), fromDisplacement: false),
          isFalse);
    });
  });

  group('displacement events', () {
    test('fire well inside the interval — they already cleared 50 m', () {
      // At 100 km/h, 50 m passes in under two seconds. Dropping these is
      // exactly the under-reading this work fixes.
      expect(capture(since: const Duration(seconds: 2), fromDisplacement: true),
          isTrue);
      expect(capture(since: const Duration(seconds: 5), fromDisplacement: true),
          isTrue);
    });

    test('are still debounced against a simultaneous tick', () {
      expect(
        capture(since: const Duration(milliseconds: 200), fromDisplacement: true),
        isFalse,
      );
    });

    test('the debounce is short enough not to lose highway points', () {
      expect(LocationTrackingPolicy.minGap.inMilliseconds, lessThan(2000));
    });
  });

  group('edge cases', () {
    test('the first capture always proceeds', () {
      expect(
        LocationTrackingPolicy.shouldCapture(
          lastCaptureAt: null,
          now: t0,
          fromDisplacement: false,
        ),
        isTrue,
      );
    });

    test('a backwards clock does not stall tracking', () {
      // Device clock corrections happen; refusing to capture until real time
      // catches up could silently stop a ride's track for minutes.
      expect(
        LocationTrackingPolicy.shouldCapture(
          lastCaptureAt: t0,
          now: t0.subtract(const Duration(minutes: 5)),
          fromDisplacement: false,
        ),
        isTrue,
      );
    });
  });
}
