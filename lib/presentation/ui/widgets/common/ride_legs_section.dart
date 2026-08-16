import 'package:elan/core/app_colors.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The journey rows and distance summary for a booking.
///
/// Shared by the available-ride and upcoming-ride sheets, which were previously
/// byte-identical 403-line copies of each other.
///
/// ## What this fixes
///
/// The old summary put two different journeys in one slot: it showed the
/// **deadhead** (instructor → destination, from the Directions API) when that
/// call succeeded, and fell back to **`pickup_distance`** (pickup → centre) when
/// it failed. So the same row silently meant different things depending on
/// network state, directly above an earnings estimate derived from the *other*
/// leg. `INSTRUCTOR_APP_RIDE_JOURNEY.md` §14.1 calls this out as the single most
/// confusing thing the screen can do.
///
/// Now the two are separate rows and never swap:
/// * **Pickup run** — `booking.pickup_distance`, the authoritative billable leg.
/// * **Your drive** — the deadhead, clearly secondary, greyed.
///
/// The old duration fallback showed `total_ride_hour`, which is a *billing
/// constant* (`pickup_distance / average_distance_per_hour`), not a travel time
/// (§6). It is labelled as billable hours here, never as an ETA.
class RideLegsSection extends StatelessWidget {
  const RideLegsSection({super.key, required this.rideInfo});

  final Ride rideInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _JourneyRows(rideInfo: rideInfo),
        const SizedBox(height: 20),
        _DistanceSummary(rideInfo: rideInfo),
      ],
    );
  }
}

/// Timeline of the actual legs.
///
/// The old rows read `Pickup` → `Drop-off`, with "Drop-off" showing the **test
/// centre** address. There is no customer drop-off anywhere in the backend (§3):
/// the customer returns to the pickup address, and `dropoffLocation` in the API
/// is the centre. Labelling the centre "Drop-off" made the instructor read two
/// separate destinations.
class _JourneyRows extends StatelessWidget {
  const _JourneyRows({required this.rideInfo});

  final Ride rideInfo;

  static List<String> _split(String address) {
    final parts = address.split(',');
    if (parts.length <= 1) return [address];
    return [
      parts.take(2).join(',').trim(),
      parts.skip(2).join(',').trim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final centreLabel = rideInfo.testCenterName?.trim().isNotEmpty ?? false
        ? '${rideInfo.testCenterName} — ${rideInfo.testCenterAddress ?? ''}'
        : (rideInfo.testCenterAddress ?? '');

    // Shape B: one destination, no pickup and no return.
    if (rideInfo.isMeetAtCentre) {
      return _Stop(
        dotColor: RideCardColors.actionGreen,
        filled: true,
        showConnector: false,
        label: 'Meet at test centre',
        lines: _split(centreLabel),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Stop(
          dotColor: RideCardColors.link,
          filled: false,
          showConnector: true,
          label: 'Pickup',
          lines: _split(rideInfo.pickupAddress ?? ''),
        ),
        _Stop(
          dotColor: RideCardColors.actionGreen,
          filled: true,
          showConnector: true,
          label: 'Test centre',
          lines: _split(centreLabel),
        ),
        // Leg 2. Real — it is why short pickups are billed both ways (§7.3) —
        // but it has no backend field, so it is stated as copy rather than
        // rendered as a separate address.
        const _Stop(
          dotColor: RideCardColors.link,
          filled: false,
          showConnector: false,
          label: 'Return',
          lines: const ['Back to pickup — same address'],
          muted: true,
        ),
      ],
    );
  }
}

class _Stop extends StatelessWidget {
  const _Stop({
    required this.dotColor,
    required this.filled,
    required this.showConnector,
    required this.label,
    required this.lines,
    this.muted = false,
  });

  final Color dotColor;
  final bool filled;
  final bool showConnector;
  final String label;
  final List<String> lines;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 2),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: filled ? dotColor : Colors.white,
                  shape: BoxShape.circle,
                  border: filled ? null : Border.all(color: dotColor, width: 3),
                ),
              ),
              if (showConnector)
                Expanded(
                  child: Container(width: 2, color: Colors.grey.shade200),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: showConnector ? 16 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lines.first,
                    style: TextStyle(
                      fontSize: 14,
                      color: muted ? Colors.grey.shade600 : Colors.black87,
                      fontWeight: muted ? FontWeight.w400 : FontWeight.w500,
                    ),
                  ),
                  if (lines.length > 1)
                    Text(
                      lines[1],
                      style:
                          TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Two rows that never swap places: the billable leg, then the deadhead.
class _DistanceSummary extends StatelessWidget {
  const _DistanceSummary({required this.rideInfo});

  final Ride rideInfo;

  @override
  Widget build(BuildContext context) {
    final roundTripKm = rideInfo.roundTripDistanceKm;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (roundTripKm != null) ...[
            _MetricRow(
              icon: Icons.route,
              iconColor: RideCardColors.actionGreen,
              // The drive actually made: out to the centre and back, because
              // the customer is returned home. Quoting the one-way figure put
              // a distance on the card that disagreed with the price beside it
              // — the §14.1 bug. Derived from booking.pickup_distance, never
              // from a Directions result (§5.3).
              label: 'Round trip',
              value: '${roundTripKm.toStringAsFixed(1)} km',
              emphasised: true,
            ),
            const SizedBox(height: 10),
          ] else ...[
            const _MetricRow(
              icon: Icons.place_outlined,
              iconColor: RideCardColors.actionGreen,
              label: 'Meet at centre',
              value: 'No pickup run',
              emphasised: true,
            ),
            const SizedBox(height: 10),
          ],
          BlocBuilder<DirectionBloc, DirectionState>(
            builder: (context, dirState) {
              if (dirState.status == DirectionStatus.loading) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Calculating your drive…',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                );
              }

              final hasData = dirState.status == DirectionStatus.success &&
                  (dirState.distance.isNotEmpty ||
                      dirState.duration.isNotEmpty);

              return _MetricRow(
                icon: Icons.navigation_outlined,
                iconColor: Colors.grey.shade500,
                label: 'Your drive',
                value: hasData
                    ? [dirState.distance, dirState.duration]
                        .where((e) => e.isNotEmpty)
                        .join(' · ')
                    : 'Unavailable',
                emphasised: false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.emphasised,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool emphasised;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: emphasised ? FontWeight.w700 : FontWeight.w500,
            fontSize: emphasised ? 15 : 13,
            color: emphasised ? Colors.black87 : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
