import 'package:elan/core/app_colors.dart';
import 'package:elan/core/ride_earnings.dart';
import 'package:elan/injection.dart';
import 'package:elan/core/booking_time.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart';
import 'package:elan/presentation/ui/pages/upcoming_ride_map_page/bottom_sheet/upcoming_pickup_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UpcomingRideMapPage extends StatefulWidget {
  const UpcomingRideMapPage({super.key, required this.rideInfo});
  final Ride rideInfo;

  @override
  State<UpcomingRideMapPage> createState() => _UpcomingRideMapPageState();
}

class _UpcomingRideMapPageState extends State<UpcomingRideMapPage> {
  /// Shown only when a booking arrives with no usable coordinates at all.
  /// Approximate centre of Canada — the previous value was San Francisco.
  static const LatLng _fallbackPosition = LatLng(56.1304, -106.3468);

  late LatLng _initialPosition;
  late Set<Marker> _markers;
  Set<Polyline> _polylines = {};

  bool _isShowingTestCenter = false;
  GoogleMapController? _mapController;

  void _fitBounds(List<LatLng> points) {
    if (_mapController == null || points.isEmpty) return;

    double minLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLat = points.first.latitude;
    double maxLng = points.first.longitude;

    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }

    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        50, // padding
      ),
    );
  }

  void _openBottomSheet() {
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      // Without this the sheet is capped at ~9/16 of the screen and its
      // contents overflow instead of scrolling.
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => UpcomingPickupBottomSheet(rideInfo: widget.rideInfo),
    );
  }

  @override
  void initState() {
    super.initState();

    // Shape comes from `meet_at_center`, never from "is the pickup null"
    // (RIDE_JOURNEY §2).
    //
    // GET /v1/rides/upcoming now selects the test centre's coordinates (§14.2
    // fixed). They used to arrive null on every accepted ride, so this screen
    // had to identify the centre by matching its name against the public
    // centres list before it could draw anything.
    final ride = widget.rideInfo;
    final pickupLat = ride.pickupLatitude;
    final pickupLng = ride.pickupLongitude;
    final testCenterLat = ride.testCenterLatitude;
    final testCenterLng = ride.testCenterLongitude;

    if (ride.isMeetAtCentre) {
      _isShowingTestCenter = true;
      _initialPosition = (testCenterLat != null && testCenterLng != null)
          ? LatLng(testCenterLat, testCenterLng)
          : _fallbackPosition;
    } else if (pickupLat != null && pickupLng != null) {
      _isShowingTestCenter = false;
      _initialPosition = LatLng(pickupLat, pickupLng);
    } else {
      _isShowingTestCenter = true;
      _initialPosition = (testCenterLat != null && testCenterLng != null)
          ? LatLng(testCenterLat, testCenterLng)
          : _fallbackPosition;
    }

    _markers = {
      Marker(
        markerId: MarkerId(_isShowingTestCenter ? 'test_center' : 'pickup'),
        position: _initialPosition,
        onTap: _openBottomSheet,
        infoWindow: InfoWindow(
          title: _isShowingTestCenter
              ? (widget.rideInfo.testCenterName ?? 'Test Center')
              : (widget.rideInfo.fullName ?? ''),
          snippet: _isShowingTestCenter
              ? widget.rideInfo.testCenterAddress
              : (widget.rideInfo.pickupAddress ?? 'No address provided'),
        ),
      ),
    };

    // Automatically fetch directions from instructor's current location
    _fetchDirectionsAutomatically();
  }

  Future<void> _fetchDirectionsAutomatically() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        if (mounted) {
          context.read<DirectionBloc>().add(
                DirectionEvent.fetchDirections(
                  origin: LatLng(position.latitude, position.longitude),
                  destination: _initialPosition,
                ),
              );
        }
      }
    } catch (e) {
      // Silently fail — user can still tap the directions button manually
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format date
    // Booking's timezone, not the device's (RIDE_JOURNEY §12.4).
    final formattedDate =
        BookingTime.format(widget.rideInfo.testDate, widget.rideInfo.timezone);

    final priceStr =
        RideEarnings.estimate(ridePriceCents: widget.rideInfo.ridePrice).amount;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Navigator.canPop(context)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.black87, size: 18),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              : null,
        ),
        body: BlocListener<DirectionBloc, DirectionState>(
          listener: (context, state) {
            if (state.status == DirectionStatus.success &&
                state.routePoints.isNotEmpty) {
              setState(() {
                _polylines = {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    color: Colors.blue,
                    width: 5,
                    points: state.routePoints,
                  ),
                };
              });
              _fitBounds(state.routePoints);
            } else if (state.status == DirectionStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        state.error?.message ?? "Error fetching directions")),
              );
            } else if (state.status == DirectionStatus.loading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Fetching directions..."),
                    duration: Duration(seconds: 1)),
              );
            }
          },
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 12,
                ),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                polylines: _polylines,
                onMapCreated: (controller) {
                  _mapController = controller;
                  // Ensure info window is always visible by default
                  controller.showMarkerInfoWindow(MarkerId(
                      _isShowingTestCenter ? 'test_center' : 'pickup'));
                },
                markers: _markers,
                padding: const EdgeInsets.only(
                    top: 180, bottom: 100), // Adjust map center
              ),

              // Custom Map Controls (Location on top of Zoom)
              Positioned(
                right: 16,
                bottom: 110, // Positioned right above the bottom button
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Directions Button
                    FloatingActionButton.small(
                      heroTag: "directions_btn",
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        try {
                          LocationPermission permission =
                              await Geolocator.checkPermission();
                          if (permission == LocationPermission.denied) {
                            permission = await Geolocator.requestPermission();
                          }
                          if (permission == LocationPermission.whileInUse ||
                              permission == LocationPermission.always) {
                            final position =
                                await Geolocator.getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.high);

                            if (context.mounted) {
                              context.read<DirectionBloc>().add(
                                    DirectionEvent.fetchDirections(
                                      origin: LatLng(position.latitude,
                                          position.longitude),
                                      destination: _initialPosition,
                                    ),
                                  );
                            }
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Location permission is required for directions.")),
                              );
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Could not determine current location.")),
                            );
                          }
                        }
                      },
                      child: const Icon(Icons.directions),
                    ),
                    const SizedBox(height: 12),
                    // Current Location Button
                    FloatingActionButton.small(
                      heroTag: "my_location_btn",
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      onPressed: () async {
                        try {
                          Position? position =
                              await Geolocator.getLastKnownPosition();
                          position ??= await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high);

                          _mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(
                                LatLng(position.latitude, position.longitude),
                                14),
                          );
                        } catch (e) {
                          // Fallback if permission denied or location disabled
                          _mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(_initialPosition, 14),
                          );
                        }
                      },
                      child: const Icon(Icons.my_location),
                    ),
                    const SizedBox(height: 12),
                    // Zoom In
                    FloatingActionButton.small(
                      heroTag: "zoom_in_btn",
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      onPressed: () {
                        _mapController?.animateCamera(CameraUpdate.zoomIn());
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 4),
                    // Zoom Out
                    FloatingActionButton.small(
                      heroTag: "zoom_out_btn",
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      onPressed: () {
                        _mapController?.animateCamera(CameraUpdate.zoomOut());
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ),

              // Top Floating Info
              Positioned(
                top: MediaQuery.of(context).padding.top + kToolbarHeight + 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // A meet-at-centre booking has no pickup by design
                    // (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §2) — it is the arrangement, not
                    // missing data. An amber "Pickup location not provided" card framed
                    // normal business logic as a fault in the app.

                    // Ride Summary Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 16,
                              offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color(0xFF4CAF50).withOpacity(0.1),
                                  child: const Icon(Icons.person,
                                      color: Color(0xFF4CAF50)),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.rideInfo.fullName ?? 'Unknown',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87),
                                      ),
                                      const SizedBox(height: 2),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4CAF50)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          widget.rideInfo.testType ?? '',
                                          style: const TextStyle(
                                              color: Color(0xFF4CAF50),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  priceStr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFF4CAF50)),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Divider(height: 1),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 16, color: Colors.black54),
                                const SizedBox(width: 8),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            BlocBuilder<DirectionBloc, DirectionState>(
                              builder: (context, dirState) {
                                if (dirState.status ==
                                        DirectionStatus.success &&
                                    (dirState.distance.isNotEmpty ||
                                        dirState.duration.isNotEmpty)) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: [
                                        // This is the DEADHEAD — instructor to
                                        // the first stop — not the billable
                                        // pickup run. It sat here unlabelled
                                        // next to a differently-derived
                                        // earnings figure, which is exactly the
                                        // confusion RIDE_JOURNEY §14.1 warns
                                        // about. Name it.
                                        const Icon(Icons.navigation_outlined,
                                            size: 16,
                                            color: RideCardColors.mutedText),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Your drive',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 10),
                                        if (dirState.distance.isNotEmpty) ...[
                                          Text(
                                            dirState.distance,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                        if (dirState.distance.isNotEmpty &&
                                            dirState.duration.isNotEmpty)
                                          const SizedBox(width: 16),
                                        if (dirState.duration.isNotEmpty) ...[
                                          const Icon(Icons.access_time,
                                              size: 16,
                                              color: RideCardColors.mutedText),
                                          const SizedBox(width: 6),
                                          Text(
                                            dirState.duration,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ],
                                    ),
                                  );
                                } else if (dirState.status ==
                                    DirectionStatus.loading) {
                                  return const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 14,
                                          height: 14,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Calculating route...',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Floating Button
              Positioned(
                bottom: 32,
                left: 24,
                right: 24,
                child: ElevatedButton(
                  onPressed: _openBottomSheet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 4,
                    shadowColor: const Color(0xFF4CAF50).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('View Details & Accept Ride',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_upward, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
