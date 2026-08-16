import 'package:elan/core/ride_earnings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('estimate — no meet-at-centre special case any more', () {
    test('a meet-at-centre job shows the server figure, not a rate', () {
      // The server now quotes test_duration_hours (~1 h) instead of $0
      // (§14.3, fixed backend-side), so substituting "paid on the clock" copy
      // would contradict a real number.
      final label = RideEarnings.estimate(ridePriceCents: 4000);
      expect(label.amount, r'$40.00');
      expect(label.caption, contains('actual pay is on the clock'));
    });

    test('a zero estimate is no longer special-cased away', () {
      // If a 0 ever arrives now it is genuinely 0, not the old artefact.
      expect(RideEarnings.estimate(ridePriceCents: 0).amount, r'$0.00');
    });
  });

  group('estimate — pickup rides', () {
    test('shows the server estimate and says it is one', () {
      final label = RideEarnings.estimate(ridePriceCents: 832);
      expect(label.amount, r'$8.32');
      expect(label.caption, contains('actual pay is on the clock'));
    });

    test('absent estimate shows a dash, not zero', () {
      // /rides/upcoming does not enrich, so ride_price is simply missing there.
      final label = RideEarnings.estimate(ridePriceCents: null);
      expect(label.amount, '--');
    });
  });

  group('settled — a paid ride', () {
    test('shows the real figure with no estimate hedging', () {
      final label = RideEarnings.settled(
        instructorEarningsCents: 6400,
        totalHours: 0.8,
        hourlyRateCents: 8000,
        rateIsRideSnapshot: false,
      );
      expect(label.amount, r'$64.00');
      expect(label.isEstimate, isFalse);
      expect(label.caption, isNull);
    });
  });

  group('settled — which rate the preview used', () {
    // hourly_rate is snapshotted onto the session at accept so a later admin
    // change cannot reprice a held job (§7.2). The current global rate and a
    // ride's own rate can therefore disagree — by 2x for any session created
    // before the §14.9 fix, which kept the 8000 column default.
    test('a ride-snapshot rate is reported plainly', () {
      final label = RideEarnings.settled(
        instructorEarningsCents: 0,
        totalHours: 1,
        hourlyRateCents: 4000,
        rateIsRideSnapshot: true,
      );
      expect(label.amount, r'$40.00');
      expect(label.caption, 'Pending payout');
    });

    test('a global rate says so, because it may not be this one', () {
      final label = RideEarnings.settled(
        instructorEarningsCents: 0,
        totalHours: 1,
        hourlyRateCents: 4000,
        rateIsRideSnapshot: false,
      );
      expect(label.amount, r'$40.00');
      expect(label.caption, 'Pending — at current rate');
    });

    test('provenance is irrelevant once the payout has actually run', () {
      for (final fromRide in [true, false]) {
        final label = RideEarnings.settled(
          instructorEarningsCents: 6400,
          totalHours: 1,
          hourlyRateCents: 4000,
          rateIsRideSnapshot: fromRide,
        );
        expect(label.amount, r'$64.00');
        expect(label.caption, isNull);
        expect(label.isEstimate, isFalse);
      }
    });
  });

  group('settled — payout pending', () {
    test('previews hours x rate rather than reporting \$0.00', () {
      // instructor_earnings stays 0 until the cron runs, up to 7 days (§14.6).
      final label = RideEarnings.settled(
        instructorEarningsCents: 0,
        totalHours: 0.8,
        hourlyRateCents: 8000,
        rateIsRideSnapshot: true,
      );
      expect(label.amount, r'$64.00');
      expect(label.isEstimate, isTrue);
      expect(label.caption, 'Pending payout');
    });

    test('rounds to whole cents', () {
      final label = RideEarnings.settled(
        instructorEarningsCents: 0,
        totalHours: 1.0 / 3.0,
        hourlyRateCents: 6000,
        rateIsRideSnapshot: false,
      );
      expect(label.amount, r'$20.00');
    });

    test('says Pending when there is nothing to compute from', () {
      expect(
        RideEarnings.settled(
          instructorEarningsCents: 0,
          totalHours: null,
          hourlyRateCents: 8000,
          rateIsRideSnapshot: false,
        ).amount,
        'Pending',
      );
      expect(
        RideEarnings.settled(
          instructorEarningsCents: 0,
          totalHours: 0.8,
          hourlyRateCents: null,
          rateIsRideSnapshot: false,
        ).amount,
        'Pending',
      );
    });

    test('a zero-length ride does not preview a zero payout', () {
      expect(
        RideEarnings.settled(
          instructorEarningsCents: 0,
          totalHours: 0,
          hourlyRateCents: 8000,
          rateIsRideSnapshot: false,
        ).amount,
        'Pending',
      );
    });
  });
}
