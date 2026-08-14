import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_error_response.freezed.dart';
part 'refresh_error_response.g.dart';

@freezed
class RefreshErrorResponse with _$RefreshErrorResponse {
  const factory RefreshErrorResponse({
    @JsonKey(name: "status_code")
    int? statusCode,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(
        name: "errors",
        fromJson: Errors.fromJson,
        toJson: Errors.toJson
    )
    Errors? errors,
  }) = _RefreshErrorResponse;

  factory RefreshErrorResponse.fromJson(Map<String, dynamic> json) => _$RefreshErrorResponseFromJson(json);
}

@freezed
class Errors with _$Errors {
  const factory Errors({
    @JsonKey(name: "message") List<String>? message,
    @JsonKey(name: "statusCode") List<String>? statusCode,
  }) = _Errors;

  factory Errors._fromJson(Map<String, dynamic> json) {
    return Errors(
      message: _normalizeField(json['message']),
      statusCode: _normalizeField(json['statusCode']),
    );
  }

  static Errors? fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return Errors._fromJson(json);
    }
    return null;
  }

  static Map<String, dynamic>? toJson(Errors? instance) {
    if (instance == null) return null;
    return {
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
  }
}

List<String>? _normalizeField(dynamic field) {
  if (field == null) return null;
  if (field is String) return [field];
  if (field is List) return field.map((e) => e.toString()).toList();
  return [field.toString()];
}
