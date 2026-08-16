import 'package:elan/core/ride_earnings.dart';
import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/ui/widgets/common/ride_card_parts.dart';
import 'package:flutter/material.dart';

/// A finished ride.
///
/// Shares [RideCardShell] / [RideJourney] with the job board and upcoming
/// cards — see `ride_card_parts.dart`.
class RideHistoryCard extends StatelessWidget {
  final String name;
  final String type;
  final String phoneNumber;
  final double rating;
  final String time;
  final String pickupLocation;
  final String testCenterName;
  final String testCenterAddress;

  /// Whether this was a meet-at-centre booking.
  ///
  /// `/rides/completed` carries no `meet_at_center` flag, so the caller derives
  /// it from the server's own sentinel: the query selects
  /// `COALESCE(pickup_address, 'Meet at center')`
  /// (`ride-session.repository.ts:549`). That is an inference on a null pickup
  /// — the thing §2 warns against for *live* rides — but here the ride is over,
  /// nothing routes off it, and it is the only signal the endpoint provides.
  final bool meetAtCentre;

  final VoidCallback transfer;
  final VoidCallback start;

  /// Cents. Zero for up to `instructor_payout_delay_days` after the ride —
  /// the payout cron has not run yet (§14.6), not "you earned nothing".
  final int? earningsCents;

  /// Wall-clock hours, used to preview the pending payout.
  final double? totalHours;

  /// Live rate, for that preview only. Never hardcode it.
  final num? hourlyRateCents;

  const RideHistoryCard({
    super.key,
    required this.name,
    required this.rating,
    required this.time,
    required this.pickupLocation,
    required this.type,
    required this.phoneNumber,
    required this.transfer,
    required this.start,
    this.testCenterName = '',
    this.testCenterAddress = '',
    this.meetAtCentre = false,
    this.earningsCents,
    this.totalHours,
    this.hourlyRateCents,
  });

  @override
  Widget build(BuildContext context) {
    return RideCardShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RideTypePill(type: type),
          const SizedBox(height: 16),
          RideCardCustomer(
            name: name,
            subtitle: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: RideCardColors.mutedText),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    time,
                    maxLines: 2,
                    style: const TextStyle(
                      color: RideCardColors.mutedText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const RideCardDivider(),
          RideJourney(
            meetAtCentre: meetAtCentre,
            pickupAddress: pickupLocation,
            testCentreName: testCenterName,
            testCentreAddress: testCenterAddress,
          ),
          if (phoneNumber.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: RideCallButton(name: name, phone: phoneNumber),
            ),
          ],
          const SizedBox(height: 16),
          _EarningsRow(
            earningsCents: earningsCents,
            totalHours: totalHours,
            hourlyRateCents: hourlyRateCents,
          ),
        ],
      ),
    );
  }
}

/// Earnings for a finished ride.
///
/// History showed no money at all before, so an instructor could not tell a
/// paid ride from an unpaid one. It also has to distinguish "paid $64" from
/// "finished, payout scheduled" — the API reports both as `0` until the cron
/// runs (§14.6).
class _EarningsRow extends StatelessWidget {
  const _EarningsRow({
    required this.earningsCents,
    required this.totalHours,
    required this.hourlyRateCents,
  });

  final int? earningsCents;
  final double? totalHours;
  final num? hourlyRateCents;

  @override
  Widget build(BuildContext context) {
    // False, and not fixable here: `GET /v1/rides/completed` returns no
    // `hourly_rate` (§8.9), so the only rate available to this card is the
    // current global one. The caption says so.
    final label = RideEarnings.settled(
      instructorEarningsCents: earningsCents,
      totalHours: totalHours,
      hourlyRateCents: hourlyRateCents,
      rateIsRideSnapshot: false,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: RideCardColors.greenTint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet_outlined,
              size: 16, color: RideCardColors.actionGreen),
          const SizedBox(width: 8),
          Text(
            label.isEstimate ? 'Earnings (est.)' : 'Earned',
            style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label.amount,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: RideCardColors.actionGreen,
                ),
              ),
              if (label.caption != null)
                Text(
                  label.caption!,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
