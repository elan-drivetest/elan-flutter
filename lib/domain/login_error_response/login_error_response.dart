import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_error_response.freezed.dart';
part 'login_error_response.g.dart';

@freezed
class LoginErrorResponse with _$LoginErrorResponse {
  const factory LoginErrorResponse({
    @JsonKey(name: "status_code") int? statusCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
    Errors? errors,
  }) = _LoginErrorResponse;

  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginErrorResponseFromJson(json);
}

@freezed
class Errors with _$Errors {
  const factory Errors({
    @JsonKey(name: "email") List<String>? email,
    @JsonKey(name: "password") List<String>? password,
    @JsonKey(name: "active") List<String>? active,
  }) = _Errors;

  factory Errors._fromJson(Map<String, dynamic> json) {
    return Errors(
      email: _normalizeField(json['email']),
      password: _normalizeField(json['password']),
      active: _normalizeField(json['active']),
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
      'email': instance.email,
      'password': instance.password,
      'active': instance.active,
    };
  }
}

List<String>? _normalizeField(dynamic field) {
  if (field == null) return null;
  if (field is String) return [field];
  if (field is List) return field.map((e) => e.toString()).toList();
  return null;
}
