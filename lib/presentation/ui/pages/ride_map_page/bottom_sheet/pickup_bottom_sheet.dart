import 'package:elan/core/ride_earnings.dart';
import 'package:elan/core/booking_time.dart';
import 'package:elan/presentation/ui/widgets/common/ride_legs_section.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupBottomSheet extends StatelessWidget {
  final Ride rideInfo;

  const PickupBottomSheet({
    super.key,
    required this.rideInfo,
  });

  @override
  Widget build(BuildContext context) {
    // Rendered in the BOOKING's timezone, not the device's (RIDE_JOURNEY §12.4).
    final formattedDate =
        BookingTime.format(rideInfo.testDate, rideInfo.timezone);

    // Meet-at-centre bookings price at 0 because there is no pickup run;
    // quoting the hourly rate is the honest version (§14.3).
    final earnings = RideEarnings.estimate(ridePriceCents: rideInfo.ridePrice);
    final ridePrice = earnings.amount;

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
              .add(const AvailableRideEvent.refreshData());
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
        // The journey rows are variable height — three stops with wrapping
        // addresses on a pickup ride, one on a meet-at-centre — so the sheet
        // must be able to scroll rather than assume it fits.
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
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
                                const Icon(Icons.access_time,
                                    size: 14, color: Colors.black54),
                                const SizedBox(width: 4),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                if ((rideInfo.phoneNumber ?? '')
                                    .isNotEmpty) ...[
                                  const SizedBox(width: 12),
                                  const Icon(Icons.phone,
                                      size: 14, color: Colors.black54),
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

                  RideLegsSection(rideInfo: rideInfo),

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
                                      UpcomingRideEvent.accept(
                                          id: rideInfo.id));
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLoading
                                ? Colors.grey
                                : const Color(0xFF4CAF50),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
