part of 'direction_bloc.dart';

enum DirectionStatus { initial, loading, success, error }

@freezed
class DirectionState with _$DirectionState {
  const factory DirectionState({
    @Default(DirectionStatus.initial) DirectionStatus status,
    @Default([]) List<LatLng> routePoints,
    @Default('') String distance,
    @Default('') String duration,
    ErrorResponse? error,
  }) = _DirectionState;
}
