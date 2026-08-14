// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_email_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfirmEmailStateImpl _$$ConfirmEmailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmEmailStateImpl(
      status:
          $enumDecodeNullable(_$ConfirmEmailStatusEnumMap, json['status']) ??
              ConfirmEmailStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConfirmEmailStateImplToJson(
        _$ConfirmEmailStateImpl instance) =>
    <String, dynamic>{
      'status': _$ConfirmEmailStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'statusCode': instance.statusCode,
    };

const _$ConfirmEmailStatusEnumMap = {
  ConfirmEmailStatus.initial: 'initial',
  ConfirmEmailStatus.loading: 'loading',
  ConfirmEmailStatus.success: 'success',
  ConfirmEmailStatus.error: 'error',
};
