import 'package:elan/domain/common/meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_ride_response.freezed.dart';
part 'complete_ride_response.g.dart';

@freezed
class CompleteRideResponse with _$CompleteRideResponse {
  const factory CompleteRideResponse({
    @JsonKey(name: "data") List<CompleteRide>? data,
    @JsonKey(name: "meta") Meta? meta,
  }) = _CompleteRideResponse;

  factory CompleteRideResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteRideResponseFromJson(json);
}

@freezed
class CompleteRide with _$CompleteRide {
  const factory CompleteRide({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "customerName") String? customerName,
    @JsonKey(name: "testCenterName") String? testCenterName,
    @JsonKey(name: "pickupLocation") String? pickupLocation,
    @JsonKey(name: "dropoffLocation") String? dropoffLocation,
    @JsonKey(name: "dateTime") DateTime? dateTime,
    @JsonKey(name: "testType") String? testType,

    /// Cents. `baseAmount + transportationAmount`, and **correct
    /// immediately** — it is written when the job is accepted, not when the
    /// payout cron runs.
    ///
    /// It used to stay 0 until the transfer went out, up to
    /// `instructor_payout_delay_days` (7) after the ride, which is why this
    /// card used to preview `totalHours x hourlyRate` client-side. That
    /// workaround is gone: under the flat-base model it produces a number
    /// wrong by the whole base.
    @JsonKey(name: "instructorEarnings") int? instructorEarnings,

    /// Cents. The flat road-test portion, as frozen at accept.
    ///
    /// `0` for rides accepted before the pay-v2 deploy — those settle on the
    /// old wall-clock arithmetic and have no breakdown to show, so guard the
    /// breakdown UI on `baseAmount > 0` and fall back to the total alone.
    @JsonKey(name: "baseAmount") int? baseAmount,

    /// Paid driving hours (pickup → centre → back). `0` for meet-at-centre.
    @JsonKey(name: "transportationHours", fromJson: _toDouble)
    double? transportationHours,

    /// Cents per transportation hour, snapshotted at accept. Same field name
    /// as before; it no longer prices the road test.
    @JsonKey(name: "hourlyRate") int? hourlyRate,

    /// Cents. `round(transportationHours x hourlyRate)`.
    @JsonKey(name: "transportationAmount") int? transportationAmount,

    /// Kilometres actually driven, and safe to label as such (§5.2).
    ///
    /// Summed with haversine over the ride's GPS breadcrumbs: ordered by
    /// capture time, stationary jitter (<15 m) dropped, fixes worse than 100 m
    /// accuracy discarded. It under-reads true road distance by roughly 3–8%
    /// because it draws straight lines between samples — deliberately
    /// uncorrected, since no money depends on it — and it is only as good as
    /// the app's ping cadence ([LocationTrackingPolicy], §12.6).
    ///
    /// Two things this does *not* cover. It was previously a Distance-Matrix
    /// lookup from the Start point to the Stop point, which reported ≈ 0 km for
    /// any round trip that ended where it began; **rides completed before that
    /// fix were not backfilled**, so old history rows still hold the old
    /// number. And a session with fewer than two usable points still falls back
    /// to that point-to-point lookup.
    ///
    /// Arrives as a string like `"0.400000"` — a `decimal` column (§12.2).
    @JsonKey(name: "totalDistance", fromJson: _toDouble) double? totalDistance,

    /// Wall-clock hours from Start to Stop. **Reporting only** — it no longer
    /// drives pay, so never label it, or anything derived from it, as
    /// earnings. It is the ride's duration and nothing more. Also a string on
    /// the wire.
    @JsonKey(name: "totalHours", fromJson: _toDouble) double? totalHours,
  }) = _CompleteRide;

  factory CompleteRide.fromJson(Map<String, dynamic> json) =>
      _$CompleteRideFromJson(json);
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
