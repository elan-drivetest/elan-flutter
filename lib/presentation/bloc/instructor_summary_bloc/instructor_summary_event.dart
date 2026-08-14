part of 'instructor_summary_bloc.dart';

@freezed
class InstructorSummaryEvent with _$InstructorSummaryEvent {
  const factory InstructorSummaryEvent.getSummary() = _GetSummary;
}
