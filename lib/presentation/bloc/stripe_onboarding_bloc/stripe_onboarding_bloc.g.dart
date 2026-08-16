// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_onboarding_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StripeOnboardingStateImpl _$$StripeOnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$StripeOnboardingStateImpl(
      status: $enumDecodeNullable(
              _$StripeOnboardingStatusEnumMap, json['status']) ??
          StripeOnboardingStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      onboardResponse: json['onboardResponse'] == null
          ? null
          : StripeOnboardResponse.fromJson(
              json['onboardResponse'] as Map<String, dynamic>),
      onboardUrlResponse: json['onboardUrlResponse'] == null
          ? null
          : StripeOnboardUrlResponse.fromJson(
              json['onboardUrlResponse'] as Map<String, dynamic>),
      payoutReadiness: $enumDecodeNullable(
              _$PayoutReadinessEnumMap, json['payoutReadiness']) ??
          PayoutReadiness.unknown,
    );

Map<String, dynamic> _$$StripeOnboardingStateImplToJson(
        _$StripeOnboardingStateImpl instance) =>
    <String, dynamic>{
      'status': _$StripeOnboardingStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'onboardResponse': instance.onboardResponse,
      'onboardUrlResponse': instance.onboardUrlResponse,
      'payoutReadiness': _$PayoutReadinessEnumMap[instance.payoutReadiness]!,
    };

const _$StripeOnboardingStatusEnumMap = {
  StripeOnboardingStatus.initial: 'initial',
  StripeOnboardingStatus.initialLoading: 'initialLoading',
  StripeOnboardingStatus.loading: 'loading',
  StripeOnboardingStatus.success: 'success',
  StripeOnboardingStatus.update: 'update',
  StripeOnboardingStatus.error: 'error',
  StripeOnboardingStatus.infoError: 'infoError',
};

const _$PayoutReadinessEnumMap = {
  PayoutReadiness.unknown: 'unknown',
  PayoutReadiness.ready: 'ready',
  PayoutReadiness.notConnected: 'notConnected',
  PayoutReadiness.pendingVerification: 'pendingVerification',
};
