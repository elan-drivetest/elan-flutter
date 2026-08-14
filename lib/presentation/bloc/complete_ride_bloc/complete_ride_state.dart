part of 'complete_ride_bloc.dart';

enum CompleteRideStatus {
  initial,
  loading,
  /// Loading more pages while existing items are already displayed.
  paginating,
  success,
  error;
}

@freezed
class CompleteRideState with _$CompleteRideState {
  const factory CompleteRideState({
    @Default(CompleteRideStatus.initial) CompleteRideStatus status,
    @Default(false) bool hasReachedMax,
    ErrorResponse? errorResponse,
    List<CompleteRide>? rides,
  }) = _CompleteRideState;

  factory CompleteRideState.fromJson(Map<String, dynamic> json) =>
      _$CompleteRideStateFromJson(json);
}