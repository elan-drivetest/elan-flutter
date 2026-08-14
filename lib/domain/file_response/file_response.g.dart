// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileResponseImpl _$$FileResponseImplFromJson(Map<String, dynamic> json) =>
    _$FileResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      filename: json['filename'] as String?,
      url: json['url'] as String?,
      originalName: json['original_name'] as String?,
    );

Map<String, dynamic> _$$FileResponseImplToJson(_$FileResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'url': instance.url,
      'original_name': instance.originalName,
    };
