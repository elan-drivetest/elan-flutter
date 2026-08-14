part of 'upcoming_ride_bloc.dart';

enum UpcomingRideStatus {
  initial,
  loading,
  actionLoading,
  success,
  update,
  empty,
  error;
}

@freezed
class UpcomingRideState with _$UpcomingRideState {
  const factory UpcomingRideState({
    @Default(UpcomingRideStatus.initial) UpcomingRideStatus status,
    @Default(false) bool hasReachedMax,
    ErrorResponse? errorResponse,
    List<Ride>? rides,
  }) = _UpcomingRideState;

  factory UpcomingRideState.fromJson(Map<String, dynamic> json) =>
      _$UpcomingRideStateFromJson(json);
}