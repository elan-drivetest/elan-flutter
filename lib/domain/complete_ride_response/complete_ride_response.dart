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

    /// Cents. **Zero until the payout cron runs**, up to
    /// `instructor_payout_delay_days` (default 7) after the ride
    /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §14.6) — so a recent completed ride
    /// legitimately reports 0 and must not be shown as "earned $0.00".
    @JsonKey(name: "instructorEarnings") int? instructorEarnings,

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

    /// Wall-clock hours from Start to Stop. This is what the instructor is
    /// actually paid on. Also a string on the wire.
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
