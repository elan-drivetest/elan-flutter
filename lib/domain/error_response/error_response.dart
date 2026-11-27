import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @JsonKey(name: "status_code") int? statusCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "errors") Errors? errors,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@freezed
class Errors with _$Errors {
  const factory Errors({
    @JsonKey(name: "no_auth token") List<String>? noAuthToken,
    @JsonKey(name: "otp") List<String>? otp,

    // `DELETE /v1/auth/instructor/me` → 422 "hasActiveRides" while any ride is
    // scheduled or in progress. Object? because humanizeBody normalises field
    // codes to lists.
    // ignore: invalid_annotation_target
    @JsonKey(name: "account") Object? account,

    // Legal codes: legalAcceptanceRequired (403), legalVersionOutdated (409),
    // documentNotApplicable (422).
    // ignore: invalid_annotation_target
    @JsonKey(name: "legal") Object? legal,
  }) = _Errors;

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
}
