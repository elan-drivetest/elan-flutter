import 'package:elan/core/ride_earnings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('jobPay — the board number is the payout', () {
    test('renders the server figure with no hedging copy', () {
      // Pay is frozen onto the ride at accept, so there is nothing to caption.
      // The old "Est. — actual pay is on the clock" would now be false.
      final label = RideEarnings.jobPay(ridePriceCents: 14400);
      expect(label.amount, r'$144.00');
      expect(label.caption, isNull);
    });

    test('a meet-at-centre job shows the flat base, not a rate', () {
      // No pickup leg, so transportation is 0 and the job pays the base alone
      // — a real number, where this used to advertise $0.00.
      final label = RideEarnings.jobPay(ridePriceCents: 12000);
      expect(label.amount, r'$120.00');
      expect(label.caption, isNull);
    });

    test('absent pay shows a dash, not zero', () {
      // /rides/upcoming returns a plain booking with no ride_price attached.
      expect(RideEarnings.jobPay(ridePriceCents: null).amount, '--');
    });

    test('a genuine zero is rendered, not swallowed', () {
      expect(RideEarnings.jobPay(ridePriceCents: 0).amount, r'$0.00');
    });
  });

  group('settled — a finished ride', () {
    test('shows instructorEarnings as-is', () {
      // Written at accept now, not by the payout cron, so it is correct the
      // moment the ride appears in history.
      final label = RideEarnings.settled(instructorEarningsCents: 14400);
      expect(label.amount, r'$144.00');
      expect(label.caption, isNull);
    });

    test('no client-side arithmetic fills a missing total', () {
      // The old fallback multiplied wall-clock hours by the live rate. Under
      // the flat-base model that misses $120.00, so "Pending" is the only
      // honest answer.
      expect(
        RideEarnings.settled(instructorEarningsCents: null).amount,
        'Pending',
      );
      expect(
        RideEarnings.settled(instructorEarningsCents: 0).amount,
        'Pending',
      );
    });
  });
}
