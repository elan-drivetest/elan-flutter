part of 'instructor_onboarding_bloc.dart';


enum InstructorOnboardingStatus {
  initial,
  loading,
  success,
  error;
}

@freezed
class InstructorOnboardingState with _$InstructorOnboardingState {
  const factory InstructorOnboardingState({
    @Default(InstructorOnboardingStatus.initial) InstructorOnboardingStatus status,
    ErrorResponse ? errorResponse,
    InstructorResponse? response,
  }) = _InstructorOnboardingState;

  factory InstructorOnboardingState.fromJson(Map<String, dynamic> json) =>
      _$InstructorOnboardingStateFromJson(json);
}