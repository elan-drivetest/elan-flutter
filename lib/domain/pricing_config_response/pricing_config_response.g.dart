// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingConfigResponseImpl _$$PricingConfigResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PricingConfigResponseImpl(
      baseDistance: json['base_distance'] as num?,
      baseRate: json['base_rate'] as num?,
      normalRate: json['normal_rate'] as num?,
      instructorRate: json['instructor_rate'] as num?,
      averageDistancePerHour: json['average_distance_per_hour'] as num?,
      instructorReferralPrice: json['instructor_referral_price'] as num?,
      adminReferralPrice: json['admin_referral_price'] as num?,
      referralMinRides: (json['referral_min_rides'] as num?)?.toInt(),
      bookingMinLeadDays: (json['booking_min_lead_days'] as num?)?.toInt(),
      refundFullHours: (json['refund_full_hours'] as num?)?.toInt(),
      refundPartialHours: (json['refund_partial_hours'] as num?)?.toInt(),
      refundPartialPercentage: json['refund_partial_percentage'] as num?,
      failureCouponPercentage: json['failure_coupon_percentage'] as num?,
      failureCouponValidityMonths:
          (json['failure_coupon_validity_months'] as num?)?.toInt(),
      instructorPayoutDelayDays:
          (json['instructor_payout_delay_days'] as num?)?.toInt(),
      rideStartWindowHours: (json['ride_start_window_hours'] as num?)?.toInt(),
      rideTransferCutoffHours:
          (json['ride_transfer_cutoff_hours'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PricingConfigResponseImplToJson(
        _$PricingConfigResponseImpl instance) =>
    <String, dynamic>{
      'base_distance': instance.baseDistance,
      'base_rate': instance.baseRate,
      'normal_rate': instance.normalRate,
      'instructor_rate': instance.instructorRate,
      'average_distance_per_hour': instance.averageDistancePerHour,
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
