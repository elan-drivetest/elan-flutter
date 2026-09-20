import 'package:elan/core/money.dart';

/// The headline money figure on a card, plus the sentence that stops it being
/// misread.
///
/// ## What changed with pay v2
///
/// This file used to exist to *apologise* for two numbers. The job board showed
/// an estimate derived from distance while the payout was recalculated from the
/// wall clock, so the two disagreed and every figure had to be captioned
/// "Est. — actual pay is on the clock". Completed rides reported $0.00 for up
/// to a week because `instructor_earnings` was written by the payout cron, so
/// the card previewed `total_hours x hourly_rate` instead.
///
/// Both are gone. The server now computes the breakdown once, at accept, and
/// freezes it onto the ride: the number on the board is the number that gets
/// paid, and `instructorEarnings` is correct from the moment the job is taken.
/// So there is nothing left to hedge — and hedging a figure that is now exact
/// would be its own lie. No "Est.", no "~", no client-side multiplication.
///
/// What survives is the honest-absence handling: `/rides/upcoming` carries no
/// pay at all, and a pre-v2 ride carries no breakdown. Those render as a dash
/// or a bare total, never as `$0.00`.
class RideEarnings {
  const RideEarnings._();

  /// What to show as the headline on a job card, detail sheet or map panel.
  ///
  /// [ridePriceCents] is `booking.ride_price`, present only on
  /// `GET /v1/rides/available`. It is the **actual pay** for the job — base
  /// plus transportation — not an estimate, and callers must not wrap it in
  /// hedging copy.
  ///
  /// Null on `/rides/upcoming`, which returns a plain booking with no pay
  /// attached; that renders as `--` rather than implying the job is worth
  /// nothing.
  static RideEarningsLabel jobPay({required int? ridePriceCents}) {
    if (ridePriceCents == null) {
      return const RideEarningsLabel(amount: '--', caption: null);
    }
    return RideEarningsLabel(
      amount: Money.format(ridePriceCents),
      caption: null,
    );
  }

  /// What to show for a completed ride.
  ///
  /// [instructorEarningsCents] is `baseAmount + transportationAmount`, written
  /// at accept. There is deliberately **no fallback arithmetic** here any
  /// more: the old `totalHours x hourlyRate` preview now misses the entire
  /// flat base, so a wrong-by-$120 number would be worse than an honest
  /// "Pending".
  ///
  /// A null or zero total is a genuinely missing figure — an old row, or a
  /// response that did not carry it — so it reads as pending rather than as
  /// nothing earned.
  static RideEarningsLabel settled({required int? instructorEarningsCents}) {
    if ((instructorEarningsCents ?? 0) > 0) {
      return RideEarningsLabel(
        amount: Money.format(instructorEarningsCents),
        caption: null,
      );
    }
    return const RideEarningsLabel(amount: 'Pending', caption: null);
  }
}

/// An amount plus the sentence that stops it being misread.
class RideEarningsLabel {
  const RideEarningsLabel({required this.amount, required this.caption});

  final String amount;
  final String? caption;
}
