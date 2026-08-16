// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_config_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingConfigResponse _$PricingConfigResponseFromJson(
    Map<String, dynamic> json) {
  return _PricingConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$PricingConfigResponse {
  @JsonKey(name: "base_distance")
  num? get baseDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "base_rate")
  num? get baseRate => throw _privateConstructorUsedError;
  @JsonKey(name: "normal_rate")
  num? get normalRate => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_rate")
  num? get instructorRate => throw _privateConstructorUsedError;
  @JsonKey(name: "average_distance_per_hour")
  num? get averageDistancePerHour => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_referral_price")
  num? get instructorReferralPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_referral_price")
  num? get adminReferralPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "referral_min_rides")
  int? get referralMinRides => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_min_lead_days")
  int? get bookingMinLeadDays => throw _privateConstructorUsedError;
  @JsonKey(name: "refund_full_hours")
  int? get refundFullHours => throw _privateConstructorUsedError;
  @JsonKey(name: "refund_partial_hours")
  int? get refundPartialHours => throw _privateConstructorUsedError;
  @JsonKey(name: "refund_partial_percentage")
  num? get refundPartialPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "failure_coupon_percentage")
  num? get failureCouponPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "failure_coupon_validity_months")
  int? get failureCouponValidityMonths => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_payout_delay_days")
  int? get instructorPayoutDelayDays => throw _privateConstructorUsedError;
  @JsonKey(name: "ride_start_window_hours")
  int? get rideStartWindowHours => throw _privateConstructorUsedError;
  @JsonKey(name: "ride_transfer_cutoff_hours")
  int? get rideTransferCutoffHours => throw _privateConstructorUsedError;

  /// Serializes this PricingConfigResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingConfigResponseCopyWith<PricingConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingConfigResponseCopyWith<$Res> {
  factory $PricingConfigResponseCopyWith(PricingConfigResponse value,
          $Res Function(PricingConfigResponse) then) =
      _$PricingConfigResponseCopyWithImpl<$Res, PricingConfigResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "base_distance") num? baseDistance,
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
      @JsonKey(name: "failure_coupon_validity_months")
      int? failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      int? instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") int? rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      int? rideTransferCutoffHours});
}

/// @nodoc
class _$PricingConfigResponseCopyWithImpl<$Res,
        $Val extends PricingConfigResponse>
    implements $PricingConfigResponseCopyWith<$Res> {
  _$PricingConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDistance = freezed,
    Object? baseRate = freezed,
    Object? normalRate = freezed,
    Object? instructorRate = freezed,
    Object? averageDistancePerHour = freezed,
    Object? instructorReferralPrice = freezed,
    Object? adminReferralPrice = freezed,
    Object? referralMinRides = freezed,
    Object? bookingMinLeadDays = freezed,
    Object? refundFullHours = freezed,
    Object? refundPartialHours = freezed,
    Object? refundPartialPercentage = freezed,
    Object? failureCouponPercentage = freezed,
    Object? failureCouponValidityMonths = freezed,
    Object? instructorPayoutDelayDays = freezed,
    Object? rideStartWindowHours = freezed,
    Object? rideTransferCutoffHours = freezed,
  }) {
    return _then(_value.copyWith(
      baseDistance: freezed == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as num?,
      baseRate: freezed == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as num?,
      normalRate: freezed == normalRate
          ? _value.normalRate
          : normalRate // ignore: cast_nullable_to_non_nullable
              as num?,
      instructorRate: freezed == instructorRate
          ? _value.instructorRate
          : instructorRate // ignore: cast_nullable_to_non_nullable
              as num?,
      averageDistancePerHour: freezed == averageDistancePerHour
          ? _value.averageDistancePerHour
          : averageDistancePerHour // ignore: cast_nullable_to_non_nullable
              as num?,
      instructorReferralPrice: freezed == instructorReferralPrice
          ? _value.instructorReferralPrice
          : instructorReferralPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      adminReferralPrice: freezed == adminReferralPrice
          ? _value.adminReferralPrice
          : adminReferralPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      referralMinRides: freezed == referralMinRides
          ? _value.referralMinRides
          : referralMinRides // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingMinLeadDays: freezed == bookingMinLeadDays
          ? _value.bookingMinLeadDays
          : bookingMinLeadDays // ignore: cast_nullable_to_non_nullable
              as int?,
      refundFullHours: freezed == refundFullHours
          ? _value.refundFullHours
          : refundFullHours // ignore: cast_nullable_to_non_nullable
              as int?,
      refundPartialHours: freezed == refundPartialHours
          ? _value.refundPartialHours
          : refundPartialHours // ignore: cast_nullable_to_non_nullable
              as int?,
      refundPartialPercentage: freezed == refundPartialPercentage
          ? _value.refundPartialPercentage
          : refundPartialPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      failureCouponPercentage: freezed == failureCouponPercentage
          ? _value.failureCouponPercentage
          : failureCouponPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      failureCouponValidityMonths: freezed == failureCouponValidityMonths
          ? _value.failureCouponValidityMonths
          : failureCouponValidityMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorPayoutDelayDays: freezed == instructorPayoutDelayDays
          ? _value.instructorPayoutDelayDays
          : instructorPayoutDelayDays // ignore: cast_nullable_to_non_nullable
              as int?,
      rideStartWindowHours: freezed == rideStartWindowHours
          ? _value.rideStartWindowHours
          : rideStartWindowHours // ignore: cast_nullable_to_non_nullable
              as int?,
      rideTransferCutoffHours: freezed == rideTransferCutoffHours
          ? _value.rideTransferCutoffHours
          : rideTransferCutoffHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingConfigResponseImplCopyWith<$Res>
    implements $PricingConfigResponseCopyWith<$Res> {
  factory _$$PricingConfigResponseImplCopyWith(
          _$PricingConfigResponseImpl value,
          $Res Function(_$PricingConfigResponseImpl) then) =
      __$$PricingConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "base_distance") num? baseDistance,
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
      @JsonKey(name: "failure_coupon_validity_months")
      int? failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      int? instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") int? rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      int? rideTransferCutoffHours});
}

/// @nodoc
class __$$PricingConfigResponseImplCopyWithImpl<$Res>
    extends _$PricingConfigResponseCopyWithImpl<$Res,
        _$PricingConfigResponseImpl>
    implements _$$PricingConfigResponseImplCopyWith<$Res> {
  __$$PricingConfigResponseImplCopyWithImpl(_$PricingConfigResponseImpl _value,
      $Res Function(_$PricingConfigResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDistance = freezed,
    Object? baseRate = freezed,
    Object? normalRate = freezed,
    Object? instructorRate = freezed,
    Object? averageDistancePerHour = freezed,
    Object? instructorReferralPrice = freezed,
    Object? adminReferralPrice = freezed,
    Object? referralMinRides = freezed,
    Object? bookingMinLeadDays = freezed,
    Object? refundFullHours = freezed,
    Object? refundPartialHours = freezed,
    Object? refundPartialPercentage = freezed,
    Object? failureCouponPercentage = freezed,
    Object? failureCouponValidityMonths = freezed,
    Object? instructorPayoutDelayDays = freezed,
    Object? rideStartWindowHours = freezed,
    Object? rideTransferCutoffHours = freezed,
  }) {
    return _then(_$PricingConfigResponseImpl(
      baseDistance: freezed == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as num?,
      baseRate: freezed == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as num?,
      normalRate: freezed == normalRate
          ? _value.normalRate
          : normalRate // ignore: cast_nullable_to_non_nullable
              as num?,
      instructorRate: freezed == instructorRate
          ? _value.instructorRate
          : instructorRate // ignore: cast_nullable_to_non_nullable
              as num?,
      averageDistancePerHour: freezed == averageDistancePerHour
          ? _value.averageDistancePerHour
          : averageDistancePerHour // ignore: cast_nullable_to_non_nullable
              as num?,
      instructorReferralPrice: freezed == instructorReferralPrice
          ? _value.instructorReferralPrice
          : instructorReferralPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      adminReferralPrice: freezed == adminReferralPrice
          ? _value.adminReferralPrice
          : adminReferralPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      referralMinRides: freezed == referralMinRides
          ? _value.referralMinRides
          : referralMinRides // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingMinLeadDays: freezed == bookingMinLeadDays
          ? _value.bookingMinLeadDays
          : bookingMinLeadDays // ignore: cast_nullable_to_non_nullable
              as int?,
      refundFullHours: freezed == refundFullHours
          ? _value.refundFullHours
          : refundFullHours // ignore: cast_nullable_to_non_nullable
              as int?,
      refundPartialHours: freezed == refundPartialHours
          ? _value.refundPartialHours
          : refundPartialHours // ignore: cast_nullable_to_non_nullable
              as int?,
      refundPartialPercentage: freezed == refundPartialPercentage
          ? _value.refundPartialPercentage
          : refundPartialPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      failureCouponPercentage: freezed == failureCouponPercentage
          ? _value.failureCouponPercentage
          : failureCouponPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      failureCouponValidityMonths: freezed == failureCouponValidityMonths
          ? _value.failureCouponValidityMonths
          : failureCouponValidityMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorPayoutDelayDays: freezed == instructorPayoutDelayDays
          ? _value.instructorPayoutDelayDays
          : instructorPayoutDelayDays // ignore: cast_nullable_to_non_nullable
              as int?,
      rideStartWindowHours: freezed == rideStartWindowHours
          ? _value.rideStartWindowHours
          : rideStartWindowHours // ignore: cast_nullable_to_non_nullable
              as int?,
      rideTransferCutoffHours: freezed == rideTransferCutoffHours
          ? _value.rideTransferCutoffHours
          : rideTransferCutoffHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingConfigResponseImpl implements _PricingConfigResponse {
  const _$PricingConfigResponseImpl(
      {@JsonKey(name: "base_distance") this.baseDistance,
      @JsonKey(name: "base_rate") this.baseRate,
      @JsonKey(name: "normal_rate") this.normalRate,
      @JsonKey(name: "instructor_rate") this.instructorRate,
      @JsonKey(name: "average_distance_per_hour") this.averageDistancePerHour,
      @JsonKey(name: "instructor_referral_price") this.instructorReferralPrice,
      @JsonKey(name: "admin_referral_price") this.adminReferralPrice,
      @JsonKey(name: "referral_min_rides") this.referralMinRides,
      @JsonKey(name: "booking_min_lead_days") this.bookingMinLeadDays,
      @JsonKey(name: "refund_full_hours") this.refundFullHours,
      @JsonKey(name: "refund_partial_hours") this.refundPartialHours,
      @JsonKey(name: "refund_partial_percentage") this.refundPartialPercentage,
      @JsonKey(name: "failure_coupon_percentage") this.failureCouponPercentage,
      @JsonKey(name: "failure_coupon_validity_months")
      this.failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      this.instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") this.rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      this.rideTransferCutoffHours});

  factory _$PricingConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingConfigResponseImplFromJson(json);

  @override
  @JsonKey(name: "base_distance")
  final num? baseDistance;
  @override
  @JsonKey(name: "base_rate")
  final num? baseRate;
  @override
  @JsonKey(name: "normal_rate")
  final num? normalRate;
  @override
  @JsonKey(name: "instructor_rate")
  final num? instructorRate;
  @override
  @JsonKey(name: "average_distance_per_hour")
  final num? averageDistancePerHour;
  @override
  @JsonKey(name: "instructor_referral_price")
  final num? instructorReferralPrice;
  @override
  @JsonKey(name: "admin_referral_price")
  final num? adminReferralPrice;
  @override
  @JsonKey(name: "referral_min_rides")
  final int? referralMinRides;
  @override
  @JsonKey(name: "booking_min_lead_days")
  final int? bookingMinLeadDays;
  @override
  @JsonKey(name: "refund_full_hours")
  final int? refundFullHours;
  @override
  @JsonKey(name: "refund_partial_hours")
  final int? refundPartialHours;
  @override
  @JsonKey(name: "refund_partial_percentage")
  final num? refundPartialPercentage;
  @override
  @JsonKey(name: "failure_coupon_percentage")
  final num? failureCouponPercentage;
  @override
  @JsonKey(name: "failure_coupon_validity_months")
  final int? failureCouponValidityMonths;
  @override
  @JsonKey(name: "instructor_payout_delay_days")
  final int? instructorPayoutDelayDays;
  @override
  @JsonKey(name: "ride_start_window_hours")
  final int? rideStartWindowHours;
  @override
  @JsonKey(name: "ride_transfer_cutoff_hours")
  final int? rideTransferCutoffHours;

  @override
  String toString() {
    return 'PricingConfigResponse(baseDistance: $baseDistance, baseRate: $baseRate, normalRate: $normalRate, instructorRate: $instructorRate, averageDistancePerHour: $averageDistancePerHour, instructorReferralPrice: $instructorReferralPrice, adminReferralPrice: $adminReferralPrice, referralMinRides: $referralMinRides, bookingMinLeadDays: $bookingMinLeadDays, refundFullHours: $refundFullHours, refundPartialHours: $refundPartialHours, refundPartialPercentage: $refundPartialPercentage, failureCouponPercentage: $failureCouponPercentage, failureCouponValidityMonths: $failureCouponValidityMonths, instructorPayoutDelayDays: $instructorPayoutDelayDays, rideStartWindowHours: $rideStartWindowHours, rideTransferCutoffHours: $rideTransferCutoffHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingConfigResponseImpl &&
            (identical(other.baseDistance, baseDistance) ||
                other.baseDistance == baseDistance) &&
            (identical(other.baseRate, baseRate) ||
                other.baseRate == baseRate) &&
            (identical(other.normalRate, normalRate) ||
                other.normalRate == normalRate) &&
            (identical(other.instructorRate, instructorRate) ||
                other.instructorRate == instructorRate) &&
            (identical(other.averageDistancePerHour, averageDistancePerHour) ||
                other.averageDistancePerHour == averageDistancePerHour) &&
            (identical(
                    other.instructorReferralPrice, instructorReferralPrice) ||
                other.instructorReferralPrice == instructorReferralPrice) &&
            (identical(other.adminReferralPrice, adminReferralPrice) ||
                other.adminReferralPrice == adminReferralPrice) &&
            (identical(other.referralMinRides, referralMinRides) ||
                other.referralMinRides == referralMinRides) &&
            (identical(other.bookingMinLeadDays, bookingMinLeadDays) ||
                other.bookingMinLeadDays == bookingMinLeadDays) &&
            (identical(other.refundFullHours, refundFullHours) ||
                other.refundFullHours == refundFullHours) &&
            (identical(other.refundPartialHours, refundPartialHours) ||
                other.refundPartialHours == refundPartialHours) &&
            (identical(
                    other.refundPartialPercentage, refundPartialPercentage) ||
                other.refundPartialPercentage == refundPartialPercentage) &&
            (identical(
                    other.failureCouponPercentage, failureCouponPercentage) ||
                other.failureCouponPercentage == failureCouponPercentage) &&
            (identical(other.failureCouponValidityMonths,
                    failureCouponValidityMonths) ||
                other.failureCouponValidityMonths ==
                    failureCouponValidityMonths) &&
            (identical(other.instructorPayoutDelayDays,
                    instructorPayoutDelayDays) ||
                other.instructorPayoutDelayDays == instructorPayoutDelayDays) &&
            (identical(other.rideStartWindowHours, rideStartWindowHours) ||
                other.rideStartWindowHours == rideStartWindowHours) &&
            (identical(
                    other.rideTransferCutoffHours, rideTransferCutoffHours) ||
                other.rideTransferCutoffHours == rideTransferCutoffHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseDistance,
      baseRate,
      normalRate,
      instructorRate,
      averageDistancePerHour,
      instructorReferralPrice,
      adminReferralPrice,
      referralMinRides,
      bookingMinLeadDays,
      refundFullHours,
      refundPartialHours,
      refundPartialPercentage,
      failureCouponPercentage,
      failureCouponValidityMonths,
      instructorPayoutDelayDays,
      rideStartWindowHours,
      rideTransferCutoffHours);

  /// Create a copy of PricingConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingConfigResponseImplCopyWith<_$PricingConfigResponseImpl>
      get copyWith => __$$PricingConfigResponseImplCopyWithImpl<
          _$PricingConfigResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingConfigResponseImplToJson(
      this,
    );
  }
}

abstract class _PricingConfigResponse implements PricingConfigResponse {
  const factory _PricingConfigResponse(
      {@JsonKey(name: "base_distance") final num? baseDistance,
      @JsonKey(name: "base_rate") final num? baseRate,
      @JsonKey(name: "normal_rate") final num? normalRate,
      @JsonKey(name: "instructor_rate") final num? instructorRate,
      @JsonKey(name: "average_distance_per_hour")
      final num? averageDistancePerHour,
      @JsonKey(name: "instructor_referral_price")
      final num? instructorReferralPrice,
      @JsonKey(name: "admin_referral_price") final num? adminReferralPrice,
      @JsonKey(name: "referral_min_rides") final int? referralMinRides,
      @JsonKey(name: "booking_min_lead_days") final int? bookingMinLeadDays,
      @JsonKey(name: "refund_full_hours") final int? refundFullHours,
      @JsonKey(name: "refund_partial_hours") final int? refundPartialHours,
      @JsonKey(name: "refund_partial_percentage")
      final num? refundPartialPercentage,
      @JsonKey(name: "failure_coupon_percentage")
      final num? failureCouponPercentage,
      @JsonKey(name: "failure_coupon_validity_months")
      final int? failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      final int? instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") final int? rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      final int? rideTransferCutoffHours}) = _$PricingConfigResponseImpl;

  factory _PricingConfigResponse.fromJson(Map<String, dynamic> json) =
      _$PricingConfigResponseImpl.fromJson;

  @override
  @JsonKey(name: "base_distance")
  num? get baseDistance;
  @override
  @JsonKey(name: "base_rate")
  num? get baseRate;
  @override
  @JsonKey(name: "normal_rate")
  num? get normalRate;
  @override
  @JsonKey(name: "instructor_rate")
  num? get instructorRate;
  @override
  @JsonKey(name: "average_distance_per_hour")
  num? get averageDistancePerHour;
  @override
  @JsonKey(name: "instructor_referral_price")
  num? get instructorReferralPrice;
  @override
  @JsonKey(name: "admin_referral_price")
  num? get adminReferralPrice;
  @override
  @JsonKey(name: "referral_min_rides")
  int? get referralMinRides;
  @override
  @JsonKey(name: "booking_min_lead_days")
  int? get bookingMinLeadDays;
  @override
  @JsonKey(name: "refund_full_hours")
  int? get refundFullHours;
  @override
  @JsonKey(name: "refund_partial_hours")
  int? get refundPartialHours;
  @override
  @JsonKey(name: "refund_partial_percentage")
  num? get refundPartialPercentage;
  @override
  @JsonKey(name: "failure_coupon_percentage")
  num? get failureCouponPercentage;
  @override
  @JsonKey(name: "failure_coupon_validity_months")
  int? get failureCouponValidityMonths;
  @override
  @JsonKey(name: "instructor_payout_delay_days")
  int? get instructorPayoutDelayDays;
  @override
  @JsonKey(name: "ride_start_window_hours")
  int? get rideStartWindowHours;
  @override
  @JsonKey(name: "ride_transfer_cutoff_hours")
  int? get rideTransferCutoffHours;

  /// Create a copy of PricingConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingConfigResponseImplCopyWith<_$PricingConfigResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
