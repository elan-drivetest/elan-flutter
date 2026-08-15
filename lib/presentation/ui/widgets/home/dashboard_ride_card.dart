import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class DashboardRideCard extends StatelessWidget {
  final String name;
  final String type;
  final String phoneNumber;
  final String time;
  final String pickupLocation;
  final String dropOffLocation;
  final VoidCallback transfer;
  final VoidCallback start;

  const DashboardRideCard({
    super.key,
    required this.name,
    required this.time,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.type,
    required this.phoneNumber,
    required this.transfer,
    required this.start,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Driver info
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type,
                          style: sansDevanagariBold20(
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          name,
                          style: sansDevanagariRegular20(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Phone and time
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16, color: Colors.black54),
                        SizedBox(width: 6),
                        Text(
                          phoneNumber,
                          style: sansDevanagariRegular14(color: Colors.black54),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 16, color: Colors.black54),
                        SizedBox(width: 6),
                        Text(
                          time,
                          style: sansDevanagariRegular14(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: transfer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFFF6F6), // Green background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFFFF0000), // Border color
                        width: 2, // Border width
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    'Transfer Ride',
                    style: sansDevanagariRegular14(
                      color: Color(0xFFFF0000),
                    ),
                  ),
                )
              ],
            ),

            // Pickup and Drop-off
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Pickup section
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pickup',
                          style: sansDevanagariBold14(
                            color: Color(0xFF0C9D58),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          pickupLocation,
                          style: sansDevanagariRegular14(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Drop-off',
                          style: sansDevanagariBold14(
                            color: Color(0xFF0C9D58),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          dropOffLocation,
                          style: sansDevanagariRegular14(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Price and distance
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Test Center',
                            style: sansDevanagariBold14(
                              color: Color(0xFF0C9D58),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            dropOffLocation,
                            style: sansDevanagariRegular14(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: start,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0C9D58), // Green background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Start Ride',
                            style: sansDevanagariBold14(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward,
                              size: 16, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
