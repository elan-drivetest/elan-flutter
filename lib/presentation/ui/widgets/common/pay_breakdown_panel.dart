import 'package:elan/core/app_colors.dart';
import 'package:elan/core/instructor_pay.dart';
import 'package:flutter/material.dart';

/// Where a job's money comes from, spelled out.
///
/// ```
/// This job pays          $144.00
///   Base                 $120.00
///   Driving  36 min      $24.00   ($40.00/hr)
/// ```
///
/// The headline alone is not enough any more. Under pay v2 the base is most of
/// the money on a short job and all of it on a meet-at-centre one, and an
/// instructor who sees $144.00 where the same job used to read $79.84 will ask
/// where the difference came from. This is the answer, on the card, so nobody
/// has to.
///
/// Renders nothing when [pay] carries no breakdown — a pre-v2 ride, or a
/// booking from an endpoint that does not enrich. The caller keeps showing the
/// total on its own in that case; a panel of zeroes would state that the base
/// was withheld.
class PayBreakdownPanel extends StatelessWidget {
  const PayBreakdownPanel({
    super.key,
    required this.pay,
    this.title = 'This job pays',
  });

  final InstructorPay pay;

  /// "This job pays" before accepting; callers showing a finished ride pass
  /// something in the past tense.
  final String title;

  @override
  Widget build(BuildContext context) {
    if (!pay.hasBreakdown) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: RideCardColors.greenTint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_wallet_outlined,
                  size: 16, color: RideCardColors.actionGreen),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                pay.total,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: RideCardColors.actionGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _BreakdownLine(
            label: 'Base',
            // The road test itself, on every ride. Not hourly.
            note: 'Road test',
            value: pay.base,
          ),
          // Omitted rather than shown as $0.00 for meet-at-centre: there is no
          // pickup leg at all, so a zeroed line invites the wrong question.
          if (pay.hasDrivingLeg) ...[
            const SizedBox(height: 6),
            _BreakdownLine(
              label: 'Driving',
              note: pay.hourlyRate == null
                  ? pay.drivingDuration
                  : '${pay.drivingDuration} · ${pay.hourlyRate}',
              value: pay.transportation,
            ),
          ],
        ],
      ),
    );
  }
}

/// One indented `label  note ........ value` row.
class _BreakdownLine extends StatelessWidget {
  const _BreakdownLine({
    required this.label,
    required this.note,
    required this.value,
  });

  final String label;
  final String note;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Flexible, not Expanded: the note shrinks before the amount does,
          // because a truncated "$24.00" is a different number.
          Flexible(
            child: Text(
              note,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(width: 8),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
