import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/ui/widgets/common/ride_card_parts.dart';
import 'package:flutter/material.dart';

/// A job the instructor has accepted but not yet started.
///
/// Shares [RideCardShell] / [RideJourney] with the job board and history cards
/// — see `ride_card_parts.dart`.
class UpcomingRideCard extends StatelessWidget {
  final String name;
  final String type;
  final String phoneNumber;
  final double rating;
  final String time;
  final String pickupLocation;

  /// Test centre, passed explicitly rather than derived from the drop-off.
  ///
  /// The API's `dropoffLocation` *is* the test centre — there is no customer
  /// drop-off column anywhere (§3) — but reusing one for the other meant the
  /// card silently depended on that staying true, and it left `test_center_name`
  /// unused even though the API sends it. The venue name is the part an
  /// instructor actually navigates by ("Etobicoke DriveTest Centre" beats a
  /// street number), so it leads the destination stop.
  final String testCenterName;
  final String testCenterAddress;

  /// `booking.meet_at_center` (§2) — decides whether a pickup leg exists.
  final bool meetAtCentre;

  /// `2 x booking.pickup_distance` — the drive actually made.
  final double? roundTripKm;

  final VoidCallback transfer;
  final VoidCallback start;
  final VoidCallback? onTap;

  /// Server-driven timing gates (`ride_start_window_hours` /
  /// `ride_transfer_cutoff_hours`). Disabling the button is friendlier than
  /// letting the request come back 400 — the server still enforces both.
  final bool canStart;
  final bool canTransfer;

  const UpcomingRideCard({
    super.key,
    required this.name,
    required this.rating,
    required this.time,
    required this.pickupLocation,
    this.testCenterName = '',
    this.testCenterAddress = '',
    this.meetAtCentre = false,
    this.roundTripKm,
    required this.type,
    required this.phoneNumber,
    required this.transfer,
    required this.start,
    this.onTap,
    this.canStart = true,
    this.canTransfer = true,
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
              // Wrapped so the tap target reaches the 48dp minimum both
              // platforms ask for. The pill still *looks* the same size — only
              // the hit area grew, via padding outside the visual.
              InkWell(
                onTap: canTransfer ? transfer : null,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: canTransfer
                          ? RideCardColors.redTint
                          : RideCardColors.disabledSurface,
                      border: Border.all(
                        color: canTransfer
                            ? RideCardColors.actionRed
                            : RideCardColors.disabledBorder,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Transfer Ride',
                      style: TextStyle(
                        // Red 800 on the tint: 4.91:1, up from 3.22:1.
                        color: canTransfer
                            ? RideCardColors.actionRed
                            : RideCardColors.disabledContent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RideCardCustomer(
            name: name,
            // The date owns this row outright. It previously shared it with the
            // phone number, and the two together overflowed the ~284px
            // available — which is why the date was being cut off mid-string.
            // Calling moved to its own button at the foot of the card.
            //
            // maxLines: 2 rather than 1 so the date still shows in full at
            // large system font scales instead of ellipsising again.
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
          Row(
            children: [
              if (phoneNumber.isNotEmpty) ...[
                Expanded(
                  child: RideCallButton(name: name, phone: phoneNumber),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: canStart ? start : null,
                  style: ElevatedButton.styleFrom(
                    // Green 800, not 500. White on 500 measured 2.78:1 — the
                    // worst contrast on the dashboard, on its most important
                    // button. 800 gives 5.13:1.
                    backgroundColor: RideCardColors.actionGreen,
                    foregroundColor: Colors.white,
                    // Flutter's default disabled pair is 3.49:1; these are set
                    // explicitly because the gate is a real state the
                    // instructor needs to read, not just decoration.
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
                      Text('Start Ride',
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
