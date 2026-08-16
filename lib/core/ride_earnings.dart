import 'package:elan/core/money.dart';

/// How a job's money is described before, during and after a ride.
///
/// Two places in this app show an amount that is technically correct and
/// completely misleading, and both are documented backend behaviours rather
/// than bugs to fix server-side:
///
/// * **Meet-at-centre jobs advertise $0.00** (§14.3). `ride_price` is derived
///   from `pickup_distance`, which is `0` for these bookings by definition —
///   there is no pickup run. The instructor is still paid, on elapsed time.
///   Shown raw, every such job looks unpaid and gets skipped.
///
/// * **Completed rides report $0.00 for up to a week** (§14.6).
///   `instructor_earnings` is written by the payout cron at
///   `now + instructor_payout_delay_days`, so a ride finished this morning
///   honestly reports zero.
///
/// In both cases the honest thing is not to hide the number but to say what it
/// means — and the estimate is always labelled as one, because the estimate and
/// the payout are computed from different quantities (distance vs wall clock,
/// §7.2).
class RideEarnings {
  const RideEarnings._();

  /// What to show on a job card before accepting.
  ///
  /// [ridePriceCents] is `booking.ride_price`, present only on
  /// `/v1/rides/available`.
  ///
  /// **No meet-at-centre special case any more.** The server now quotes
  /// `test_duration_hours + addon/60 + roundTripKm/avgPerHour`, so a
  /// meet-at-centre job comes back at the test duration (~1 h) rather than $0
  /// (§14.3 — fixed backend-side). The "paid on the clock" copy this used to
  /// substitute is dead, and keeping it would now contradict a real figure.
  ///
  /// Expect pickup-job estimates to be roughly **double** what they were: the
  /// pickup leg is counted twice, because the customer is driven home again.
  /// That is a correction, not a regression (§7.1).
  static RideEarningsLabel estimate({
    required int? ridePriceCents,
  }) {
    if (ridePriceCents == null) {
      // /rides/upcoming does not enrich, so there is no estimate to show (§7.1).
      return const RideEarningsLabel(
        amount: '--',
        caption: null,
        isEstimate: true,
      );
    }

    return RideEarningsLabel(
      amount: Money.format(ridePriceCents),
      caption: 'Est. — actual pay is on the clock',
      isEstimate: true,
    );
  }

  /// What to show for a completed ride.
  ///
  /// Falls back to `total_hours × hourly_rate` while the payout cron has not
  /// run, which is exactly how the backend will compute it (§7.2).
  ///
  /// [rateIsRideSnapshot] is required rather than defaulted because getting it
  /// wrong is invisible: the preview still renders a confident figure. The
  /// backend snapshots `hourly_rate` onto the ride session at accept precisely
  /// so a later admin change cannot reprice a held job (§7.2), which means the
  /// *current* rate and a *ride's* rate can legitimately differ — and do, for
  /// every session created before the §14.9 fix, which kept the column default
  /// of 8000 while the live setting is 4000. A preview off by 2× is worse than
  /// one that says which rate it used.
  ///
  /// Pass `true` only for a rate read off the ride's own session.
  static RideEarningsLabel settled({
    required int? instructorEarningsCents,
    required double? totalHours,
    required num? hourlyRateCents,
    required bool rateIsRideSnapshot,
  }) {
    if ((instructorEarningsCents ?? 0) > 0) {
      return RideEarningsLabel(
        amount: Money.format(instructorEarningsCents),
        caption: null,
        isEstimate: false,
      );
    }

    if (totalHours != null && totalHours > 0 && (hourlyRateCents ?? 0) > 0) {
      final approx = (totalHours * hourlyRateCents!).round();
      return RideEarningsLabel(
        amount: Money.format(approx),
        caption: rateIsRideSnapshot
            ? 'Pending payout'
            : 'Pending — at current rate',
        isEstimate: true,
      );
    }

    return const RideEarningsLabel(
      amount: 'Pending',
      caption: null,
      isEstimate: true,
    );
  }
}

/// An amount plus the sentence that stops it being misread.
class RideEarningsLabel {
  const RideEarningsLabel({
    required this.amount,
    required this.caption,
    required this.isEstimate,
  });

  final String amount;
  final String? caption;
  final bool isEstimate;
}
