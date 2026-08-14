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
  }) = _Start;
  const factory InstructorRideEvent.stop({
    required int? rideId,
    required double? lat,
    required double? lot,
  }) = _Stop;
}
