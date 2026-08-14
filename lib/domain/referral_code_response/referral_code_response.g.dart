// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralCodeResponseImpl _$$ReferralCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralCodeResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReferralCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferralCodeResponseImplToJson(
        _$ReferralCodeResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$ReferralCodeImpl _$$ReferralCodeImplFromJson(Map<String, dynamic> json) =>
    _$ReferralCodeImpl(
      instructorId: (json['instructor_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      minRidesRequired: (json['min_rides_required'] as num?)?.toInt(),
      referralType: json['referral_type'] as String?,
      status: json['status'] as String?,
      usedAt: json['used_at'] as String?,
      ridesCompletedCount: (json['rides_completed_count'] as num?)?.toInt(),
      referrerPaid: (json['referrer_paid'] as num?)?.toInt(),
      refereePaid: (json['referee_paid'] as num?)?.toInt(),
      referrerPaymentDate: json['referrer_payment_date'] as String?,
      refereePaymentDate: json['referee_payment_date'] as String?,
    );

Map<String, dynamic> _$$ReferralCodeImplToJson(_$ReferralCodeImpl instance) =>
    <String, dynamic>{
      'instructor_id': instance.instructorId,
      'code': instance.code,
      'amount': instance.amount,
      'min_rides_required': instance.minRidesRequired,
      'referral_type': instance.referralType,
      'status': instance.status,
      'used_at': instance.usedAt,
      'rides_completed_count': instance.ridesCompletedCount,
      'referrer_paid': instance.referrerPaid,
      'referee_paid': instance.refereePaid,
      'referrer_payment_date': instance.referrerPaymentDate,
      'referee_payment_date': instance.refereePaymentDate,
    };
