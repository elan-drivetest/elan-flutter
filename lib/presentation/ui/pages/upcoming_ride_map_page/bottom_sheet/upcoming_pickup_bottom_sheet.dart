import 'package:elan/core/extension/money.dart';
import 'package:elan/core/extension/pricing_config_extension.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart';
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart';
import 'package:elan/presentation/bloc/earnings_summary_bloc/earnings_summary_bloc.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingPickupBottomSheet extends StatelessWidget {
  final Ride rideInfo;

  const UpcomingPickupBottomSheet({
    super.key,
    required this.rideInfo,
  });

  @override
  Widget build(BuildContext context) {
    // Split address helpers
    List<String> splitAddress(String? address) {
      if (address == null || address.isEmpty) return [''];
      final parts = address.split(',');
      if (parts.length < 2) return [address];
      return [parts[0].trim(), parts.sublist(1).join(',').trim()];
    }

    final pickupLines = splitAddress(rideInfo.pickupAddress ?? '');
    final testCenterLines = splitAddress(rideInfo.testCenterAddress ?? '');

    // Date
    final testDate = rideInfo.testDate;
    String formattedDate = 'N/A';
    if (testDate != null) {
      final formatter = DateFormat('d MMM yyyy h:mm a');
      formattedDate = formatter.format(testDate.toLocal());
    }

    // Ride price
    final ridePrice = (context.watch<EarningsSummaryBloc>().state.earningsSummary?.hourlyRate ?? context.pricing.instructorRate).toCadPerHour;

    return BlocConsumer<UpcomingRideBloc, UpcomingRideState>(
      listener: (context, state) {
        if (state.status == UpcomingRideStatus.update) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "You have accepted the ride",
              ),
              backgroundColor: Theme.of(context).primaryColorDark,
              duration: const Duration(seconds: 2),
            ),
          );
          context
              .read<AvailableRideBloc>()
              .add(AvailableRideEvent.refreshData());
        }
        if (state.status == UpcomingRideStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorResponse?.message ?? "Something went wrong",
              ),
              backgroundColor: const Color(0xFFFF0000),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == UpcomingRideStatus.loading;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header (Type + Price)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      rideInfo.testType ?? '',
                      style: const TextStyle(
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Text(
                    ridePrice,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF4CAF50),
                      height: 1,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),

              // Driver Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade50,
                    child: const Icon(Icons.person, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rideInfo.fullName ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.black54),
                            const SizedBox(width: 4),
                            Text(
                              formattedDate,
                              style: const TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            if ((rideInfo.phoneNumber ?? '').isNotEmpty) ...[
                              const SizedBox(width: 12),
                              const Icon(Icons.phone, size: 14, color: Colors.black54),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () async {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: rideInfo.phoneNumber ?? '',
                                  );
                                  if (await canLaunchUrl(launchUri)) {
                                    await launchUrl(launchUri);
                                  }
                                },
                                child: Text(
                                  rideInfo.phoneNumber ?? '',
                                  style: const TextStyle(
                                    color: Colors.blue, 
                                    fontSize: 13, 
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade100, height: 1),
              const SizedBox(height: 20),

              // Locations section (Timeline style)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline graphics
                  Column(
                    children: [
                      const SizedBox(height: 2),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 36,
                        color: Colors.grey.shade200,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Addresses
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pickup
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              pickupLines[0],
                              style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                            if (pickupLines.length > 1)
                              Text(
                                pickupLines[1],
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Drop-off
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Drop-off',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              testCenterLines[0],
                              style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                            if (testCenterLines.length > 1)
                              Text(
                                testCenterLines[1],
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              
              // Distance & Duration
              BlocBuilder<DirectionBloc, DirectionState>(
                builder: (context, dirState) {
                  final hasDirectionData = dirState.status == DirectionStatus.success &&
                      (dirState.distance.isNotEmpty || dirState.duration.isNotEmpty);
                  final isLoadingDir = dirState.status == DirectionStatus.loading;

                  // Fallback (no route from Directions): both figures must
                  // describe the SAME journey - the drive to pickup. Previously
                  // this paired distance-to-pickup with the lesson duration,
                  // which are unrelated quantities.
                  final distanceText = hasDirectionData
                      ? dirState.distance
                      : "${rideInfo.pickupDistance?.toStringAsFixed(1) ?? '0.0'} km";
                  final durationText = hasDirectionData
                      ? dirState.duration
                      : context.pricing.estimateTravelTime(rideInfo.pickupDistance);

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: isLoadingDir
                        ? const Row(
                            children: [
                              SizedBox(
                                width: 14,
                                height: 14,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Calculating route...',
                                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                hasDirectionData ? Icons.route : Icons.route_outlined,
                                size: 16,
                                color: hasDirectionData ? Colors.blue : Colors.black87,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                distanceText,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              const SizedBox(width: 24),
                              Icon(
                                hasDirectionData ? Icons.access_time : Icons.timelapse,
                                size: 16,
                                color: hasDirectionData ? Colors.blue : Colors.black87,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                durationText,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ],
                          ),
                  );
                },
              ),

              // Lesson duration is a separate quantity from the drive to
              // pickup above, so it gets its own labelled row rather than
              // being smuggled into the route chip.
              if (rideInfo.totalRideHour != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.hourglass_bottom,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Lesson duration',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${rideInfo.totalRideHour!.toStringAsFixed(2)} hr',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 24),

              // Buttons row
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed:
                          isLoading ? null : () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey.shade700,
                        side: BorderSide(color: Colors.grey.shade300),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Close",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              context.read<UpcomingRideBloc>().add(
                                  UpcomingRideEvent.accept(id: rideInfo.id));
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isLoading ? Colors.grey : const Color(0xFF4CAF50),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2),
                            )
                          : const Text('Accept Ride',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
