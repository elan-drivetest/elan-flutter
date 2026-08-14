// location_event.dart
part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.checkLocationAccess(
      {@Default(false) bool isRideRequest,
      int? rideId,
      @Default(false) bool fromBackground}) = CheckLocationAccess;
  const factory LocationEvent.checkBackgroundPermissions() =
      CheckBackgroundPermissions;
  const factory LocationEvent.checkAllPermissions() = CheckAllPermissions;
}
