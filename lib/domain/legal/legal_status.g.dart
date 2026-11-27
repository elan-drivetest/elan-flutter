// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LegalStatusImpl _$$LegalStatusImplFromJson(Map<String, dynamic> json) =>
    _$LegalStatusImpl(
      allAccepted: json['all_accepted'] as bool? ?? false,
      documents: (json['required'] as List<dynamic>?)
              ?.map((e) => LegalDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LegalDocument>[],
    );

Map<String, dynamic> _$$LegalStatusImplToJson(_$LegalStatusImpl instance) =>
    <String, dynamic>{
      'all_accepted': instance.allAccepted,
      'required': instance.documents,
    };

_$LegalDocumentImpl _$$LegalDocumentImplFromJson(Map<String, dynamic> json) =>
    _$LegalDocumentImpl(
      document: json['document'] as String,
      version: json['version'] as String,
      url: json['url'] as String?,
      accepted: json['accepted'] as bool? ?? false,
    );

Map<String, dynamic> _$$LegalDocumentImplToJson(_$LegalDocumentImpl instance) =>
    <String, dynamic>{
      'document': instance.document,
      'version': instance.version,
      'url': instance.url,
      'accepted': instance.accepted,
    };
