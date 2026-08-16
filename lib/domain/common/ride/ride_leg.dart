import 'package:google_maps_flutter/google_maps_flutter.dart';

/// The legs of a ride, in the backend's vocabulary
/// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §3).
///
/// Naming these explicitly is the whole point: the app used to draw a single
/// unnamed polyline whose meaning changed depending on how far away the
/// instructor was, which made "how far is this job" unanswerable.
enum RideLegKind {
  /// Instructor's live position → first destination. **Not paid, not stored.**
  /// The app computes it; the backend has no idea it exists.
  deadhead,

  /// Pickup → test centre. The one billable, backend-owned leg. Its kilometre
  /// figure must come from `booking.pickup_distance`, not from Directions.
  pickupRun,

  /// Test centre → pickup. Real (short pickups are billed both ways) but has no
  /// backend field, so it is a mirror of [pickupRun].
  returnRun,
}

extension RideLegKindX on RideLegKind {
  String get label => switch (this) {
        RideLegKind.deadhead => 'Your drive',
        RideLegKind.pickupRun => 'Pickup run',
        RideLegKind.returnRun => 'Return',
      };

  /// Whether the instructor is paid for this leg.
  bool get isPaid => this != RideLegKind.deadhead;
}

/// One computed leg: the drawn route plus Google's own distance/duration text.
///
/// [distanceText] and [durationText] are **estimates from Directions** and are
/// safe for ETAs and for the deadhead. For [RideLegKind.pickupRun] the
/// kilometre figure shown to the instructor must still come from
/// `booking.pickup_distance` — they differ by a few hundred metres and the pay
/// estimate was derived from the API number (§5.3).
class RideLeg {
  const RideLeg({
    required this.kind,
    required this.points,
    required this.distanceText,
    required this.durationText,
  });

  final RideLegKind kind;
  final List<LatLng> points;
  final String distanceText;
  final String durationText;

  bool get hasRoute => points.isNotEmpty;
}
