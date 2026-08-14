import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_refer_code_response.freezed.dart';
part 'generate_refer_code_response.g.dart';

@freezed
class GenerateReferCodeResponse with _$GenerateReferCodeResponse {
  const factory GenerateReferCodeResponse({
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
  }) = _GenerateReferCodeResponse;

  factory GenerateReferCodeResponse.fromJson(Map<String, dynamic> json) => _$GenerateReferCodeResponseFromJson(json);
}
