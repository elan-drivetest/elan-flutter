import 'package:elan/core/instructor_pay.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/complete_ride_response/complete_ride_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatHours — decimal hours are not a duration', () {
    test('the worked example reads as minutes', () {
      // 18 min each way, doubled, is 0.6 h on the wire. Nobody driving it
      // calls that "0.6 hrs".
      expect(InstructorPay.formatHours(0.6), '36 min');
    });

    test('under an hour stays in minutes', () {
      expect(InstructorPay.formatHours(0), '0 min');
      expect(InstructorPay.formatHours(0.25), '15 min');
      expect(InstructorPay.formatHours(0.99), '59 min');
    });

    test('a whole hour drops the empty minutes', () {
      expect(InstructorPay.formatHours(1), '1 hr');
      expect(InstructorPay.formatHours(2), '2 hr');
    });

    test('over an hour splits into hours and minutes', () {
      expect(InstructorPay.formatHours(1.5), '1 hr 30 min');
      expect(InstructorPay.formatHours(2.25), '2 hr 15 min');
    });

    test('rounds to the nearest minute rather than inventing precision', () {
      // 1799 s of Google estimate is 30 min, not 29.98.
      expect(InstructorPay.formatHours(1799 / 3600), '30 min');
    });

    test('a null leg is zero, not a crash', () {
      expect(InstructorPay.formatHours(null), '0 min');
    });
  });

  group('fromBooking — the job board', () {
    test('reads the breakdown off the wire, never recomputing it', () {
      const ride = Ride(
        id: 812,
        meetAtCenter: false,
        pickupDuration: 1080,
        baseAmount: 12000,
        transportationHours: 0.6,
        hourlyRate: 4000,
        transportationAmount: 2400,
        ridePrice: 14400,
      );

      final pay = InstructorPay.fromBooking(ride);
      expect(pay.total, r'$144.00');
      expect(pay.base, r'$120.00');
      expect(pay.transportation, r'$24.00');
      expect(pay.hourlyRate, r'$40.00/hr');
      expect(pay.drivingDuration, '36 min');
      expect(pay.hasBreakdown, isTrue);
      expect(pay.hasDrivingLeg, isTrue);
    });

    test('meet-at-centre pays the base with no driving line', () {
      const ride = Ride(
        meetAtCenter: true,
        baseAmount: 12000,
        transportationHours: 0,
        hourlyRate: 4000,
        transportationAmount: 0,
        ridePrice: 12000,
      );

      final pay = InstructorPay.fromBooking(ride);
      expect(pay.total, r'$120.00');
      expect(pay.hasBreakdown, isTrue);
      // The driving row is omitted rather than rendered as $0.00 — there is no
      // pickup leg at all, so a zeroed line invites the wrong question.
      expect(pay.hasDrivingLeg, isFalse);
    });

    test('a pre-v2 booking has no breakdown to show', () {
      // Only ride_price came back before the migration, so the card falls back
      // to the total on its own rather than drawing a panel of zeroes.
      const ride = Ride(ridePrice: 7984);
      final pay = InstructorPay.fromBooking(ride);
      expect(pay.hasBreakdown, isFalse);
      expect(pay.total, r'$79.84');
    });

    test('an unenriched booking shows a dash, not zero', () {
      // /rides/upcoming carries no pay at all.
      const ride = Ride(id: 1);
      expect(InstructorPay.fromBooking(ride).total, '--');
    });
  });

  group('fromCompletedRide — history', () {
    test('reads the camelCase breakdown', () {
      const ride = CompleteRide(
        instructorEarnings: 14400,
        baseAmount: 12000,
        transportationHours: 0.6,
        hourlyRate: 4000,
        transportationAmount: 2400,
        totalHours: 1.75,
      );

      final pay = InstructorPay.fromCompletedRide(ride);
      expect(pay.total, r'$144.00');
      expect(pay.base, r'$120.00');
      expect(pay.transportation, r'$24.00');
      expect(pay.hasBreakdown, isTrue);
    });

    test('wall-clock hours never enter the pay figure', () {
      // 1.75 recorded hours x $40/hr is $70.00 — the number the card used to
      // preview, and now wrong by the whole base. Nothing here touches it.
      const ride = CompleteRide(
        instructorEarnings: 14400,
        baseAmount: 12000,
        transportationHours: 0.6,
        hourlyRate: 4000,
        transportationAmount: 2400,
        totalHours: 1.75,
      );
      expect(InstructorPay.fromCompletedRide(ride).total, r'$144.00');
    });

    test('a ride accepted before the deploy falls back to the total', () {
      // baseAmount and transportationAmount are 0 on those rows; their
      // instructorEarnings is still correct.
      const ride = CompleteRide(
        instructorEarnings: 6400,
        baseAmount: 0,
        transportationAmount: 0,
        totalHours: 0.8,
      );

      final pay = InstructorPay.fromCompletedRide(ride);
      expect(pay.hasBreakdown, isFalse);
      expect(pay.total, r'$64.00');
    });
  });
}
