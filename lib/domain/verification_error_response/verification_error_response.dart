import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_error_response.freezed.dart';
part 'verification_error_response.g.dart';

@freezed
class VerificationErrorResponse with _$VerificationErrorResponse {
  const factory VerificationErrorResponse({
    @JsonKey(name: "status_code") int? statusCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(
        name: "errors",
        fromJson: VerificationErrors.fromJson,
        toJson: VerificationErrors.toJson)
    VerificationErrors? errors,
  }) = _VerificationErrorResponse;

  factory VerificationErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationErrorResponseFromJson(json);
}

@freezed
class VerificationErrors with _$VerificationErrors {
  const factory VerificationErrors({
    @JsonKey(name: "otp") List<String>? otp,
    @JsonKey(name: "email") List<String>? email,
  }) = _VerificationErrors;

  factory VerificationErrors._fromJson(Map<String, dynamic> json) {
    return VerificationErrors(
      otp: _normalizeField(json['otp']),
      email: _normalizeField(json['email']),
    );
  }

  static VerificationErrors? fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return VerificationErrors._fromJson(json);
    }
    return null;
  }

  static Map<String, dynamic>? toJson(VerificationErrors? instance) {
    if (instance == null) return null;
    return {
      'otp': instance.otp,
      'email': instance.email,
    };
  }
}

List<String>? _normalizeField(dynamic field) {
  if (field == null) return null;
  if (field is String) return [field];
  if (field is List) return field.map((e) => e.toString()).toList();
  return null;
}
