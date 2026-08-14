// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_code_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralCodeSummaryResponseImpl _$$ReferralCodeSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralCodeSummaryResponseImpl(
      myCode: json['my_code'] == null
          ? null
          : MyCode.fromJson(json['my_code'] as Map<String, dynamic>),
      referrer: json['referrer'] == null
          ? null
          : Referrer.fromJson(json['referrer'] as Map<String, dynamic>),
      peerClaim: json['peer_claim'] == null
          ? null
          : PeerClaim.fromJson(json['peer_claim'] as Map<String, dynamic>),
      adminPromos: json['admin_promos'] == null
          ? null
          : AdminPromos.fromJson(json['admin_promos'] as Map<String, dynamic>),
      totals: json['totals'] == null
          ? null
          : Totals.fromJson(json['totals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferralCodeSummaryResponseImplToJson(
        _$ReferralCodeSummaryResponseImpl instance) =>
    <String, dynamic>{
      'my_code': instance.myCode,
      'referrer': instance.referrer,
      'peer_claim': instance.peerClaim,
      'admin_promos': instance.adminPromos,
      'totals': instance.totals,
    };

_$MyCodeImpl _$$MyCodeImplFromJson(Map<String, dynamic> json) => _$MyCodeImpl(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      status: json['status'] as String?,
      totalClaims: (json['total_claims'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MyCodeImplToJson(_$MyCodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'status': instance.status,
      'total_claims': instance.totalClaims,
    };

_$ReferrerImpl _$$ReferrerImplFromJson(Map<String, dynamic> json) =>
    _$ReferrerImpl(
      totalReferees: (json['total_referees'] as num?)?.toInt(),
      bonusesDisbursed: json['bonuses_disbursed'] as num?,
      totalEarned: json['total_earned'] as num?,
      payouts: json['payouts'] as List<dynamic>?,
    );

Map<String, dynamic> _$$ReferrerImplToJson(_$ReferrerImpl instance) =>
    <String, dynamic>{
      'total_referees': instance.totalReferees,
      'bonuses_disbursed': instance.bonusesDisbursed,
      'total_earned': instance.totalEarned,
      'payouts': instance.payouts,
    };

_$PeerClaimImpl _$$PeerClaimImplFromJson(Map<String, dynamic> json) =>
    _$PeerClaimImpl(
      referralCodeId: (json['referral_code_id'] as num?)?.toInt(),
      claimedAt: json['claimed_at'] as String?,
      ridesAfterClaim: (json['rides_after_claim'] as num?)?.toInt(),
      minRidesRequired: (json['min_rides_required'] as num?)?.toInt(),
      status: json['status'] as String?,
      bonusAmount: json['bonus_amount'] as num?,
      bonusPaidAt: json['bonus_paid_at'] as String?,
    );

Map<String, dynamic> _$$PeerClaimImplToJson(_$PeerClaimImpl instance) =>
    <String, dynamic>{
      'referral_code_id': instance.referralCodeId,
      'claimed_at': instance.claimedAt,
      'rides_after_claim': instance.ridesAfterClaim,
      'min_rides_required': instance.minRidesRequired,
      'status': instance.status,
      'bonus_amount': instance.bonusAmount,
      'bonus_paid_at': instance.bonusPaidAt,
    };

_$AdminPromosImpl _$$AdminPromosImplFromJson(Map<String, dynamic> json) =>
    _$AdminPromosImpl(
      totalClaimed: (json['total_claimed'] as num?)?.toInt(),
      totalEarned: json['total_earned'] as num?,
      claims: json['claims'] as List<dynamic>?,
    );

Map<String, dynamic> _$$AdminPromosImplToJson(_$AdminPromosImpl instance) =>
    <String, dynamic>{
      'total_claimed': instance.totalClaimed,
      'total_earned': instance.totalEarned,
      'claims': instance.claims,
    };

_$TotalsImpl _$$TotalsImplFromJson(Map<String, dynamic> json) => _$TotalsImpl(
      totalBonusReceived: json['total_bonus_received'] as num?,
      totalEarned: json['total_earned'] as num?,
    );

Map<String, dynamic> _$$TotalsImplToJson(_$TotalsImpl instance) =>
    <String, dynamic>{
      'total_bonus_received': instance.totalBonusReceived,
      'total_earned': instance.totalEarned,
    };
