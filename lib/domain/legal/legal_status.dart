// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'legal_status.freezed.dart';
part 'legal_status.g.dart';

/// `GET /v1/legal/status` and the `POST /v1/legal/accept` response.
///
/// Required set for an instructor: privacy_policy, terms_of_service and
/// provider_agreement. Versions come from the server; the app never hardcodes
/// them, so a new document version re-prompts without an app release.
@freezed
class LegalStatus with _$LegalStatus {
  const LegalStatus._();

  const factory LegalStatus({
    @JsonKey(name: "all_accepted") @Default(false) bool allAccepted,

    /// Wire name `required`, which collides with Dart's `@required`.
    @JsonKey(name: "required")
    @Default(<LegalDocument>[])
    List<LegalDocument> documents,
  }) = _LegalStatus;

  List<LegalDocument> get pending =>
      documents.where((d) => !d.accepted).toList();

  factory LegalStatus.fromJson(Map<String, dynamic> json) =>
      _$LegalStatusFromJson(json);
}

@freezed
class LegalDocument with _$LegalDocument {
  const LegalDocument._();

  const factory LegalDocument({
    /// `privacy_policy` | `terms_of_service` | `provider_agreement`
    required String document,
    required String version,
    String? url,
    @Default(false) bool accepted,
  }) = _LegalDocument;

  String get title => switch (document) {
        'privacy_policy' => 'Privacy Policy',
        'terms_of_service' => 'Terms of Service',
        'provider_agreement' => 'Independent Vehicle Provider Agreement',
        _ => document,
      };

  factory LegalDocument.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentFromJson(json);
}
