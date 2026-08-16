part of 'ride_route_bloc.dart';

enum RideRouteStatus { initial, loading, success, error }

@freezed
class RideRouteState with _$RideRouteState {
  const factory RideRouteState({
    @Default(RideRouteStatus.initial) RideRouteStatus status,
    @Default(<RideLeg>[]) List<RideLeg> legs,
    ErrorResponse? error,
  }) = _RideRouteState;

  const RideRouteState._();

  RideLeg? legOf(RideLegKind kind) {
    for (final leg in legs) {
      if (leg.kind == kind) return leg;
    }
    return null;
  }

  RideLeg? get deadhead => legOf(RideLegKind.deadhead);
  RideLeg? get pickupRun => legOf(RideLegKind.pickupRun);
  RideLeg? get returnRun => legOf(RideLegKind.returnRun);

  /// Every point across every leg — for fitting the camera to the whole job.
  List<LatLng> get allPoints => [for (final l in legs) ...l.points];

  /// Just the paid legs. The camera should prefer these: on a 200 km deadhead
  /// the 5 km billable leg becomes invisible if you fit everything (§11).
  List<LatLng> get paidPoints =>
      [for (final l in legs.where((l) => l.kind.isPaid)) ...l.points];
}
