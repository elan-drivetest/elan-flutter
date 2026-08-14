part of 'file_upload_bloc.dart';

@freezed
class FileUploadEvent with _$FileUploadEvent {
  const factory FileUploadEvent.send({required PlatformFile file}) = _Send;
}
