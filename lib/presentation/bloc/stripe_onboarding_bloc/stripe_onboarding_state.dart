part of 'stripe_onboarding_bloc.dart';


enum StripeOnboardingStatus {
  initial,
  initialLoading,
  loading,
  success,
  update,
  error;
}

@freezed
class StripeOnboardingState with _$StripeOnboardingState {
  const factory StripeOnboardingState({
    @Default(StripeOnboardingStatus.initial) StripeOnboardingStatus status,
    ErrorResponse ? errorResponse,
    StripeOnboardResponse? onboardResponse,
    StripeOnboardUrlResponse? onboardUrlResponse,
  }) = _StripeOnboardingState;

  factory StripeOnboardingState.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardingStateFromJson(json);
}