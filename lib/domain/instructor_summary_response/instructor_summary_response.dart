import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_summary_response.freezed.dart';
part 'instructor_summary_response.g.dart';

@freezed
class InstructorSummaryResponse with _$InstructorSummaryResponse {
  const factory InstructorSummaryResponse({
    @JsonKey(name: "available_balance") num? availableBalance,
    @JsonKey(name: "withdrawn") num? withdrawn,
    @JsonKey(name: "total_completed_rides") int? totalCompletedRides,
  }) = _InstructorSummaryResponse;

  factory InstructorSummaryResponse.fromJson(Map<String, dynamic> json) => _$InstructorSummaryResponseFromJson(json);
}
