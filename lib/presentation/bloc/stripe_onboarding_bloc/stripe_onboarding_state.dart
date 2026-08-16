part of 'stripe_onboarding_bloc.dart';


enum StripeOnboardingStatus {
  initial,

  /// `getInfo` in flight.
  initialLoading,

  /// `onboardStripe` in flight.
  loading,

  /// `getInfo` returned — read [StripeOnboardingState.payoutReadiness].
  success,

  /// `onboardStripe` returned a URL; the verify page should be pushed.
  update,

  /// `onboardStripe` failed.
  error,

  /// `getInfo` failed.
  ///
  /// Separate from [error] because the two flows share this enum and the
  /// dashboard shows *"Failed to initiate bank onboarding"* on [error]. A
  /// status check runs unprompted on dashboard load, and it 400s for anyone
  /// who has not connected Stripe — which used to pop that snackbar at app
  /// start, blaming a button nobody pressed.
  infoError;
}

@freezed
class StripeOnboardingState with _$StripeOnboardingState {
  const factory StripeOnboardingState({
    @Default(StripeOnboardingStatus.initial) StripeOnboardingStatus status,
    ErrorResponse ? errorResponse,
    StripeOnboardResponse? onboardResponse,
    StripeOnboardUrlResponse? onboardUrlResponse,

    /// Whether the instructor may accept work, derived from the last
    /// `getInfo`.
    ///
    /// Carried separately from [status] because this bloc serves two unrelated
    /// flows through one status field: checking payout readiness, and fetching
    /// an onboarding URL to push the verify page with. A caller that gated on
    /// `status == error` could not tell "not onboarded" from "the URL request
    /// failed", and `StripeOnboardingBloc` is app-scoped, so both flows are
    /// live at once behind the shell's IndexedStack.
    @Default(PayoutReadiness.unknown) PayoutReadiness payoutReadiness,
  }) = _StripeOnboardingState;

  factory StripeOnboardingState.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardingStateFromJson(json);
}