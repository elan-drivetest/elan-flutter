import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_onboard_url_response.freezed.dart';
part 'stripe_onboard_url_response.g.dart';

@freezed
class StripeOnboardUrlResponse with _$StripeOnboardUrlResponse {
  const factory StripeOnboardUrlResponse({
    @JsonKey(name: "onboarding_url")
    String? onboardingUrl,
    @JsonKey(name: "stripe_account_id")
    String? stripeAccountId,
  }) = _StripeOnboardUrlResponse;

  factory StripeOnboardUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardUrlResponseFromJson(json);
}
