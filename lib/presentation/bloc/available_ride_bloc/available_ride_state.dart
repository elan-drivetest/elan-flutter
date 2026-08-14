part of 'available_ride_bloc.dart';

enum AvailableRideStatus {
  initial,
  loading,
  /// Loading more pages while existing items are already displayed.
  paginating,
  success,
  error;
}

@freezed
class AvailableRideState with _$AvailableRideState {
  const factory AvailableRideState({
    @Default(AvailableRideStatus.initial) AvailableRideStatus status,
    @Default(false) bool hasReachedMax,
    ErrorResponse? errorResponse,
    List<Ride>? rides,
  }) = _AvailableRideState;

  factory AvailableRideState.fromJson(Map<String, dynamic> json) =>
      _$AvailableRideStateFromJson(json);
}