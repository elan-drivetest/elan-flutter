import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_code_summary_response.freezed.dart';
part 'referral_code_summary_response.g.dart';

@freezed
class ReferralCodeSummaryResponse with _$ReferralCodeSummaryResponse {
  const factory ReferralCodeSummaryResponse({
    @JsonKey(name: "my_code") MyCode? myCode,
    @JsonKey(name: "referrer") Referrer? referrer,
    @JsonKey(name: "peer_claim") PeerClaim? peerClaim,
    @JsonKey(name: "admin_promos") AdminPromos? adminPromos,
    @JsonKey(name: "totals") Totals? totals,
  }) = _ReferralCodeSummaryResponse;

  factory ReferralCodeSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeSummaryResponseFromJson(json);
}

@freezed
class MyCode with _$MyCode {
  const factory MyCode({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "total_claims") int? totalClaims,
  }) = _MyCode;

  factory MyCode.fromJson(Map<String, dynamic> json) => _$MyCodeFromJson(json);
}

@freezed
class Referrer with _$Referrer {
  const factory Referrer({
    @JsonKey(name: "total_referees") int? totalReferees,
    @JsonKey(name: "bonuses_disbursed") num? bonusesDisbursed,
    @JsonKey(name: "total_earned") num? totalEarned,
    @JsonKey(name: "payouts") List<dynamic>? payouts,
  }) = _Referrer;

  factory Referrer.fromJson(Map<String, dynamic> json) =>
      _$ReferrerFromJson(json);
}

@freezed
class PeerClaim with _$PeerClaim {
  const factory PeerClaim({
    @JsonKey(name: "referral_code_id") int? referralCodeId,
    @JsonKey(name: "claimed_at") String? claimedAt,
    @JsonKey(name: "rides_after_claim") int? ridesAfterClaim,
    @JsonKey(name: "min_rides_required") int? minRidesRequired,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "bonus_amount") num? bonusAmount,
    @JsonKey(name: "bonus_paid_at") String? bonusPaidAt,
  }) = _PeerClaim;

  factory PeerClaim.fromJson(Map<String, dynamic> json) =>
      _$PeerClaimFromJson(json);
}

@freezed
class AdminPromos with _$AdminPromos {
  const factory AdminPromos({
    @JsonKey(name: "total_claimed") int? totalClaimed,
    @JsonKey(name: "total_earned") num? totalEarned,
    @JsonKey(name: "claims") List<dynamic>? claims,
  }) = _AdminPromos;

  factory AdminPromos.fromJson(Map<String, dynamic> json) =>
      _$AdminPromosFromJson(json);
}

@freezed
class Totals with _$Totals {
  const factory Totals({
    @JsonKey(name: "total_bonus_received") num? totalBonusReceived,
    @JsonKey(name: "total_earned") num? totalEarned,
  }) = _Totals;

  factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);
}
