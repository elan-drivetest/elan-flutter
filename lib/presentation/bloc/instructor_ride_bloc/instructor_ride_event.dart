part of 'instructor_ride_bloc.dart';

@freezed
class InstructorRideEvent with _$InstructorRideEvent {
  const factory InstructorRideEvent.requestData() = _RequestData;
  const factory InstructorRideEvent.start({
    required int? id,
    required double? lat,
    required double? lot,
    required double? accuracy,
    required double? speed,
    required double? bearing,
    required double? altitude,
    required int? batteryLevel,
    required String? timezone,

    /// The booking being started.
    ///
    /// Cached so the active-ride screen has a destination: `/rides/current`
    /// returns a RideSession with no addresses and no booking id at all
    /// (§8.8), so without this the app cannot say where the instructor is
    /// going once the ride is under way.
    Ride? booking,
  }) = _Start;
  const factory InstructorRideEvent.stop({
    required int? rideId,
    required double? lat,
    required double? lot,
  }) = _Stop;
}
