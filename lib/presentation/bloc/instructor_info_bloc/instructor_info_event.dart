part of 'instructor_info_bloc.dart';

@freezed
class InstructorInfoEvent with _$InstructorInfoEvent {
  const factory InstructorInfoEvent.getInfo() = _GetInfo;
  const factory InstructorInfoEvent.updateInfo({required Map<String, String> params}) = _UpdateInfo;
  const factory InstructorInfoEvent.updateVehicleInfo({required Map<String, String> params}) = _UpdateVehicleInfo;
}