// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_onboard_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StripeOnboardUrlResponseImpl _$$StripeOnboardUrlResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StripeOnboardUrlResponseImpl(
      onboardingUrl: json['onboarding_url'] as String?,
      stripeAccountId: json['stripe_account_id'] as String?,
    );

Map<String, dynamic> _$$StripeOnboardUrlResponseImplToJson(
        _$StripeOnboardUrlResponseImpl instance) =>
    <String, dynamic>{
      'onboarding_url': instance.onboardingUrl,
      'stripe_account_id': instance.stripeAccountId,
    };
