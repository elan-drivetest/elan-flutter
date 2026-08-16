// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingConfig _$PricingConfigFromJson(Map<String, dynamic> json) {
  return _PricingConfig.fromJson(json);
}

/// @nodoc
mixin _$PricingConfig {
// ── Pickup fare (customer-side; parsed for completeness, unused here) ──
  @JsonKey(name: "base_distance")
  num get baseDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "base_rate")
  num get baseRate => throw _privateConstructorUsedError;
  @JsonKey(name: "normal_rate")
  num get normalRate =>
      throw _privateConstructorUsedError; // ── Instructor economics ──
  /// Cents per hour. Note the server's own fallback is 8000, which disagrees
  /// with the seeded 4000 — mirrored deliberately so this app never advertises
  /// a rate the server would not use.
  @JsonKey(name: "instructor_rate")
  num get instructorRate => throw _privateConstructorUsedError;
  @JsonKey(name: "average_distance_per_hour")
  num get averageDistancePerHour => throw _privateConstructorUsedError;

  /// Hours a road test itself is assumed to occupy the instructor.
  ///
  /// Added to `/v1/pricing-config` when the estimate was reworked: a job is
  /// now quoted as `test_duration_hours + addon/60 + roundTripKm/avgPerHour`,
  /// which is why a meet-at-centre booking is quoted ~1 h instead of $0
  /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §7.1).
  ///
  /// The app does **not** reproduce that formula — `addon_duration` is not
  /// exposed to instructors (§14.11), so a job with a booked lesson cannot be
  /// recomputed client-side. Always display the server's `ride_price` /
  /// `total_ride_hour`.
  @JsonKey(name: "test_duration_hours")
  num get testDurationHours =>
      throw _privateConstructorUsedError; // ── Referrals ──
  /// Cents, paid to BOTH referrer and referee — true cost is double this.
  @JsonKey(name: "instructor_referral_price")
  num get instructorReferralPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_referral_price")
  num get adminReferralPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "referral_min_rides")
  num get referralMinRides =>
      throw _privateConstructorUsedError; // ── Booking policy ──
  @JsonKey(name: "booking_min_lead_days")
  num get bookingMinLeadDays =>
      throw _privateConstructorUsedError; // ── Refund ladder ──
  @JsonKey(name: "refund_full_hours")
  num get refundFullHours => throw _privateConstructorUsedError;
  @JsonKey(name: "refund_partial_hours")
  num get refundPartialHours => throw _privateConstructorUsedError;
  @JsonKey(name: "refund_partial_percentage")
  num get refundPartialPercentage =>
      throw _privateConstructorUsedError; // ── Failed-test coupon ──
  @JsonKey(name: "failure_coupon_percentage")
  num get failureCouponPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "failure_coupon_validity_months")
  num get failureCouponValidityMonths =>
      throw _privateConstructorUsedError; // ── Ride lifecycle ──
  @JsonKey(name: "instructor_payout_delay_days")
  num get instructorPayoutDelayDays => throw _privateConstructorUsedError;
  @JsonKey(name: "ride_start_window_hours")
  num get rideStartWindowHours => throw _privateConstructorUsedError;
  @JsonKey(name: "ride_transfer_cutoff_hours")
  num get rideTransferCutoffHours => throw _privateConstructorUsedError;

  /// Serializes this PricingConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingConfigCopyWith<PricingConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingConfigCopyWith<$Res> {
  factory $PricingConfigCopyWith(
          PricingConfig value, $Res Function(PricingConfig) then) =
      _$PricingConfigCopyWithImpl<$Res, PricingConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: "base_distance") num baseDistance,
      @JsonKey(name: "base_rate") num baseRate,
      @JsonKey(name: "normal_rate") num normalRate,
      @JsonKey(name: "instructor_rate") num instructorRate,
      @JsonKey(name: "average_distance_per_hour") num averageDistancePerHour,
      @JsonKey(name: "test_duration_hours") num testDurationHours,
      @JsonKey(name: "instructor_referral_price") num instructorReferralPrice,
      @JsonKey(name: "admin_referral_price") num adminReferralPrice,
      @JsonKey(name: "referral_min_rides") num referralMinRides,
      @JsonKey(name: "booking_min_lead_days") num bookingMinLeadDays,
      @JsonKey(name: "refund_full_hours") num refundFullHours,
      @JsonKey(name: "refund_partial_hours") num refundPartialHours,
      @JsonKey(name: "refund_partial_percentage") num refundPartialPercentage,
      @JsonKey(name: "failure_coupon_percentage") num failureCouponPercentage,
      @JsonKey(name: "failure_coupon_validity_months")
      num failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      num instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") num rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      num rideTransferCutoffHours});
}

/// @nodoc
class _$PricingConfigCopyWithImpl<$Res, $Val extends PricingConfig>
    implements $PricingConfigCopyWith<$Res> {
  _$PricingConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDistance = null,
    Object? baseRate = null,
    Object? normalRate = null,
    Object? instructorRate = null,
    Object? averageDistancePerHour = null,
    Object? testDurationHours = null,
    Object? instructorReferralPrice = null,
    Object? adminReferralPrice = null,
    Object? referralMinRides = null,
    Object? bookingMinLeadDays = null,
    Object? refundFullHours = null,
    Object? refundPartialHours = null,
    Object? refundPartialPercentage = null,
    Object? failureCouponPercentage = null,
    Object? failureCouponValidityMonths = null,
    Object? instructorPayoutDelayDays = null,
    Object? rideStartWindowHours = null,
    Object? rideTransferCutoffHours = null,
  }) {
    return _then(_value.copyWith(
      baseDistance: null == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as num,
      baseRate: null == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as num,
      normalRate: null == normalRate
          ? _value.normalRate
          : normalRate // ignore: cast_nullable_to_non_nullable
              as num,
      instructorRate: null == instructorRate
          ? _value.instructorRate
          : instructorRate // ignore: cast_nullable_to_non_nullable
              as num,
      averageDistancePerHour: null == averageDistancePerHour
          ? _value.averageDistancePerHour
          : averageDistancePerHour // ignore: cast_nullable_to_non_nullable
              as num,
      testDurationHours: null == testDurationHours
          ? _value.testDurationHours
          : testDurationHours // ignore: cast_nullable_to_non_nullable
              as num,
      instructorReferralPrice: null == instructorReferralPrice
          ? _value.instructorReferralPrice
          : instructorReferralPrice // ignore: cast_nullable_to_non_nullable
              as num,
      adminReferralPrice: null == adminReferralPrice
          ? _value.adminReferralPrice
          : adminReferralPrice // ignore: cast_nullable_to_non_nullable
              as num,
      referralMinRides: null == referralMinRides
          ? _value.referralMinRides
          : referralMinRides // ignore: cast_nullable_to_non_nullable
              as num,
      bookingMinLeadDays: null == bookingMinLeadDays
          ? _value.bookingMinLeadDays
          : bookingMinLeadDays // ignore: cast_nullable_to_non_nullable
              as num,
      refundFullHours: null == refundFullHours
          ? _value.refundFullHours
          : refundFullHours // ignore: cast_nullable_to_non_nullable
              as num,
      refundPartialHours: null == refundPartialHours
          ? _value.refundPartialHours
          : refundPartialHours // ignore: cast_nullable_to_non_nullable
              as num,
      refundPartialPercentage: null == refundPartialPercentage
          ? _value.refundPartialPercentage
          : refundPartialPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      failureCouponPercentage: null == failureCouponPercentage
          ? _value.failureCouponPercentage
          : failureCouponPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      failureCouponValidityMonths: null == failureCouponValidityMonths
          ? _value.failureCouponValidityMonths
          : failureCouponValidityMonths // ignore: cast_nullable_to_non_nullable
              as num,
      instructorPayoutDelayDays: null == instructorPayoutDelayDays
          ? _value.instructorPayoutDelayDays
          : instructorPayoutDelayDays // ignore: cast_nullable_to_non_nullable
              as num,
      rideStartWindowHours: null == rideStartWindowHours
          ? _value.rideStartWindowHours
          : rideStartWindowHours // ignore: cast_nullable_to_non_nullable
              as num,
      rideTransferCutoffHours: null == rideTransferCutoffHours
          ? _value.rideTransferCutoffHours
          : rideTransferCutoffHours // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingConfigImplCopyWith<$Res>
    implements $PricingConfigCopyWith<$Res> {
  factory _$$PricingConfigImplCopyWith(
          _$PricingConfigImpl value, $Res Function(_$PricingConfigImpl) then) =
      __$$PricingConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "base_distance") num baseDistance,
      @JsonKey(name: "base_rate") num baseRate,
      @JsonKey(name: "normal_rate") num normalRate,
      @JsonKey(name: "instructor_rate") num instructorRate,
      @JsonKey(name: "average_distance_per_hour") num averageDistancePerHour,
      @JsonKey(name: "test_duration_hours") num testDurationHours,
      @JsonKey(name: "instructor_referral_price") num instructorReferralPrice,
      @JsonKey(name: "admin_referral_price") num adminReferralPrice,
      @JsonKey(name: "referral_min_rides") num referralMinRides,
      @JsonKey(name: "booking_min_lead_days") num bookingMinLeadDays,
      @JsonKey(name: "refund_full_hours") num refundFullHours,
      @JsonKey(name: "refund_partial_hours") num refundPartialHours,
      @JsonKey(name: "refund_partial_percentage") num refundPartialPercentage,
      @JsonKey(name: "failure_coupon_percentage") num failureCouponPercentage,
      @JsonKey(name: "failure_coupon_validity_months")
      num failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      num instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") num rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      num rideTransferCutoffHours});
}

/// @nodoc
class __$$PricingConfigImplCopyWithImpl<$Res>
    extends _$PricingConfigCopyWithImpl<$Res, _$PricingConfigImpl>
    implements _$$PricingConfigImplCopyWith<$Res> {
  __$$PricingConfigImplCopyWithImpl(
      _$PricingConfigImpl _value, $Res Function(_$PricingConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDistance = null,
    Object? baseRate = null,
    Object? normalRate = null,
    Object? instructorRate = null,
    Object? averageDistancePerHour = null,
    Object? testDurationHours = null,
    Object? instructorReferralPrice = null,
    Object? adminReferralPrice = null,
    Object? referralMinRides = null,
    Object? bookingMinLeadDays = null,
    Object? refundFullHours = null,
    Object? refundPartialHours = null,
    Object? refundPartialPercentage = null,
    Object? failureCouponPercentage = null,
    Object? failureCouponValidityMonths = null,
    Object? instructorPayoutDelayDays = null,
    Object? rideStartWindowHours = null,
    Object? rideTransferCutoffHours = null,
  }) {
    return _then(_$PricingConfigImpl(
      baseDistance: null == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as num,
      baseRate: null == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as num,
      normalRate: null == normalRate
          ? _value.normalRate
          : normalRate // ignore: cast_nullable_to_non_nullable
              as num,
      instructorRate: null == instructorRate
          ? _value.instructorRate
          : instructorRate // ignore: cast_nullable_to_non_nullable
              as num,
      averageDistancePerHour: null == averageDistancePerHour
          ? _value.averageDistancePerHour
          : averageDistancePerHour // ignore: cast_nullable_to_non_nullable
              as num,
      testDurationHours: null == testDurationHours
          ? _value.testDurationHours
          : testDurationHours // ignore: cast_nullable_to_non_nullable
              as num,
      instructorReferralPrice: null == instructorReferralPrice
          ? _value.instructorReferralPrice
          : instructorReferralPrice // ignore: cast_nullable_to_non_nullable
              as num,
      adminReferralPrice: null == adminReferralPrice
          ? _value.adminReferralPrice
          : adminReferralPrice // ignore: cast_nullable_to_non_nullable
              as num,
      referralMinRides: null == referralMinRides
          ? _value.referralMinRides
          : referralMinRides // ignore: cast_nullable_to_non_nullable
              as num,
      bookingMinLeadDays: null == bookingMinLeadDays
          ? _value.bookingMinLeadDays
          : bookingMinLeadDays // ignore: cast_nullable_to_non_nullable
              as num,
      refundFullHours: null == refundFullHours
          ? _value.refundFullHours
          : refundFullHours // ignore: cast_nullable_to_non_nullable
              as num,
      refundPartialHours: null == refundPartialHours
          ? _value.refundPartialHours
          : refundPartialHours // ignore: cast_nullable_to_non_nullable
              as num,
      refundPartialPercentage: null == refundPartialPercentage
          ? _value.refundPartialPercentage
          : refundPartialPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      failureCouponPercentage: null == failureCouponPercentage
          ? _value.failureCouponPercentage
          : failureCouponPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      failureCouponValidityMonths: null == failureCouponValidityMonths
          ? _value.failureCouponValidityMonths
          : failureCouponValidityMonths // ignore: cast_nullable_to_non_nullable
              as num,
      instructorPayoutDelayDays: null == instructorPayoutDelayDays
          ? _value.instructorPayoutDelayDays
          : instructorPayoutDelayDays // ignore: cast_nullable_to_non_nullable
              as num,
      rideStartWindowHours: null == rideStartWindowHours
          ? _value.rideStartWindowHours
          : rideStartWindowHours // ignore: cast_nullable_to_non_nullable
              as num,
      rideTransferCutoffHours: null == rideTransferCutoffHours
          ? _value.rideTransferCutoffHours
          : rideTransferCutoffHours // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingConfigImpl implements _PricingConfig {
  const _$PricingConfigImpl(
      {@JsonKey(name: "base_distance") this.baseDistance = 50,
      @JsonKey(name: "base_rate") this.baseRate = 100,
      @JsonKey(name: "normal_rate") this.normalRate = 50,
      @JsonKey(name: "instructor_rate") this.instructorRate = 8000,
      @JsonKey(name: "average_distance_per_hour")
      this.averageDistancePerHour = 50,
      @JsonKey(name: "test_duration_hours") this.testDurationHours = 1,
      @JsonKey(name: "instructor_referral_price")
      this.instructorReferralPrice = 10000,
      @JsonKey(name: "admin_referral_price") this.adminReferralPrice = 10000,
      @JsonKey(name: "referral_min_rides") this.referralMinRides = 5,
      @JsonKey(name: "booking_min_lead_days") this.bookingMinLeadDays = 2,
      @JsonKey(name: "refund_full_hours") this.refundFullHours = 48,
      @JsonKey(name: "refund_partial_hours") this.refundPartialHours = 24,
      @JsonKey(name: "refund_partial_percentage")
      this.refundPartialPercentage = 50,
      @JsonKey(name: "failure_coupon_percentage")
      this.failureCouponPercentage = 10,
      @JsonKey(name: "failure_coupon_validity_months")
      this.failureCouponValidityMonths = 6,
      @JsonKey(name: "instructor_payout_delay_days")
      this.instructorPayoutDelayDays = 7,
      @JsonKey(name: "ride_start_window_hours") this.rideStartWindowHours = 6,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      this.rideTransferCutoffHours = 6});

  factory _$PricingConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingConfigImplFromJson(json);

// ── Pickup fare (customer-side; parsed for completeness, unused here) ──
  @override
  @JsonKey(name: "base_distance")
  final num baseDistance;
  @override
  @JsonKey(name: "base_rate")
  final num baseRate;
  @override
  @JsonKey(name: "normal_rate")
  final num normalRate;
// ── Instructor economics ──
  /// Cents per hour. Note the server's own fallback is 8000, which disagrees
  /// with the seeded 4000 — mirrored deliberately so this app never advertises
  /// a rate the server would not use.
  @override
  @JsonKey(name: "instructor_rate")
  final num instructorRate;
  @override
  @JsonKey(name: "average_distance_per_hour")
  final num averageDistancePerHour;

  /// Hours a road test itself is assumed to occupy the instructor.
  ///
  /// Added to `/v1/pricing-config` when the estimate was reworked: a job is
  /// now quoted as `test_duration_hours + addon/60 + roundTripKm/avgPerHour`,
  /// which is why a meet-at-centre booking is quoted ~1 h instead of $0
  /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §7.1).
  ///
  /// The app does **not** reproduce that formula — `addon_duration` is not
  /// exposed to instructors (§14.11), so a job with a booked lesson cannot be
  /// recomputed client-side. Always display the server's `ride_price` /
  /// `total_ride_hour`.
  @override
  @JsonKey(name: "test_duration_hours")
  final num testDurationHours;
// ── Referrals ──
  /// Cents, paid to BOTH referrer and referee — true cost is double this.
  @override
  @JsonKey(name: "instructor_referral_price")
  final num instructorReferralPrice;
  @override
  @JsonKey(name: "admin_referral_price")
  final num adminReferralPrice;
  @override
  @JsonKey(name: "referral_min_rides")
  final num referralMinRides;
// ── Booking policy ──
  @override
  @JsonKey(name: "booking_min_lead_days")
  final num bookingMinLeadDays;
// ── Refund ladder ──
  @override
  @JsonKey(name: "refund_full_hours")
  final num refundFullHours;
  @override
  @JsonKey(name: "refund_partial_hours")
  final num refundPartialHours;
  @override
  @JsonKey(name: "refund_partial_percentage")
  final num refundPartialPercentage;
// ── Failed-test coupon ──
  @override
  @JsonKey(name: "failure_coupon_percentage")
  final num failureCouponPercentage;
  @override
  @JsonKey(name: "failure_coupon_validity_months")
  final num failureCouponValidityMonths;
// ── Ride lifecycle ──
  @override
  @JsonKey(name: "instructor_payout_delay_days")
  final num instructorPayoutDelayDays;
  @override
  @JsonKey(name: "ride_start_window_hours")
  final num rideStartWindowHours;
  @override
  @JsonKey(name: "ride_transfer_cutoff_hours")
  final num rideTransferCutoffHours;

  @override
  String toString() {
    return 'PricingConfig(baseDistance: $baseDistance, baseRate: $baseRate, normalRate: $normalRate, instructorRate: $instructorRate, averageDistancePerHour: $averageDistancePerHour, testDurationHours: $testDurationHours, instructorReferralPrice: $instructorReferralPrice, adminReferralPrice: $adminReferralPrice, referralMinRides: $referralMinRides, bookingMinLeadDays: $bookingMinLeadDays, refundFullHours: $refundFullHours, refundPartialHours: $refundPartialHours, refundPartialPercentage: $refundPartialPercentage, failureCouponPercentage: $failureCouponPercentage, failureCouponValidityMonths: $failureCouponValidityMonths, instructorPayoutDelayDays: $instructorPayoutDelayDays, rideStartWindowHours: $rideStartWindowHours, rideTransferCutoffHours: $rideTransferCutoffHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingConfigImpl &&
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
            (identical(other.testDurationHours, testDurationHours) ||
                other.testDurationHours == testDurationHours) &&
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
      testDurationHours,
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

  /// Create a copy of PricingConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingConfigImplCopyWith<_$PricingConfigImpl> get copyWith =>
      __$$PricingConfigImplCopyWithImpl<_$PricingConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingConfigImplToJson(
      this,
    );
  }
}

abstract class _PricingConfig implements PricingConfig {
  const factory _PricingConfig(
      {@JsonKey(name: "base_distance") final num baseDistance,
      @JsonKey(name: "base_rate") final num baseRate,
      @JsonKey(name: "normal_rate") final num normalRate,
      @JsonKey(name: "instructor_rate") final num instructorRate,
      @JsonKey(name: "average_distance_per_hour")
      final num averageDistancePerHour,
      @JsonKey(name: "test_duration_hours") final num testDurationHours,
      @JsonKey(name: "instructor_referral_price")
      final num instructorReferralPrice,
      @JsonKey(name: "admin_referral_price") final num adminReferralPrice,
      @JsonKey(name: "referral_min_rides") final num referralMinRides,
      @JsonKey(name: "booking_min_lead_days") final num bookingMinLeadDays,
      @JsonKey(name: "refund_full_hours") final num refundFullHours,
      @JsonKey(name: "refund_partial_hours") final num refundPartialHours,
      @JsonKey(name: "refund_partial_percentage")
      final num refundPartialPercentage,
      @JsonKey(name: "failure_coupon_percentage")
      final num failureCouponPercentage,
      @JsonKey(name: "failure_coupon_validity_months")
      final num failureCouponValidityMonths,
      @JsonKey(name: "instructor_payout_delay_days")
      final num instructorPayoutDelayDays,
      @JsonKey(name: "ride_start_window_hours") final num rideStartWindowHours,
      @JsonKey(name: "ride_transfer_cutoff_hours")
      final num rideTransferCutoffHours}) = _$PricingConfigImpl;

  factory _PricingConfig.fromJson(Map<String, dynamic> json) =
      _$PricingConfigImpl.fromJson;

// ── Pickup fare (customer-side; parsed for completeness, unused here) ──
  @override
  @JsonKey(name: "base_distance")
  num get baseDistance;
  @override
  @JsonKey(name: "base_rate")
  num get baseRate;
  @override
  @JsonKey(name: "normal_rate")
  num get normalRate; // ── Instructor economics ──
  /// Cents per hour. Note the server's own fallback is 8000, which disagrees
  /// with the seeded 4000 — mirrored deliberately so this app never advertises
  /// a rate the server would not use.
  @override
  @JsonKey(name: "instructor_rate")
  num get instructorRate;
  @override
  @JsonKey(name: "average_distance_per_hour")
  num get averageDistancePerHour;

  /// Hours a road test itself is assumed to occupy the instructor.
  ///
  /// Added to `/v1/pricing-config` when the estimate was reworked: a job is
  /// now quoted as `test_duration_hours + addon/60 + roundTripKm/avgPerHour`,
  /// which is why a meet-at-centre booking is quoted ~1 h instead of $0
  /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §7.1).
  ///
  /// The app does **not** reproduce that formula — `addon_duration` is not
  /// exposed to instructors (§14.11), so a job with a booked lesson cannot be
  /// recomputed client-side. Always display the server's `ride_price` /
  /// `total_ride_hour`.
  @override
  @JsonKey(name: "test_duration_hours")
  num get testDurationHours; // ── Referrals ──
  /// Cents, paid to BOTH referrer and referee — true cost is double this.
  @override
  @JsonKey(name: "instructor_referral_price")
  num get instructorReferralPrice;
  @override
  @JsonKey(name: "admin_referral_price")
  num get adminReferralPrice;
  @override
  @JsonKey(name: "referral_min_rides")
  num get referralMinRides; // ── Booking policy ──
  @override
  @JsonKey(name: "booking_min_lead_days")
  num get bookingMinLeadDays; // ── Refund ladder ──
  @override
  @JsonKey(name: "refund_full_hours")
  num get refundFullHours;
  @override
  @JsonKey(name: "refund_partial_hours")
  num get refundPartialHours;
  @override
  @JsonKey(name: "refund_partial_percentage")
  num get refundPartialPercentage; // ── Failed-test coupon ──
  @override
  @JsonKey(name: "failure_coupon_percentage")
  num get failureCouponPercentage;
  @override
  @JsonKey(name: "failure_coupon_validity_months")
  num get failureCouponValidityMonths; // ── Ride lifecycle ──
  @override
  @JsonKey(name: "instructor_payout_delay_days")
  num get instructorPayoutDelayDays;
  @override
  @JsonKey(name: "ride_start_window_hours")
  num get rideStartWindowHours;
  @override
  @JsonKey(name: "ride_transfer_cutoff_hours")
  num get rideTransferCutoffHours;

  /// Create a copy of PricingConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingConfigImplCopyWith<_$PricingConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
