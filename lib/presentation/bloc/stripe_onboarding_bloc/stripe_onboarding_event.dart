part of 'stripe_onboarding_bloc.dart';

@freezed
class StripeOnboardingEvent with _$StripeOnboardingEvent {
  const factory StripeOnboardingEvent.getInfo() = _GetInfo;
  const factory StripeOnboardingEvent.onboardStripe() = _OnboardStripe;
}