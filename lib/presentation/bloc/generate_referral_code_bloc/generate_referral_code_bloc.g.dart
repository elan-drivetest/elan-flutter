// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_referral_code_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateReferralCodeStateImpl _$$GenerateReferralCodeStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateReferralCodeStateImpl(
      status: $enumDecodeNullable(
              _$GenerateReferralCodeStatusEnumMap, json['status']) ??
          GenerateReferralCodeStatus.initial,
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReferralCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenerateReferralCodeStateImplToJson(
        _$GenerateReferralCodeStateImpl instance) =>
    <String, dynamic>{
      'status': _$GenerateReferralCodeStatusEnumMap[instance.status]!,
      'hasReachedMax': instance.hasReachedMax,
      'errorResponse': instance.errorResponse,
      'data': instance.data,
    };

const _$GenerateReferralCodeStatusEnumMap = {
  GenerateReferralCodeStatus.initial: 'initial',
  GenerateReferralCodeStatus.loading: 'loading',
  GenerateReferralCodeStatus.actionLoading: 'actionLoading',
  GenerateReferralCodeStatus.paginating: 'paginating',
  GenerateReferralCodeStatus.success: 'success',
  GenerateReferralCodeStatus.generateSuccess: 'generateSuccess',
  GenerateReferralCodeStatus.error: 'error',
  GenerateReferralCodeStatus.generateError: 'generateError',
};
