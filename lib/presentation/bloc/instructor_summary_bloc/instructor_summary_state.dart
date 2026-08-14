part of 'instructor_summary_bloc.dart';

enum InstructorSummaryStatus { initial, loading, success, error }

@freezed
class InstructorSummaryState with _$InstructorSummaryState {
  const factory InstructorSummaryState({
    @Default(InstructorSummaryStatus.initial) InstructorSummaryStatus status,
    ErrorResponse? errorResponse,
    InstructorSummaryResponse? summaryInfo,
  }) = _InstructorSummaryState;
}
