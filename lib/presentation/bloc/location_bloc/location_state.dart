// lib/features/location/application/location_state.dart
part of 'location_bloc.dart';

enum LocationStatus {
  initial,
  loading,
  success,
  permissionDenied,
  permissionPermanentlyDenied,
  gpsDisabled,
  backgroundPermissionNotGranted,
  failure,

  /// The background-location disclosure has not been accepted yet. No OS
  /// permission prompt was shown; the UI must show the disclosure first.
  disclosureRequired,
}

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required LocationStatus status,
    Position? location,
    int? rideId,
    Ride? booking,
    @Default(false) bool shouldStart,
    String? errorMessage,

    /// Android battery optimisation may throttle background tracking. Advisory
    /// only; it never blocks a ride.
    @Default(false) bool batteryRestricted,
  }) = _LocationState;

  factory LocationState.initial() =>
      const LocationState(status: LocationStatus.initial);
}