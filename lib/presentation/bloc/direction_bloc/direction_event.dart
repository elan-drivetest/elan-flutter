part of 'direction_bloc.dart';

@freezed
class DirectionEvent with _$DirectionEvent {
  const factory DirectionEvent.fetchDirections({
    required LatLng origin,
    required LatLng destination,
  }) = _FetchDirections;
}
