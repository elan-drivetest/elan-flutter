part of 'complete_ride_bloc.dart';

@freezed
class CompleteRideEvent with _$CompleteRideEvent {
  const factory CompleteRideEvent.requestData() = _RequestData;
  const factory CompleteRideEvent.refreshData() = _RefreshData;
}