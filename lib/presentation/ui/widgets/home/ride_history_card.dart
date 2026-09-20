import 'package:elan/core/instructor_pay.dart';
import 'package:elan/core/ride_earnings.dart';
import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/ui/widgets/common/pay_breakdown_panel.dart';
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

  /// What this ride paid, base and driving, straight off `/rides/completed`.
  ///
  /// `instructorEarnings` is written at accept now, so it is correct the
  /// moment the ride appears here — the card no longer previews it from
  /// `totalHours x hourlyRate` while the payout cron catches up. Under the
  /// flat-base model that preview would miss the whole base.
  ///
  /// Rides accepted before pay v2 carry no breakdown; the panel hides itself
  /// and the total stands alone.
  final InstructorPay pay;

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
    required this.pay,
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
          // Pre-v2 rides have no breakdown to show, so they fall back to the
          // single "Earned" row below.
          if (pay.hasBreakdown)
            PayBreakdownPanel(pay: pay, title: 'Earned')
          else
            _EarningsRow(earningsCents: pay.totalCents),
        ],
      ),
    );
  }
}

/// The total for a ride with no breakdown.
///
/// Only reached for rides accepted before pay v2 — those settle on the old
/// wall-clock arithmetic and carry no `baseAmount`, but their
/// `instructorEarnings` is still correct. Anything newer renders
/// [PayBreakdownPanel] instead.
///
/// It still has to distinguish "paid $64" from a figure the response did not
/// carry, which is why an absent total reads "Pending" rather than $0.00.
class _EarningsRow extends StatelessWidget {
  const _EarningsRow({required this.earningsCents});

  final int? earningsCents;

  @override
  Widget build(BuildContext context) {
    final label = RideEarnings.settled(instructorEarningsCents: earningsCents);

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
            'Earned',
            style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            label.amount,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: RideCardColors.actionGreen,
            ),
          ),
        ],
      ),
    );
  }
}
