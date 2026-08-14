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
}

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required LocationStatus status,
    Position? location,
    int? rideId,
    @Default(false) bool shouldStart,
    String? errorMessage,
  }) = _LocationState;

  factory LocationState.initial() =>
      const LocationState(status: LocationStatus.initial);
}