import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_response.freezed.dart';
part 'file_response.g.dart';

@freezed
class FileResponse with _$FileResponse {
  const factory FileResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "filename") String? filename,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "original_name") String? originalName,
  }) = _FileResponse;

  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);
}
