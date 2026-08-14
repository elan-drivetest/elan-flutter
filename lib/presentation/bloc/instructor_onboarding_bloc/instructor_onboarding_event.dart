part of 'instructor_onboarding_bloc.dart';

@freezed
class InstructorOnboardingEvent with _$InstructorOnboardingEvent {
  const factory InstructorOnboardingEvent.getInfo() = _GetInfo;
  const factory InstructorOnboardingEvent.onboardVehicle({
    required Map<String, String> params,
  }) = _OnboardVehicle;
}