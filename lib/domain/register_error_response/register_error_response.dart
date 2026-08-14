import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_error_response.freezed.dart';
part 'register_error_response.g.dart';

class StringListConverter implements JsonConverter<List<String>?, dynamic> {
  const StringListConverter();

  @override
  List<String>? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) return [json];
    if (json is List) return json.map((e) => e.toString()).toList();
    return [json.toString()];
  }

  @override
  dynamic toJson(List<String>? object) => object;
}

@freezed
class RegisterErrorResponse with _$RegisterErrorResponse {
  const factory RegisterErrorResponse({
    @JsonKey(name: "status_code")
    int? statusCode,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "errors")
    Errors? errors,
  }) = _RegisterErrorResponse;

  factory RegisterErrorResponse.fromJson(Map<String, dynamic> json) => _$RegisterErrorResponseFromJson(json);
}

@freezed
class Errors with _$Errors {
  const factory Errors({
    @JsonKey(name: "full_name")
    @StringListConverter()
    List<String>? fullName,
    @JsonKey(name: "email")
    @StringListConverter()
    List<String>? email,
    @JsonKey(name: "password")
    @StringListConverter()
    List<String>? password,
    @JsonKey(name: "phone_number")
    @StringListConverter()
    List<String>? phoneNumber,
    @JsonKey(name: "address")
    @StringListConverter()
    List<String>? address,
  }) = _Errors;

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
}
