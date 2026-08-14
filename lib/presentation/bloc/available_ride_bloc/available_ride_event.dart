part of 'available_ride_bloc.dart';

@freezed
class AvailableRideEvent with _$AvailableRideEvent {
  const factory AvailableRideEvent.requestData() = _RequestData;
  const factory AvailableRideEvent.refreshData() = _RefreshData;
  const factory AvailableRideEvent.searchData({required String query}) = _SearchData;
}