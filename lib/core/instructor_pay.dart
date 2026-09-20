import 'package:elan/core/money.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/complete_ride_response/complete_ride_response.dart';

/// What a job pays, broken into the parts the server computed it from.
///
/// ## The model, in one line
///
/// ```
/// pay = (instructor_rate x 3) + round(transportation_hours x instructor_rate)
/// ```
///
/// `instructor_rate` is the only pay setting. Every ride pays three hours of it
/// for the road test itself — a flat base, $120.00 at the seeded $40/hr — plus
/// one hour of it for every hour spent driving the customer (pickup → centre →
/// back to the pickup address). A meet-at-centre job has no driving leg, so it
/// pays the base alone.
///
/// ## Why nothing here does arithmetic
///
/// Every figure below is read off the wire. Three reasons that is not
/// negotiable:
///
/// * **The breakdown is frozen at accept.** The server computes it once, when
///   the instructor takes the job, and writes it onto the ride. A slow test day
///   does not move it and neither does a later rate change in the admin panel —
///   so a client-side recomputation from the *current* rate drifts the moment
///   an admin edits one.
/// * **The board's number is the payout.** It used to be an estimate that the
///   payout then contradicted, because the two were computed from different
///   quantities. They are the same number now, and only because the app stops
///   deriving its own.
/// * **The old preview is now wrong by the whole base.** History used to show
///   `totalHours x hourlyRate` while the payout cron had not run. Under this
///   model that misses $120.00 on every ride. `totalHours` is wall clock —
///   duration, never money.
///
/// ## Absent breakdowns
///
/// Bookings and rides from before the pay-v2 deploy carry no `base_amount`, so
/// [hasBreakdown] is false and callers show the total alone. That is a real
/// state, not an error: those rides settle on the old arithmetic and their
/// total is still correct.
class InstructorPay {
  const InstructorPay({
    required this.totalCents,
    required this.baseCents,
    required this.transportationHours,
    required this.transportationCents,
    required this.hourlyRateCents,
  });

  /// A job on the board — `GET /v1/rides/available`.
  ///
  /// `/rides/upcoming` returns a plain booking with no pay attached, so
  /// [totalCents] is null there and the UI renders a dash rather than $0.00.
  factory InstructorPay.fromBooking(Ride ride) => InstructorPay(
        totalCents: ride.ridePrice,
        baseCents: ride.baseAmount ?? 0,
        transportationHours: ride.transportationHours ?? 0,
        transportationCents: ride.transportationAmount ?? 0,
        hourlyRateCents: ride.hourlyRate,
      );

  /// A finished ride — `GET /v1/rides/completed`, camelCase on that endpoint.
  factory InstructorPay.fromCompletedRide(CompleteRide ride) => InstructorPay(
        totalCents: ride.instructorEarnings,
        baseCents: ride.baseAmount ?? 0,
        transportationHours: ride.transportationHours ?? 0,
        transportationCents: ride.transportationAmount ?? 0,
        hourlyRateCents: ride.hourlyRate,
      );

  /// Cents. `ride_price` on a booking, `instructorEarnings` on a finished
  /// ride. Null only when the endpoint does not carry pay at all.
  final int? totalCents;

  /// Cents. The flat road-test portion. `0` means "no breakdown available",
  /// not "no base was paid" — see [hasBreakdown].
  final int baseCents;

  /// Paid driving hours. `0` for meet-at-centre.
  final double transportationHours;

  /// Cents. `round(transportationHours x hourlyRateCents)`.
  final int transportationCents;

  /// Cents per transportation hour. Null on responses that omit it.
  final int? hourlyRateCents;

  /// Whether the server sent a breakdown worth rendering.
  ///
  /// Pre-v2 rides report `0` here. Guard the base/driving lines on this and
  /// fall back to the total on its own.
  bool get hasBreakdown => baseCents > 0;

  /// Whether this job has a paid driving leg at all.
  ///
  /// False for meet-at-centre, where the driving line is **omitted** rather
  /// than rendered as "$0.00" — a zero beside a label reads as money withheld.
  bool get hasDrivingLeg => transportationHours > 0 || transportationCents > 0;

  /// `"$144.00"`, or `--` when the endpoint carries no pay.
  String get total => Money.formatOrDash(totalCents);

  /// `"$120.00"`.
  String get base => Money.format(baseCents);

  /// `"$24.00"`.
  String get transportation => Money.format(transportationCents);

  /// `"$40.00/hr"`, or null when the rate was not sent — better a missing
  /// suffix than a confident `$0.00/hr`.
  String? get hourlyRate =>
      hourlyRateCents == null ? null : Money.rate(hourlyRateCents);

  /// `"36 min"` — the driving leg as a duration.
  String get drivingDuration => formatHours(transportationHours);

  /// Decimal hours → the duration a person would say out loud.
  ///
  /// `0.6` is not "0.6 hrs" to anyone driving it; it is 36 minutes. The server
  /// sends hours because that is what it multiplies by, which is no reason to
  /// make the instructor do the conversion.
  ///
  /// Rounds to the nearest minute, so a 1799-second leg reads "30 min" rather
  /// than claiming a precision the underlying Google estimate does not have.
  static String formatHours(double? hours) {
    final totalMinutes = ((hours ?? 0) * 60).round();
    if (totalMinutes < 60) return '$totalMinutes min';

    final wholeHours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    return minutes == 0 ? '$wholeHours hr' : '$wholeHours hr $minutes min';
  }
}
