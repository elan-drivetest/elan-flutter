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
///
/// **Never compute instructor pay from these values.** They are for copy that
/// is not about a specific job ("instructors earn $120 + $40/hr driving"). The
/// authoritative per-job number is `ride_price` on the booking and the
/// authoritative per-ride number is `instructorEarnings` — an accepted job
/// keeps the rate it was accepted at, so anything recomputed here drifts the
/// moment an admin edits a setting.
@freezed
class PricingConfig with _$PricingConfig {
  const factory PricingConfig({
    // ── Pickup fare (customer-side; parsed for completeness, unused here) ──
    @JsonKey(name: "base_distance") @Default(50) num baseDistance,
    @JsonKey(name: "base_rate") @Default(100) num baseRate,
    @JsonKey(name: "normal_rate") @Default(50) num normalRate,

    // ── Instructor economics (pay v2) ──
    /// Cents per hour — **the single pay lever**.
    ///
    /// A ride pays `instructor_rate x 3` for the road test itself plus
    /// `instructor_rate` per hour of driving the customer. The server's own
    /// fallback used to be 8000 against a seeded 4000; both are 4000 now, so
    /// this default finally matches what the server would use.
    @JsonKey(name: "instructor_rate") @Default(4000) num instructorRate,

    /// Cents. **Derived and read-only** — `instructor_rate x 3`, the flat
    /// road-test portion. It is not a stored setting and not admin-editable;
    /// it is published so nothing has to hardcode the x3.
    @JsonKey(name: "instructor_base_price")
    @Default(12000)
    num instructorBasePrice,

    /// Legacy fallback only. Used server-side to derive transportation hours
    /// for bookings taken before `pickup_duration` was recorded.
    @JsonKey(name: "average_distance_per_hour")
    @Default(50)
    num averageDistancePerHour,

    /// Kilometres. The furthest pickup the booking flow will accept. Was
    /// already resolved server-side but undeclared; now published.
    @JsonKey(name: "max_pickup_distance_km")
    @Default(300)
    num maxPickupDistanceKm,

    /// Hours a road test is assumed to occupy the instructor.
    ///
    /// **Display only — it no longer affects pay.** The road test is covered by
    /// the flat base now, so neither this nor the add-on lesson contributes a
    /// cent. Nothing in this app may compute pay from it.
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
