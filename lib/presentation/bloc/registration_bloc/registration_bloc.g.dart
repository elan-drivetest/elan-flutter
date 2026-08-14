// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationStateImpl _$$RegistrationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationStateImpl(
      status:
          $enumDecodeNullable(_$RegistrationStatusEnumMap, json['status']) ??
              RegistrationStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : RegisterErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      phoneHint: json['phone_hint'] as String?,
    );

Map<String, dynamic> _$$RegistrationStateImplToJson(
        _$RegistrationStateImpl instance) =>
    <String, dynamic>{
      'status': _$RegistrationStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'phone_hint': instance.phoneHint,
    };

const _$RegistrationStatusEnumMap = {
  RegistrationStatus.initial: 'initial',
  RegistrationStatus.loading: 'loading',
  RegistrationStatus.success: 'success',
  RegistrationStatus.error: 'error',
};
