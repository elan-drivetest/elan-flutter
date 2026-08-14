// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationErrorResponseImpl _$$VerificationErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationErrorResponseImpl(
      statusCode: (json['status_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: VerificationErrors.fromJson(json['errors']),
    );

Map<String, dynamic> _$$VerificationErrorResponseImplToJson(
        _$VerificationErrorResponseImpl instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'errors': VerificationErrors.toJson(instance.errors),
    };
