import 'package:elan/core/ride_availability.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:flutter_test/flutter_test.dart';

Ride _ride({
  required int id,
  required DateTime testDateUtc,
  String timezone = 'America/Toronto',
}) =>
    Ride(id: id, testDate: testDateUtc, timezone: timezone);

void main() {
  group('one booking per calendar date', () {
    test('a different time on the same date clashes', () {
      // The server rejects regardless of time — 9 AM and 5 PM on one day is
      // still two bookings on one date (§10).
      final held = _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      final candidate =
          _ride(id: 2, testDateUtc: DateTime.utc(2026, 9, 14, 21, 0));
      expect(RideAvailability.clashes(candidate, [held]), isTrue);
    });

    test('a different date does not clash', () {
      final held = _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      final candidate =
          _ride(id: 2, testDateUtc: DateTime.utc(2026, 9, 15, 13, 5));
      expect(RideAvailability.clashes(candidate, [held]), isFalse);
    });

    test('a booking never clashes with itself', () {
      final held = _ride(id: 7, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      expect(RideAvailability.clashes(held, [held]), isFalse);
    });

    test('no accepted rides means nothing clashes', () {
      final candidate =
          _ride(id: 2, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      expect(RideAvailability.clashes(candidate, const []), isFalse);
    });

    test('a missing test date cannot clash', () {
      const candidate = Ride(id: 2);
      final held = _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      expect(RideAvailability.clashes(candidate, [held]), isFalse);
    });
  });

  group('dates are compared in the booking timezone', () {
    test('01:30 UTC is still the previous day in Toronto', () {
      // 15 Sep 01:30 UTC == 14 Sep 21:30 EDT. Comparing in UTC would call these
      // different dates and wrongly leave the job acceptable.
      final held = _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5));
      final candidate =
          _ride(id: 2, testDateUtc: DateTime.utc(2026, 9, 15, 1, 30));
      expect(RideAvailability.clashes(candidate, [held]), isTrue);
    });

    test('the same instant can be different dates in different zones', () {
      final torontoLate =
          _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 15, 1, 30));
      final vancouverSame = _ride(
        id: 2,
        testDateUtc: DateTime.utc(2026, 9, 15, 1, 30),
        timezone: 'America/Vancouver',
      );
      // 18:30 on the 14th in Vancouver, 21:30 on the 14th in Toronto — same
      // date, so these do clash.
      expect(RideAvailability.clashes(vancouverSame, [torontoLate]), isTrue);
    });
  });

  group('takenDates', () {
    test('collects one key per accepted date', () {
      final rides = [
        _ride(id: 1, testDateUtc: DateTime.utc(2026, 9, 14, 13, 5)),
        _ride(id: 2, testDateUtc: DateTime.utc(2026, 9, 14, 22, 0)),
        _ride(id: 3, testDateUtc: DateTime.utc(2026, 9, 16, 13, 5)),
      ];
      expect(RideAvailability.takenDates(rides), {'2026-09-14', '2026-09-16'});
    });

    test('skips rides with no date', () {
      expect(RideAvailability.takenDates(const [Ride(id: 1)]), isEmpty);
    });
  });
}
