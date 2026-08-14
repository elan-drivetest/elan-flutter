part of 'instructor_ride_bloc.dart';

enum InstructorRideStatus {
  initial,
  loading,
  success,
  empty,
  startSuccess,
  stopSuccess,
  error;
}

@freezed
class InstructorRideState with _$InstructorRideState {
  const factory InstructorRideState({
    @Default(InstructorRideStatus.initial) InstructorRideStatus status,
    ErrorResponse? errorResponse,
    RideSession? currentRide,
  }) = _InstructorRideState;

  factory InstructorRideState.fromJson(Map<String, dynamic> json) =>
      _$InstructorRideStateFromJson(json);
}