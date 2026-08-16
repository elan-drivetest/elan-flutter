import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/ui/widgets/common/ride_card_parts.dart';
import 'package:flutter/material.dart';

/// A job on the board.
///
/// Shares [RideCardShell] / [RideJourney] with the dashboard's upcoming and
/// history cards — see `ride_card_parts.dart` for why they were unified.
class RideCard extends StatelessWidget {
  final String driverName;
  final double rating;
  final String pickupLocation;
  final String testCenterName;
  final String testCenterAddress;
  final String phoneNumber;

  /// The **estimate** for the whole job, already formatted — not a rate.
  ///
  /// `/rides/available` computes `ride_price` per booking (§7.1); it is a total
  /// for the job, so it must never be suffixed "/hr".
  final String price;

  final String type;

  /// Test date and time, already rendered in the booking's own timezone.
  ///
  /// The upcoming and history cards both put this under the customer's name;
  /// the job board showed nothing there, which left the row looking unfinished
  /// beside them — and "which day is this job?" is the first thing an
  /// instructor needs, since they can only hold one booking per date (§10).
  final String time;

  /// `booking.meet_at_center` (§2). Decides whether there is a pickup leg at
  /// all — never inferred from a null pickup address.
  final bool meetAtCentre;

  /// `2 x booking.pickup_distance`, the distance [price] was computed from.
  final double? roundTripKm;

  final VoidCallback onTap;
  final VoidCallback onAccept;

  /// Set when the instructor already holds a booking on this calendar date.
  ///
  /// The server rejects a second job on the same date regardless of time
  /// (§10), so the card says so up front instead of letting Accept 400.
  final bool dateUnavailable;

  const RideCard({
    super.key,
    required this.driverName,
    required this.rating,
    required this.pickupLocation,
    required this.testCenterAddress,
    required this.phoneNumber,
    required this.price,
    required this.type,
    required this.time,
    required this.onTap,
    required this.onAccept,
    this.testCenterName = '',
    this.meetAtCentre = false,
    this.roundTripKm,
    this.dateUnavailable = false,
  });

  @override
  Widget build(BuildContext context) {
    return RideCardShell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RideTypePill(type: type),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  // Green 800, not the accent: this is the largest text on the
                  // card and it sits on white.
                  color: RideCardColors.actionGreen,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // The number moved to a Call button at the foot of the card, the
          // same treatment UpcomingRideCard already used.
          RideCardCustomer(
            name: driverName,
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(Icons.access_time,
                      size: 14, color: RideCardColors.mutedText),
                ),
                const SizedBox(width: 4),
                Expanded(
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
          const SizedBox(height: 16),
          RideDistanceRow(
            roundTripKm: roundTripKm,
            meetAtCentre: meetAtCentre,
          ),
          const SizedBox(height: 20),
          // The clash notice sits on its own line rather than sharing one with
          // the buttons — squeezed beside them it wrapped to three lines and
          // pushed Accept out of alignment with the other cards.
          if (dateUnavailable) ...[
            const Text(
              'You already have a ride booked on this date',
              style: TextStyle(fontSize: 12, color: RideCardColors.mutedText),
            ),
            const SizedBox(height: 12),
          ],
          Row(
            children: [
              if (phoneNumber.isNotEmpty) ...[
                Expanded(
                  child: RideCallButton(name: driverName, phone: phoneNumber),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: dateUnavailable ? null : onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RideCardColors.actionGreen,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: RideCardColors.disabledSurface,
                    disabledForegroundColor: RideCardColors.disabledContent,
                    elevation: 0,
                    minimumSize: const Size(0, 48),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Accept Ride',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
