// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingConfigImpl _$$PricingConfigImplFromJson(Map<String, dynamic> json) =>
    _$PricingConfigImpl(
      baseDistance: json['base_distance'] as num? ?? 50,
      baseRate: json['base_rate'] as num? ?? 100,
      normalRate: json['normal_rate'] as num? ?? 50,
      instructorRate: json['instructor_rate'] as num? ?? 8000,
      averageDistancePerHour: json['average_distance_per_hour'] as num? ?? 50,
      testDurationHours: json['test_duration_hours'] as num? ?? 1,
      instructorReferralPrice:
          json['instructor_referral_price'] as num? ?? 10000,
      adminReferralPrice: json['admin_referral_price'] as num? ?? 10000,
      referralMinRides: json['referral_min_rides'] as num? ?? 5,
      bookingMinLeadDays: json['booking_min_lead_days'] as num? ?? 2,
      refundFullHours: json['refund_full_hours'] as num? ?? 48,
      refundPartialHours: json['refund_partial_hours'] as num? ?? 24,
      refundPartialPercentage: json['refund_partial_percentage'] as num? ?? 50,
      failureCouponPercentage: json['failure_coupon_percentage'] as num? ?? 10,
      failureCouponValidityMonths:
          json['failure_coupon_validity_months'] as num? ?? 6,
      instructorPayoutDelayDays:
          json['instructor_payout_delay_days'] as num? ?? 7,
      rideStartWindowHours: json['ride_start_window_hours'] as num? ?? 6,
      rideTransferCutoffHours: json['ride_transfer_cutoff_hours'] as num? ?? 6,
    );

Map<String, dynamic> _$$PricingConfigImplToJson(_$PricingConfigImpl instance) =>
    <String, dynamic>{
      'base_distance': instance.baseDistance,
      'base_rate': instance.baseRate,
      'normal_rate': instance.normalRate,
      'instructor_rate': instance.instructorRate,
      'average_distance_per_hour': instance.averageDistancePerHour,
      'test_duration_hours': instance.testDurationHours,
      'instructor_referral_price': instance.instructorReferralPrice,
      'admin_referral_price': instance.adminReferralPrice,
      'referral_min_rides': instance.referralMinRides,
      'booking_min_lead_days': instance.bookingMinLeadDays,
      'refund_full_hours': instance.refundFullHours,
      'refund_partial_hours': instance.refundPartialHours,
      'refund_partial_percentage': instance.refundPartialPercentage,
      'failure_coupon_percentage': instance.failureCouponPercentage,
      'failure_coupon_validity_months': instance.failureCouponValidityMonths,
      'instructor_payout_delay_days': instance.instructorPayoutDelayDays,
      'ride_start_window_hours': instance.rideStartWindowHours,
      'ride_transfer_cutoff_hours': instance.rideTransferCutoffHours,
    };
