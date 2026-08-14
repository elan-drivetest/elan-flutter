import 'package:elan/domain/common/meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_code_response.freezed.dart';
part 'referral_code_response.g.dart';

@freezed
class ReferralCodeResponse with _$ReferralCodeResponse {
  const factory ReferralCodeResponse({
    @JsonKey(name: "data")
    List<ReferralCode>? data,
    @JsonKey(name: "meta")
    Meta? meta,
  }) = _ReferralCodeResponse;

  factory ReferralCodeResponse.fromJson(Map<String, dynamic> json) => _$ReferralCodeResponseFromJson(json);
}

@freezed
class ReferralCode with _$ReferralCode {
  const factory ReferralCode({
    @JsonKey(name: "instructor_id")
    int? instructorId,
    @JsonKey(name: "code")
    String? code,
    @JsonKey(name: "amount")
    int? amount,
    @JsonKey(name: "min_rides_required")
    int? minRidesRequired,
    @JsonKey(name: "referral_type")
    String? referralType,
    @JsonKey(name: "status")
    String? status,
    @JsonKey(name: "used_at")
    String? usedAt,
    @JsonKey(name: "rides_completed_count")
    int? ridesCompletedCount,
    @JsonKey(name: "referrer_paid")
    int? referrerPaid,
    @JsonKey(name: "referee_paid")
    int? refereePaid,
    @JsonKey(name: "referrer_payment_date")
    String? referrerPaymentDate,
    @JsonKey(name: "referee_payment_date")
    String? refereePaymentDate,
  }) = _ReferralCode;

  factory ReferralCode.fromJson(Map<String, dynamic> json) => _$ReferralCodeFromJson(json);
}
