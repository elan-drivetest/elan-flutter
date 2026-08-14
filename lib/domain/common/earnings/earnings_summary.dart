import 'package:freezed_annotation/freezed_annotation.dart';

part 'earnings_summary.freezed.dart';
part 'earnings_summary.g.dart';

@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    @JsonKey(name: "available_balance")
    int? availableBalance,
    @JsonKey(name: "withdrawn")
    int? withdrawn,
    @JsonKey(name: "total_completed_rides")
    int? totalCompletedRides,
    @JsonKey(name: "hourly_rate")
    int? hourlyRate,
  }) = _EarningsSummary;

  factory EarningsSummary.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryFromJson(json);
}
