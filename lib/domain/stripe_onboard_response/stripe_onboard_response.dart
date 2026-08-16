import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'stripe_onboard_response.freezed.dart';
part 'stripe_onboard_response.g.dart';

@freezed
class StripeOnboardResponse with _$StripeOnboardResponse {
  const factory StripeOnboardResponse({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "charges_enabled") bool? chargesEnabled,
    @JsonKey(name: "payouts_enabled") bool? payoutsEnabled,
  }) = _StripeOnboardResponse;

  factory StripeOnboardResponse.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardResponseFromJson(json);
}
