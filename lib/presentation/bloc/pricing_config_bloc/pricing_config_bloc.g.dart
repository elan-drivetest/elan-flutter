// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_config_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingConfigStateImpl _$$PricingConfigStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PricingConfigStateImpl(
      status:
          $enumDecodeNullable(_$PricingConfigStatusEnumMap, json['status']) ??
              PricingConfigStatus.initial,
      config: json['config'] == null
          ? null
          : PricingConfigResponse.fromJson(
              json['config'] as Map<String, dynamic>),
      errorResponse: json['errorResponse'] == null
          ? null
          : LoginErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PricingConfigStateImplToJson(
        _$PricingConfigStateImpl instance) =>
    <String, dynamic>{
      'status': _$PricingConfigStatusEnumMap[instance.status]!,
      'config': instance.config,
      'errorResponse': instance.errorResponse,
    };

const _$PricingConfigStatusEnumMap = {
  PricingConfigStatus.initial: 'initial',
  PricingConfigStatus.loading: 'loading',
  PricingConfigStatus.success: 'success',
  PricingConfigStatus.error: 'error',
};
