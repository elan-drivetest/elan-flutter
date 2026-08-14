// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      limit: (json['limit'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      nextCursor: json['nextCursor'] as String?,
      prevCursor: json['prevCursor'] as String?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'hasNextPage': instance.hasNextPage,
      'nextCursor': instance.nextCursor,
      'prevCursor': instance.prevCursor,
      'hasPreviousPage': instance.hasPreviousPage,
    };
