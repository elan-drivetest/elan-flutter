import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:flutter_test/flutter_test.dart';

Ride _ride({
  bool? meetAtCenter,
  String? pickupAddress,
  double? pickupDistance,
  String? testCenterAddress = '255 Woodlawn Rd W, Guelph',
}) =>
    Ride(
      id: 1,
      meetAtCenter: meetAtCenter,
      pickupAddress: pickupAddress,
      pickupDistance: pickupDistance,
      testCenterAddress: testCenterAddress,
    );

void main() {
  group('shape is decided by meet_at_center, not by a null pickup', () {
    test('meet_at_center true → meetAtCentre', () {
      expect(_ride(meetAtCenter: true).shape, RideShape.meetAtCentre);
      expect(_ride(meetAtCenter: true).isMeetAtCentre, isTrue);
    });

    test('meet_at_center false → pickupRide', () {
      expect(
        _ride(meetAtCenter: false, pickupAddress: '350 Paisley Rd').shape,
        RideShape.pickupRide,
      );
    });

    test('null meet_at_center defaults to a pickup ride', () {
      // The field is documented as always present; defaulting to the pickup
      // shape keeps the pickup address visible if it ever is not.
      expect(_ride(meetAtCenter: null).shape, RideShape.pickupRide);
    });

    test(
        'a meet-at-centre ride with a stale pickup address is still meetAtCentre',
        () {
      // The regression this replaces: the app inferred the shape from
      // "pickup == null", so a meet-at-centre booking that still carried a
      // pickup address routed the instructor to the wrong place.
      final ride = _ride(
        meetAtCenter: true,
        pickupAddress: '350 Paisley Rd, Guelph',
        pickupDistance: 5.2,
      );
      expect(ride.shape, RideShape.meetAtCentre);
      expect(ride.firstDestinationAddress, '255 Woodlawn Rd W, Guelph');
    });

    test('a pickup ride with no pickup address is still a pickup ride', () {
      expect(_ride(meetAtCenter: false).shape, RideShape.pickupRide);
    });
  });

  group('distance — one-way vs the drive actually made', () {
    test('oneWay is pickup_distance verbatim', () {
      expect(
        _ride(meetAtCenter: false, pickupDistance: 5.2).oneWayDistanceKm,
        5.2,
      );
    });

    test('roundTrip doubles it — the customer is driven home again', () {
      // The server's estimate doubles it too (§7.1), so showing the one-way
      // figure put a distance on the card that disagreed with the price
      // beside it. That was the §14.1 bug.
      expect(
        _ride(meetAtCenter: false, pickupDistance: 5.2).roundTripDistanceKm,
        closeTo(10.4, 1e-9),
      );
    });

    test('both are null for meet-at-centre, not 0.0', () {
      // The backend stores 0 because there is no pickup run. Rendering
      // "0.0 km" would read as a broken value rather than an absent leg.
      final r = _ride(meetAtCenter: true, pickupDistance: 0);
      expect(r.oneWayDistanceKm, isNull);
      expect(r.roundTripDistanceKm, isNull);
    });

    test('both are null when the distance is absent or zero', () {
      expect(_ride(meetAtCenter: false).roundTripDistanceKm, isNull);
      expect(
        _ride(meetAtCenter: false, pickupDistance: 0).roundTripDistanceKm,
        isNull,
      );
    });
  });

  group('returnAddress — Leg 2 has no backend field', () {
    test('is the pickup address for a pickup ride', () {
      expect(
        _ride(meetAtCenter: false, pickupAddress: '350 Paisley Rd')
            .returnAddress,
        '350 Paisley Rd',
      );
    });

    test('does not exist for meet-at-centre', () {
      expect(_ride(meetAtCenter: true).returnAddress, isNull);
    });
  });

  group('firstDestinationAddress — where the instructor heads first', () {
    test('pickup ride → the customer', () {
      expect(
        _ride(meetAtCenter: false, pickupAddress: '350 Paisley Rd')
            .firstDestinationAddress,
        '350 Paisley Rd',
      );
    });

    test('meet at centre → the centre', () {
      expect(
        _ride(meetAtCenter: true).firstDestinationAddress,
        '255 Woodlawn Rd W, Guelph',
      );
    });
  });
}
