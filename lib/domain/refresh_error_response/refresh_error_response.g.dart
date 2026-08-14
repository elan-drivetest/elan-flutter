// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshErrorResponseImpl _$$RefreshErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshErrorResponseImpl(
      statusCode: (json['status_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: Errors.fromJson(json['errors']),
    );

Map<String, dynamic> _$$RefreshErrorResponseImplToJson(
        _$RefreshErrorResponseImpl instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'errors': Errors.toJson(instance.errors),
    };
