import 'dart:developer';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/domain/ride_session/ride_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elan/presentation/bloc/direction_bloc/direction_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class DirectionMapPage extends StatefulWidget {
  const DirectionMapPage({super.key, required this.rideSession});
  final RideSession? rideSession;

  @override
  State<DirectionMapPage> createState() => _DirectionMapPageState();
}

class _DirectionMapPageState extends State<DirectionMapPage> {
  late LatLng _initialPosition;
  late Set<Marker> _markers;
  Set<Polyline> _polylines = {};
  GoogleMapController? _mapController;
  Position? _currentPosition;
  String _pickupAddress = "Fetching...";
  String _dropoffAddress = "Fetching...";

  @override
  void initState() {
    super.initState();

    final pickupLat = widget.rideSession?.pickupLatitude;
    final pickupLng = widget.rideSession?.pickupLongitude;
    final dropoffLat = widget.rideSession?.dropoffLatitude;
    final dropoffLng = widget.rideSession?.dropoffLongitude;

    log('🗺️ DirectionMapPage initState');
    log('📍 RideSession data: ${widget.rideSession}');
    log('📍 Pickup: lat=$pickupLat, lng=$pickupLng');
    log('📍 Drop-off: lat=$dropoffLat, lng=$dropoffLng');

    _initialPosition = (pickupLat != null && pickupLng != null)
        ? LatLng(pickupLat, pickupLng)
        : const LatLng(37.7749, -122.4194);

    log('📍 Pickup position set to: ${_initialPosition.latitude}, ${_initialPosition.longitude}');

    // Create markers for both pickup and drop-off
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('pickup'),
        position: _initialPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(
          title: 'Pickup Location',
          snippet: 'Start of ride',
        ),
      ),
    };

    // Add drop-off marker if coordinates available
    if (dropoffLat != null && dropoffLng != null) {
      final dropoffPosition = LatLng(dropoffLat, dropoffLng);
      markers.add(
        Marker(
          markerId: const MarkerId('dropoff'),
          position: dropoffPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(
            title: 'Drop-off Location',
            snippet: 'End of ride',
          ),
        ),
      );
      log('📍 Drop-off marker added at: ${dropoffPosition.latitude}, ${dropoffPosition.longitude}');
    } else {
      log('⚠️ No drop-off coordinates available');
    }

    _markers = markers;
    _fetchAddresses();
  }

  Future<void> _fetchAddresses() async {
    try {
      final pickupLat = widget.rideSession?.pickupLatitude;
      final pickupLng = widget.rideSession?.pickupLongitude;
      if (pickupLat != null && pickupLng != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(pickupLat, pickupLng);
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          final address = [p.street, p.subLocality, p.locality].where((e) => e != null && e.isNotEmpty).join(', ');
          if (mounted) setState(() => _pickupAddress = address);
        }
      } else {
        if (mounted) setState(() => _pickupAddress = "Unknown Pickup Location");
      }
    } catch (e) {
      log('Error fetching pickup address: $e');
      if (mounted) setState(() => _pickupAddress = "Address not found");
    }

    try {
      final dropoffLat = widget.rideSession?.dropoffLatitude;
      final dropoffLng = widget.rideSession?.dropoffLongitude;
      if (dropoffLat != null && dropoffLng != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(dropoffLat, dropoffLng);
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          final address = [p.street, p.subLocality, p.locality].where((e) => e != null && e.isNotEmpty).join(', ');
          if (mounted) setState(() => _dropoffAddress = address);
        }
      } else {
        if (mounted) setState(() => _dropoffAddress = "Unknown Drop-off Location");
      }
    } catch (e) {
      log('Error fetching drop-off address: $e');
      if (mounted) setState(() => _dropoffAddress = "Address not found");
    }
  }

  Future<void> _fetchDirections(BuildContext context) async {
    log('🚀 Starting _fetchDirections');

    final dropoffLat = widget.rideSession?.dropoffLatitude;
    final dropoffLng = widget.rideSession?.dropoffLongitude;

    // Check if we have drop-off coordinates
    if (dropoffLat == null || dropoffLng == null) {
      log('⚠️ No drop-off coordinates available, cannot fetch directions');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Drop-off location not available for this ride'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    try {
      log('📍 Checking location permission...');
      LocationPermission permission = await Geolocator.checkPermission();
      log('📍 Current permission: $permission');

      if (permission == LocationPermission.denied) {
        log('⚠️ Permission denied, requesting...');
        permission = await Geolocator.requestPermission();
        log('📍 Permission after request: $permission');
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        log('✅ Permission granted, getting current position...');
        final position = await Geolocator.getCurrentPosition();
        log('📍 Current position: ${position.latitude}, ${position.longitude}');

        if (!mounted) {
          log('⚠️ Widget not mounted, returning');
          return;
        }

        setState(() {
          _currentPosition = position;
        });

        final dropoffPosition = LatLng(dropoffLat, dropoffLng);
        final pickupPosition = _initialPosition;
        final myLocation = LatLng(position.latitude, position.longitude);

        // Determine destination based on distance to pickup
        final distToPickup = Geolocator.distanceBetween(
          myLocation.latitude,
          myLocation.longitude,
          pickupPosition.latitude,
          pickupPosition.longitude,
        );

        LatLng destinationPosition;
        if (distToPickup > 200) {
          destinationPosition = pickupPosition;
          log('🗺️ Routing to pickup location because driver is ${distToPickup.toStringAsFixed(0)}m away');
        } else {
          destinationPosition = dropoffPosition;
          log('🗺️ Routing to drop-off location because driver is at pickup location');
        }

        // Calculate distance between current location and destination
        final distanceInMeters = Geolocator.distanceBetween(
          myLocation.latitude,
          myLocation.longitude,
          destinationPosition.latitude,
          destinationPosition.longitude,
        );
        final distanceInKm = distanceInMeters / 1000;

        log('📏 Distance to destination: ${distanceInKm.toStringAsFixed(2)} km');

        // Check if distance is reasonable (let's say within 500km for driving directions)
        if (distanceInKm > 500) {
          log('⚠️ Distance too large for driving directions: ${distanceInKm.toStringAsFixed(2)} km');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Destination is ${distanceInKm.toStringAsFixed(0)} km away. '
                  'Directions are only available for rides within 500km.',
                ),
                backgroundColor: Colors.orange,
                duration: const Duration(seconds: 5),
              ),
            );
          }
          return;
        }

        log('🗺️ Fetching directions from current location to destination');
        log('📍 Origin: ${myLocation.latitude}, ${myLocation.longitude}');
        log('📍 Destination: ${destinationPosition.latitude}, ${destinationPosition.longitude}');

        context.read<DirectionBloc>().add(
              DirectionEvent.fetchDirections(
                origin: myLocation,
                destination: destinationPosition,
              ),
            );
        log('✅ Direction fetch event dispatched to bloc');
      } else {
        log('❌ Permission not granted: $permission');
      }
    } catch (e, stackTrace) {
      log('❌ Error fetching directions: $e');
      log('Stack trace: $stackTrace');
      AppLog.d("Error fetching directions: $e");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {

      return BlocListener<DirectionBloc, DirectionState>(
        listener: (context, state) {
          log('🔔 DirectionBloc state changed: ${state.status}');

          if (state.status == DirectionStatus.success &&
              state.routePoints.isNotEmpty) {
            log('✅ Direction fetch successful!');
            log('📍 Route points count: ${state.routePoints.length}');
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
            log('🗺️ Polyline created, fitting bounds...');
            _fitBounds(state.routePoints);
          } else if (state.status == DirectionStatus.error) {
            log('❌ Direction fetch failed: ${state.error?.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      state.error?.message ?? "Error fetching directions")),
            );
          } else if (state.status == DirectionStatus.loading) {
            log('⏳ Direction fetch in progress...');
          } else {
            log('ℹ️ Direction state: ${state.status}, route points: ${state.routePoints.length}');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Navigator.canPop(context) ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
              onPressed: () => Navigator.of(context).pop(),
            ) : null,
            title: Text(
              'Pickup Location',
              style: ibmPlexSerifH5Style(
                  color: Theme.of(context).primaryColorDark),
            ),
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 12,
                ),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _markers,
                polylines: _polylines,
                onMapCreated: (controller) async {
                  log('🗺️ GoogleMap created, controller initialized');
                  _mapController = controller;

                  // Get current position first
                  try {
                    final position = await Geolocator.getCurrentPosition();
                    final myLocation =
                        LatLng(position.latitude, position.longitude);

                    // Calculate distance
                    final distanceInMeters = Geolocator.distanceBetween(
                      myLocation.latitude,
                      myLocation.longitude,
                      _initialPosition.latitude,
                      _initialPosition.longitude,
                    );
                    final distanceInKm = distanceInMeters / 1000;

                    log('📏 Initial distance check: ${distanceInKm.toStringAsFixed(2)} km');

                    // If pickup is too far, center on user's current location instead
                    if (distanceInKm > 500) {
                      log('🗺️ Centering map on current location (pickup too far)');
                      controller.animateCamera(
                        CameraUpdate.newLatLngZoom(myLocation, 14),
                      );
                    } else {
                      log('🗺️ Keeping map centered on pickup location');
                    }
                  } catch (e) {
                    log('⚠️ Could not get current position for map centering: $e');
                  }

                  // Trigger direction fetch
                  log('🚀 Triggering direction fetch from onMapCreated');
                  _fetchDirections(context);
                },
              ),
              Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: _buildAddressCard(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAddressCard() {
    final pickup = _pickupAddress;
    final dropoff = _dropoffAddress;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.my_location, color: Colors.green, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  pickup,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, top: 4, bottom: 4),
            child: Container(
              height: 16,
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dropoff,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
