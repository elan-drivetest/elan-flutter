import 'dart:convert';

import 'package:elan/core/app_colors.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/common/ride/ride_leg.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:elan/domain/ride_session/ride_session.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/ride_route_bloc/ride_route_bloc.dart';
import 'package:elan/presentation/ui/widgets/common/ride_route_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Navigation for a ride that is under way.
///
/// ## What was wrong
///
/// This screen used to take a [RideSession] and route from the instructor to
/// its `dropoff_latitude/longitude`. But those columns are **null for the whole
/// duration of an in-progress ride** — the backend writes them at Stop, and
/// `ride-session.repository.ts:254` literally identifies an active session by
/// `isNull(dropoff_latitude)`. The page's own guard then bailed out with
/// *"Drop-off location not available for this ride"*, so navigation failed on
/// **every** active ride, every time.
///
/// It also could not have worked in principle: a RideSession carries no test
/// centre and no customer address (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §8.8 — it
/// "contains no booking data at all"). The journey is a property of the
/// *booking*, which is why the app now caches that at Start.
///
/// ## What it does now
///
/// Rebuilds the real leg model (§3) — deadhead → pickup run → return — from the
/// booking. `/rides/upcoming` now returns test-centre coordinates (§14.2
/// fixed), so they are read straight off the booking; the app used to recover
/// them by matching centre names against `/v1/drive-test-centers`.
///
/// The session is still used for the one thing it genuinely knows: where the
/// instructor was standing when they pressed Start.
class DirectionMapPage extends StatefulWidget {
  const DirectionMapPage({super.key, required this.rideSession, this.booking});

  final RideSession? rideSession;

  /// Optional — falls back to the booking cached at Start.
  final Ride? booking;

  @override
  State<DirectionMapPage> createState() => _DirectionMapPageState();
}

class _DirectionMapPageState extends State<DirectionMapPage> {
  static const LatLng _fallbackPosition = LatLng(56.1304, -106.3468);

  final _cache = getIt<CacheManagerImpl>();

  GoogleMapController? _mapController;
  Ride? _booking;
  LatLng? _testCentre;
  LatLng? _currentPosition;
  bool _resolving = true;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  /// Gathers everything the route needs before asking for it: the booking, the
  /// centre coordinates, and a GPS fix. Each is independently optional — a
  /// missing GPS fix costs the deadhead leg but not the billable ones.
  Future<void> _prepare() async {
    final booking = widget.booking ?? await _cachedBooking();

    LatLng? centre;
    final centreLat = booking?.testCenterLatitude;
    final centreLng = booking?.testCenterLongitude;
    if (centreLat != null && centreLng != null) {
      centre = LatLng(centreLat, centreLng);
    }

    LatLng? current;
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition();
        current = LatLng(position.latitude, position.longitude);
      }
    } catch (e) {
      AppLog.d('DirectionMapPage: no GPS fix — $e');
    }

    if (!mounted) return;
    setState(() {
      _booking = booking;
      _testCentre = centre;
      _currentPosition = current;
      _resolving = false;
    });

    if (booking != null) {
      context.read<RideRouteBloc>().add(
            RideRouteEvent.build(
              ride: booking,
              currentPosition: current,
              testCentre: centre,
            ),
          );
    }
  }

  /// The booking being driven, read from the cache written at Start.
  ///
  /// This cache is the **only** copy, which is why it is written before
  /// `/rides/start` is even called. `/rides/current` now returns `booking_id`
  /// (§8.8), but that id cannot be redeemed for a booking: there is no
  /// instructor-facing get-booking-by-id endpoint, and `/rides/upcoming`
  /// excludes the ride the moment it starts — its query requires the session to
  /// be `scheduled` and the test date to still be in the future
  /// (`booking.repository.ts:385`). So a cleared cache means no route, and the
  /// screen degrades to the session's Start coordinates alone.
  Future<Ride?> _cachedBooking() async {
    try {
      final raw = await _cache.getActiveBooking();
      if (raw == null || raw.isEmpty) return null;
      return Ride.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (e) {
      AppLog.e('DirectionMapPage: cached booking unreadable', error: e);
      return null;
    }
  }

  /// Where the instructor pressed Start. This is what a RideSession's
  /// `pickup_latitude/longitude` actually hold (§8.4) — not the customer's
  /// address, despite the column name.
  LatLng? get _startedAt {
    final lat = widget.rideSession?.pickupLatitude;
    final lng = widget.rideSession?.pickupLongitude;
    return (lat != null && lng != null) ? LatLng(lat, lng) : null;
  }

  LatLng? get _customerPickup {
    final lat = _booking?.pickupLatitude;
    final lng = _booking?.pickupLongitude;
    return (lat != null && lng != null) ? LatLng(lat, lng) : null;
  }

  Set<Marker> _buildMarkers() {
    final markers = <Marker>{};
    final isMeetAtCentre = _booking?.isMeetAtCentre ?? false;

    if (!isMeetAtCentre && _customerPickup != null) {
      markers.add(Marker(
        markerId: const MarkerId('pickup'),
        position: _customerPickup!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
          title: _booking?.fullName ?? 'Pickup',
          snippet: _booking?.pickupAddress,
        ),
      ));
    }

    if (_testCentre != null) {
      markers.add(Marker(
        markerId: const MarkerId('test_centre'),
        position: _testCentre!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(
          title: _booking?.testCenterName ?? 'Test centre',
          snippet: _booking?.testCenterAddress,
        ),
      ));
    }

    // Only worth showing once the instructor has moved away from it.
    if (_startedAt != null) {
      markers.add(Marker(
        markerId: const MarkerId('started_at'),
        position: _startedAt!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: const InfoWindow(
          title: 'Ride started here',
          snippet: 'Where you pressed Start',
        ),
      ));
    }

    return markers;
  }

  void _fitTo(List<LatLng> points) {
    final bounds = RideRouteStyle.boundsOf(points);
    if (bounds == null || _mapController == null) return;
    _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text(
          'Ride route',
          style: ibmPlexSerifH5Style(color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: BlocConsumer<RideRouteBloc, RideRouteState>(
        listener: (context, state) {
          if (state.status == RideRouteStatus.success) {
            // Fit the PAID legs, not everything: on a long deadhead the leg
            // that actually matters shrinks to nothing (§11).
            final focus = state.paidPoints.isNotEmpty
                ? state.paidPoints
                : state.allPoints;
            _fitTo(focus);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _testCentre ??
                      _customerPickup ??
                      _startedAt ??
                      _currentPosition ??
                      _fallbackPosition,
                  zoom: 12,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _buildMarkers(),
                polylines: RideRouteStyle.polylines(state.legs),
                onMapCreated: (c) => _mapController = c,
              ),
              Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: _RouteCard(
                  resolving: _resolving,
                  booking: _booking,
                  state: state,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Bottom card describing the legs, with a legend that matches the map.
class _RouteCard extends StatelessWidget {
  const _RouteCard({
    required this.resolving,
    required this.booking,
    required this.state,
  });

  final bool resolving;
  final Ride? booking;
  final RideRouteState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    if (resolving) {
      return const Row(
        children: [
          SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2)),
          SizedBox(width: 12),
          Text('Working out your route…'),
        ],
      );
    }

    if (booking == null) {
      // Honest dead end — but a different one from before. This means the app
      // has no record of the booking (started before this build shipped, or
      // reinstalled mid-ride), not that the API is missing a field.
      return const Text(
        'Ride details unavailable on this device.\n'
        'Open the ride from your dashboard to restore them.',
        style: TextStyle(fontSize: 13, color: Colors.black54),
      );
    }

    final isMeetAtCentre = booking!.isMeetAtCentre;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isMeetAtCentre ? 'Meet at test centre' : 'Pickup ride',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 10),
        if (!isMeetAtCentre)
          _LegLine(
            colour: RideCardColors.actionGreen,
            dashed: false,
            label: 'Round trip',
            // Out and back — the drive actually made. The kilometre figure is
            // derived from the API's pickup_distance, never from a Directions
            // result: the pay estimate was computed from this number (§5.3).
            value: booking!.roundTripDistanceKm != null
                ? '${booking!.roundTripDistanceKm!.toStringAsFixed(1)} km'
                : '--',
            eta: state.pickupRun?.durationText,
          ),
        _LegLine(
          colour: const Color(0xFF9E9E9E),
          dashed: true,
          label: 'Your drive',
          value: state.deadhead?.distanceText ?? '--',
          eta: state.deadhead?.durationText,
        ),
        if (!isMeetAtCentre)
          _LegLine(
            colour: RideCardColors.actionGreen.withValues(alpha: 0.5),
            dashed: false,
            label: 'Return',
            value: 'Back to pickup',
            eta: state.returnRun?.durationText,
          ),
        if (state.status == RideRouteStatus.error) ...[
          const SizedBox(height: 8),
          Text(
            state.error?.message ?? 'Route unavailable.',
            style: const TextStyle(fontSize: 12, color: Colors.redAccent),
          ),
        ],
      ],
    );
  }
}

class _LegLine extends StatelessWidget {
  const _LegLine({
    required this.colour,
    required this.dashed,
    required this.label,
    required this.value,
    this.eta,
  });

  final Color colour;
  final bool dashed;
  final String label;
  final String value;
  final String? eta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          // Mirrors the polyline styling so the card reads as a legend.
          Container(
            width: 18,
            height: 3,
            decoration: BoxDecoration(
              color: dashed ? colour.withValues(alpha: 0.6) : colour,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(label,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
          const Spacer(),
          Text(
            eta == null || eta!.isEmpty ? value : '$value · $eta',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
