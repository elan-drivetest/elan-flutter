import 'package:elan/core/money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Money.format', () {
    test('renders integer cents as dollars', () {
      expect(Money.format(9240), r'$92.40');
      expect(Money.format(100), r'$1.00');
      expect(Money.format(1), r'$0.01');
      expect(Money.format(0), r'$0.00');
    });

    test('regression: a dashboard balance is not rendered 100x too large', () {
      // `available_balance` / `withdrawn` / `wallet_balance` are integer cents
      // (BUSINESS_LOGIC.md §10). These were rendered raw, so $266.67 showed as
      // "$26667". Guard the conversion explicitly.
      expect(Money.format(26667), r'$266.67');
      expect(Money.format(26667), isNot(contains('26667')));
    });

    test('null degrades to zero rather than throwing', () {
      expect(Money.format(null), r'$0.00');
    });

    test('always keeps exactly two decimal places', () {
      expect(Money.format(1000), r'$10.00');
      expect(Money.format(1050), r'$10.50');
      expect(Money.format(1005), r'$10.05');
    });
  });

  group('Money.amount', () {
    test('omits the currency symbol', () {
      expect(Money.amount(26667), '266.67');
      expect(Money.amount(null), '0.00');
    });
  });

  group('Money.rate', () {
    test('renders cents-per-hour as an hourly rate', () {
      // instructor_rate is cents/hour: 4000 -> $40.00/hr (BUSINESS_LOGIC.md §2).
      expect(Money.rate(4000), r'$40.00/hr');
      expect(Money.rate(6000), r'$60.00/hr');
      expect(Money.rate(8000), r'$80.00/hr');
    });

    test('null degrades to zero', () {
      expect(Money.rate(null), r'$0.00/hr');
    });
  });

  group('Money.formatWithCurrency', () {
    test('names the currency for referral copy', () {
      expect(Money.formatWithCurrency(10000), r'$100.00 CAD');
      expect(Money.formatWithCurrency(12000), r'$120.00 CAD');
    });
  });

  group('Money.formatOrDash', () {
    test('shows a dash when the value is genuinely absent', () {
      // /v1/rides/upcoming returns a plain booking with no ride_price, so an
      // absent value must not read as a job worth nothing.
      expect(Money.formatOrDash(null), '--');
    });

    test('distinguishes absent from zero', () {
      expect(Money.formatOrDash(null), '--');
      expect(Money.formatOrDash(0), r'$0.00');
    });

    test('formats a present value normally', () {
      expect(Money.formatOrDash(7416), r'$74.16');
    });

    test('honours a custom placeholder', () {
      expect(Money.formatOrDash(null, dash: 'n/a'), 'n/a');
    });
  });
}
