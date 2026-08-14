// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginErrorResponseImpl _$$LoginErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginErrorResponseImpl(
      statusCode: (json['status_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: Errors.fromJson(json['errors']),
    );

Map<String, dynamic> _$$LoginErrorResponseImplToJson(
        _$LoginErrorResponseImpl instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'errors': Errors.toJson(instance.errors),
    };
