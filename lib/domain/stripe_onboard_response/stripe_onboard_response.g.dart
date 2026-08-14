// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_onboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StripeOnboardResponseImpl _$$StripeOnboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StripeOnboardResponseImpl(
      status: json['status'] as String?,
      chargesEnabled: json['charges_enabled'] as bool?,
      payoutsEnabled: json['payouts_enabled'] as bool?,
    );

Map<String, dynamic> _$$StripeOnboardResponseImplToJson(
        _$StripeOnboardResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'charges_enabled': instance.chargesEnabled,
      'payouts_enabled': instance.payoutsEnabled,
    };
