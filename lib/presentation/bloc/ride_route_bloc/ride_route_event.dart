part of 'ride_route_bloc.dart';

@freezed
class RideRouteEvent with _$RideRouteEvent {
  /// Assemble every leg for [ride].
  ///
  /// [currentPosition] may be null when location is unavailable — the billable
  /// legs are still drawn, only the deadhead is skipped.
  ///
  /// [testCentre] overrides the coordinates on [ride]. Both ride lists supply
  /// them now (§14.2), so this is rarely needed.
  const factory RideRouteEvent.build({
    required Ride ride,
    LatLng? currentPosition,
    LatLng? testCentre,
  }) = _Build;
}
