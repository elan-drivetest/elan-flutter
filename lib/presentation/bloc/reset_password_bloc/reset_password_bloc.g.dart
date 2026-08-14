// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordStateImpl _$$ResetPasswordStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordStateImpl(
      status:
          $enumDecodeNullable(_$ResetPasswordStatusEnumMap, json['status']) ??
              ResetPasswordStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : LoginErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      phoneHint: json['phone_hint'] as String?,
    );

Map<String, dynamic> _$$ResetPasswordStateImplToJson(
        _$ResetPasswordStateImpl instance) =>
    <String, dynamic>{
      'status': _$ResetPasswordStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'phone_hint': instance.phoneHint,
    };

const _$ResetPasswordStatusEnumMap = {
  ResetPasswordStatus.initial: 'initial',
  ResetPasswordStatus.loading: 'loading',
  ResetPasswordStatus.success: 'success',
  ResetPasswordStatus.error: 'error',
};
