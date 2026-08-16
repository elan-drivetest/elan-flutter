import 'package:freezed_annotation/freezed_annotation.dart';

part 'pricing_config.freezed.dart';
part 'pricing_config.g.dart';

/// Public, server-owned numeric configuration — `GET /v1/pricing-config`.
///
/// Every value here is admin-editable and takes effect on the next request with
/// no deploy, so nothing in this app may hardcode one of these numbers. The
/// endpoint is unauthenticated, which means it can be fetched before login.
///
/// Contract (see `elan-backend/docs/ADMIN_SETTINGS.md` §1):
///  * values are numbers, never strings;
///  * every key is always present — a missing or invalid row on the server
///    resolves to the server's own fallback, so callers never handle absent keys;
///  * additive only — new keys are appended, existing ones never change name or
///    type, so an unknown key is safe to ignore.
///
/// The `@Default`s below mirror `PUBLIC_CONFIG_FALLBACKS` in the backend's
/// `settings.service.ts` exactly. They are a last resort for when the fetch
/// fails — never a source of truth. Keep them in sync if the server's change.
@freezed
class PricingConfig with _$PricingConfig {
  const factory PricingConfig({
    // ── Pickup fare (customer-side; parsed for completeness, unused here) ──
    @JsonKey(name: "base_distance") @Default(50) num baseDistance,
    @JsonKey(name: "base_rate") @Default(100) num baseRate,
    @JsonKey(name: "normal_rate") @Default(50) num normalRate,

    // ── Instructor economics ──
    /// Cents per hour. Note the server's own fallback is 8000, which disagrees
    /// with the seeded 4000 — mirrored deliberately so this app never advertises
    /// a rate the server would not use.
    @JsonKey(name: "instructor_rate") @Default(8000) num instructorRate,
    @JsonKey(name: "average_distance_per_hour")
    @Default(50)
    num averageDistancePerHour,

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
    @JsonKey(name: "test_duration_hours") @Default(1) num testDurationHours,

    // ── Referrals ──
    /// Cents, paid to BOTH referrer and referee — true cost is double this.
    @JsonKey(name: "instructor_referral_price")
    @Default(10000)
    num instructorReferralPrice,
    @JsonKey(name: "admin_referral_price")
    @Default(10000)
    num adminReferralPrice,
    @JsonKey(name: "referral_min_rides") @Default(5) num referralMinRides,

    // ── Booking policy ──
    @JsonKey(name: "booking_min_lead_days") @Default(2) num bookingMinLeadDays,

    // ── Refund ladder ──
    @JsonKey(name: "refund_full_hours") @Default(48) num refundFullHours,
    @JsonKey(name: "refund_partial_hours") @Default(24) num refundPartialHours,
    @JsonKey(name: "refund_partial_percentage")
    @Default(50)
    num refundPartialPercentage,

    // ── Failed-test coupon ──
    @JsonKey(name: "failure_coupon_percentage")
    @Default(10)
    num failureCouponPercentage,
    @JsonKey(name: "failure_coupon_validity_months")
    @Default(6)
    num failureCouponValidityMonths,

    // ── Ride lifecycle ──
    @JsonKey(name: "instructor_payout_delay_days")
    @Default(7)
    num instructorPayoutDelayDays,
    @JsonKey(name: "ride_start_window_hours")
    @Default(6)
    num rideStartWindowHours,
    @JsonKey(name: "ride_transfer_cutoff_hours")
    @Default(6)
    num rideTransferCutoffHours,
  }) = _PricingConfig;

  factory PricingConfig.fromJson(Map<String, dynamic> json) =>
      _$PricingConfigFromJson(json);
}
