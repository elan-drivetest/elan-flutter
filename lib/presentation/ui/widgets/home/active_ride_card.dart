import 'package:elan/core/app_colors.dart';
import 'package:elan/core/money.dart';
import 'package:flutter/material.dart';

class ActiveRideCard extends StatelessWidget {
  final VoidCallback onStop;
  final VoidCallback? onTap;
  final String status;

  /// `ride_session.total_distance` for a ride that is **still running**, so
  /// this is the accept-time round-trip estimate (`2 × pickup_distance`), not
  /// distance driven — the server only overwrites it with the real figure at
  /// Stop (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §5.2). Labelled "Round trip"
  /// accordingly; it does not tick up as the instructor drives.
  final double totalDistance;
  final double totalHours;

  /// Cents per hour, straight off the wire — the snapshot taken when this ride
  /// was accepted. Formatting happens here, not at the call site.
  /// This ride's **own** snapshot, `RideSession.hourly_rate` — never the
  /// dashboard's `hourly_rate`, which is the current global setting and can
  /// disagree with what a held ride actually pays (§8.10, §7.2).
  ///
  /// Nullable so an absent rate reads as absent rather than as $0.00/hr.
  final num? hourlyRate;

  const ActiveRideCard({
    super.key,
    required this.onStop,
    this.onTap,
    required this.status,
    required this.totalDistance,
    required this.totalHours,
    required this.hourlyRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.blue.shade100, width: 1.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header (Title + Status)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Ride',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: status == 'in_progress'
                            ? RideCardColors.greenTint
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status.replaceAll('_', ' ').toUpperCase(),
                        style: TextStyle(
                          color: status == 'in_progress'
                              ? RideCardColors.actionGreen
                              : RideCardColors.mutedText,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(color: Colors.grey.shade100, height: 1),
                const SizedBox(height: 20),

                // Info Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Distance & Duration
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Round trip & Duration',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.route_outlined,
                                size: 16, color: RideCardColors.link),
                            const SizedBox(width: 4),
                            Text(
                              "${totalDistance.toStringAsFixed(2)} km",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.timelapse,
                                size: 16, color: RideCardColors.link),
                            const SizedBox(width: 4),
                            Text(
                              "${totalHours.toStringAsFixed(2)} hr",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Rate
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rate',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          Money.rateOrDash(hourlyRate),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Stop Ride Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onStop,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RideCardColors.stopRed,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Stop Ride',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.stop_circle_outlined, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
