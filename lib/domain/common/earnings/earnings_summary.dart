import 'package:freezed_annotation/freezed_annotation.dart';

part 'earnings_summary.freezed.dart';
part 'earnings_summary.g.dart';

@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    @JsonKey(name: "available_balance") int? availableBalance,
    @JsonKey(name: "withdrawn") int? withdrawn,
    @JsonKey(name: "total_completed_rides") int? totalCompletedRides,
    /// The **current global setting**, not any ride's rate (§8.10).
    ///
    /// An instructor holding a job accepted last week sees the new rate here
    /// but is paid the snapshot on that job's session. Only ever display this
    /// as "current rate"; per-ride figures come from `RideSession.hourly_rate`.
    /// Deliberately unused today — nothing shows a rate that is not a ride's.
    @JsonKey(name: "hourly_rate") int? hourlyRate,
  }) = _EarningsSummary;

  factory EarningsSummary.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryFromJson(json);
}
