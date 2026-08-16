import 'package:elan/core/app_colors.dart';
import 'package:elan/domain/common/ride/ride_leg.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Turns computed legs into map overlays.
///
/// The styling carries meaning, per `INSTRUCTOR_APP_RIDE_JOURNEY.md` §11: the
/// instructor must be able to tell **paid work from deadhead at a glance**.
/// A single uniform line — which is what the app drew before — makes a 200 km
/// unpaid commute look identical to a 5 km paid leg.
///
/// * deadhead — grey, dashed, thin
/// * pickup run — brand green, solid, thick
/// * return — brand green, solid, half opacity
class RideRouteStyle {
  const RideRouteStyle._();

  static Set<Polyline> polylines(List<RideLeg> legs) {
    final out = <Polyline>{};
    for (final leg in legs) {
      if (!leg.hasRoute) continue;
      out.add(
        Polyline(
          polylineId: PolylineId(leg.kind.name),
          points: leg.points,
          color: _colorOf(leg.kind),
          width: _widthOf(leg.kind),
          patterns: _patternOf(leg.kind),
          // Paid legs sit above the deadhead where they overlap, so the leg
          // that matters is never hidden underneath the one that does not.
          zIndex: leg.kind.isPaid ? 2 : 1,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
        ),
      );
    }
    return out;
  }

  static Color _colorOf(RideLegKind kind) => switch (kind) {
        RideLegKind.deadhead => const Color(0xFF9E9E9E),
        RideLegKind.pickupRun => RideCardColors.actionGreen,
        RideLegKind.returnRun =>
          RideCardColors.actionGreen.withValues(alpha: 0.5),
      };

  static int _widthOf(RideLegKind kind) => switch (kind) {
        RideLegKind.deadhead => 4,
        RideLegKind.pickupRun => 6,
        RideLegKind.returnRun => 5,
      };

  static List<PatternItem> _patternOf(RideLegKind kind) => switch (kind) {
        RideLegKind.deadhead => <PatternItem>[
            PatternItem.dash(20),
            PatternItem.gap(12),
          ],
        _ => const <PatternItem>[],
      };

  /// Bounds that contain [points], with a little padding applied by the caller.
  ///
  /// Returns null for an empty list so callers can skip the camera move rather
  /// than animate to a degenerate box.
  static LatLngBounds? boundsOf(List<LatLng> points) {
    if (points.isEmpty) return null;

    var minLat = points.first.latitude;
    var maxLat = points.first.latitude;
    var minLng = points.first.longitude;
    var maxLng = points.first.longitude;

    for (final p in points) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    // A single point (or a perfectly straight N/S route) produces a zero-area
    // box, which newLatLngBounds rejects. Nudge it open.
    const epsilon = 0.0015;
    if ((maxLat - minLat).abs() < epsilon) {
      minLat -= epsilon;
      maxLat += epsilon;
    }
    if ((maxLng - minLng).abs() < epsilon) {
      minLng -= epsilon;
      maxLng += epsilon;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}
