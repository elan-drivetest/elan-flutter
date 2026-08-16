import 'package:elan/domain/common/ride/ride.dart';

/// The two shapes a booking can take.
///
/// Decided by exactly one field — `booking.meet_at_center`
/// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §2). That boolean is authoritative and
/// always present, so it is the only thing that may select the shape.
///
/// The app previously inferred the shape from `pickup_address == null`. That is
/// *usually* equivalent, because the backend nulls the pickup fields for
/// meet-at-centre bookings — but it is an inference, and it silently routes the
/// instructor to a stale pickup address whenever the two disagree.
enum RideShape {
  /// Customer is collected from their address, driven to the centre, and
  /// returned to the same address afterwards. Legs 0, 1 and 2 all exist.
  pickupRide,

  /// Customer makes their own way to the centre; the instructor meets them
  /// there. Only the deadhead (Leg 0) exists — there is no billable pickup run.
  meetAtCentre,
}

extension RideShapeX on Ride {
  RideShape get shape =>
      (meetAtCenter ?? false) ? RideShape.meetAtCentre : RideShape.pickupRide;

  bool get isMeetAtCentre => shape == RideShape.meetAtCentre;

  /// One-way pickup → test centre, in kilometres.
  ///
  /// This is `booking.pickup_distance` verbatim — computed by Distance Matrix
  /// once at booking time (§5.1). Never recompute it on device: a Directions
  /// call differs by a few hundred metres and would contradict the estimate.
  ///
  /// Null for meet-at-centre, where the backend stores `0` because there is no
  /// pickup run at all — showing "0.0 km" there would read as a broken value.
  ///
  /// **For display, prefer [roundTripDistanceKm].** This one-way figure is not
  /// the drive the instructor makes.
  double? get oneWayDistanceKm {
    if (isMeetAtCentre) return null;
    final d = pickupDistance;
    return (d == null || d <= 0) ? null : d;
  }

  /// The drive the instructor actually makes: **`2 × pickup_distance`**.
  ///
  /// `pickup_distance` is one-way, but the customer is returned to the address
  /// they were collected from, so the instructor drives it twice. The server's
  /// estimate doubles it for exactly this reason (§7.1), which means quoting
  /// the one-way number puts a distance on the card that disagrees with the
  /// price directly beside it — the §14.1 bug.
  ///
  /// Note this deliberately does *not* mirror the customer's fare, where a
  /// pickup beyond `base_distance` is billed one way. That is a pricing
  /// concession, not a shorter drive (§7.3).
  double? get roundTripDistanceKm {
    final oneWay = oneWayDistanceKm;
    return oneWay == null ? null : oneWay * 2;
  }

  /// Where the customer ends up after the test.
  ///
  /// The backend has **no drop-off column** (§3). The return leg is real — it is
  /// why short pickups are billed both ways — but its destination is simply the
  /// pickup address again.
  String? get returnAddress => isMeetAtCentre ? null : pickupAddress;

  /// The address the instructor is heading to first.
  String? get firstDestinationAddress =>
      isMeetAtCentre ? testCenterAddress : pickupAddress;
}
