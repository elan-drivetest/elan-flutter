import 'package:elan/domain/common/ride/ride_leg.dart';
import 'package:elan/presentation/ui/widgets/common/ride_route_style.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

RideLeg _leg(RideLegKind kind, List<LatLng> points) => RideLeg(
      kind: kind,
      points: points,
      distanceText: '5 km',
      durationText: '9 mins',
    );

void main() {
  group('polylines distinguish paid work from deadhead', () {
    final legs = [
      _leg(RideLegKind.deadhead, const [LatLng(43.5, -80.2), LatLng(43.6, -80.3)]),
      _leg(RideLegKind.pickupRun, const [LatLng(43.6, -80.3), LatLng(43.7, -80.4)]),
      _leg(RideLegKind.returnRun, const [LatLng(43.7, -80.4), LatLng(43.6, -80.3)]),
    ];

    test('one polyline per routable leg', () {
      expect(RideRouteStyle.polylines(legs).length, 3);
    });

    test('only the deadhead is dashed', () {
      final byId = {
        for (final p in RideRouteStyle.polylines(legs)) p.polylineId.value: p
      };
      expect(byId['deadhead']!.patterns, isNotEmpty);
      expect(byId['pickupRun']!.patterns, isEmpty);
      expect(byId['returnRun']!.patterns, isEmpty);
    });

    test('paid legs draw above the deadhead where they overlap', () {
      final byId = {
        for (final p in RideRouteStyle.polylines(legs)) p.polylineId.value: p
      };
      expect(byId['pickupRun']!.zIndex, greaterThan(byId['deadhead']!.zIndex));
      expect(byId['returnRun']!.zIndex, greaterThan(byId['deadhead']!.zIndex));
    });

    test('the billable leg is the thickest', () {
      final byId = {
        for (final p in RideRouteStyle.polylines(legs)) p.polylineId.value: p
      };
      expect(byId['pickupRun']!.width, greaterThan(byId['deadhead']!.width));
    });

    test('legs with no route are skipped, not drawn empty', () {
      final withEmpty = [
        _leg(RideLegKind.deadhead, const []),
        _leg(RideLegKind.pickupRun, const [LatLng(1, 1), LatLng(2, 2)]),
      ];
      final ids =
          RideRouteStyle.polylines(withEmpty).map((p) => p.polylineId.value);
      expect(ids, ['pickupRun']);
    });
  });

  group('boundsOf', () {
    test('spans every point', () {
      final b = RideRouteStyle.boundsOf(const [
        LatLng(43.5, -80.4),
        LatLng(43.7, -80.2),
      ])!;
      expect(b.southwest.latitude, closeTo(43.5, 1e-9));
      expect(b.northeast.latitude, closeTo(43.7, 1e-9));
      expect(b.southwest.longitude, closeTo(-80.4, 1e-9));
      expect(b.northeast.longitude, closeTo(-80.2, 1e-9));
    });

    test('null for an empty list rather than a degenerate box', () {
      expect(RideRouteStyle.boundsOf(const []), isNull);
    });

    test('a single point is widened — newLatLngBounds rejects zero area', () {
      final b = RideRouteStyle.boundsOf(const [LatLng(43.5, -80.4)])!;
      expect(b.northeast.latitude, greaterThan(b.southwest.latitude));
      expect(b.northeast.longitude, greaterThan(b.southwest.longitude));
    });

    test('a due-north route is widened in longitude', () {
      final b = RideRouteStyle.boundsOf(const [
        LatLng(43.5, -80.4),
        LatLng(43.9, -80.4),
      ])!;
      expect(b.northeast.longitude, greaterThan(b.southwest.longitude));
      // Latitude was already a real span; leave it alone.
      expect(b.southwest.latitude, closeTo(43.5, 1e-9));
    });
  });

  group('leg semantics', () {
    test('only the deadhead is unpaid', () {
      expect(RideLegKind.deadhead.isPaid, isFalse);
      expect(RideLegKind.pickupRun.isPaid, isTrue);
      expect(RideLegKind.returnRun.isPaid, isTrue);
    });
  });
}
