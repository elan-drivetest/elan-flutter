part of 'file_upload_bloc.dart';

enum FileUploadStatus {
  initial,
  loading,
  success,
  error;
}

@freezed
class FileUploadState with _$FileUploadState {
  const factory FileUploadState({
    @Default(FileUploadStatus.initial) FileUploadStatus status,
    ErrorResponse? errorResponse,
    FileResponse? response,
  }) = _FileUploadState;

  factory FileUploadState.fromJson(Map<String, dynamic> json) =>
      _$FileUploadStateFromJson(json);
}