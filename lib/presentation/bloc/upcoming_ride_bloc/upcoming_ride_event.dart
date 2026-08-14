part of 'upcoming_ride_bloc.dart';

@freezed
class UpcomingRideEvent with _$UpcomingRideEvent {
  const factory UpcomingRideEvent.requestData() = _RequestData;
  const factory UpcomingRideEvent.refreshData() = _RefreshData;
  const factory UpcomingRideEvent.accept({required int? id}) = _Accept;
  const factory UpcomingRideEvent.transfer(
      {required int? id, required String? reason}) = _Transfer;
}
