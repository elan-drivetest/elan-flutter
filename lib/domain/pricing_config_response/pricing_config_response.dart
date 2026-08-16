import 'package:freezed_annotation/freezed_annotation.dart';

part 'pricing_config_response.freezed.dart';
part 'pricing_config_response.g.dart';

@freezed
class PricingConfigResponse with _$PricingConfigResponse {
  const factory PricingConfigResponse({
    @JsonKey(name: "base_distance") num? baseDistance,
    @JsonKey(name: "base_rate") num? baseRate,
    @JsonKey(name: "normal_rate") num? normalRate,
    @JsonKey(name: "instructor_rate") num? instructorRate,
    @JsonKey(name: "average_distance_per_hour") num? averageDistancePerHour,
    @JsonKey(name: "instructor_referral_price") num? instructorReferralPrice,
    @JsonKey(name: "admin_referral_price") num? adminReferralPrice,
    @JsonKey(name: "referral_min_rides") int? referralMinRides,
    @JsonKey(name: "booking_min_lead_days") int? bookingMinLeadDays,
    @JsonKey(name: "refund_full_hours") int? refundFullHours,
    @JsonKey(name: "refund_partial_hours") int? refundPartialHours,
    @JsonKey(name: "refund_partial_percentage") num? refundPartialPercentage,
    @JsonKey(name: "failure_coupon_percentage") num? failureCouponPercentage,
    @JsonKey(name: "failure_coupon_validity_months") int? failureCouponValidityMonths,
    @JsonKey(name: "instructor_payout_delay_days") int? instructorPayoutDelayDays,
    @JsonKey(name: "ride_start_window_hours") int? rideStartWindowHours,
    @JsonKey(name: "ride_transfer_cutoff_hours") int? rideTransferCutoffHours,
  }) = _PricingConfigResponse;

  factory PricingConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$PricingConfigResponseFromJson(json);
}
