part of 'pricing_config_bloc.dart';

enum PricingConfigStatus { initial, loading, success, error }

@freezed
class PricingConfigState with _$PricingConfigState {
  const factory PricingConfigState({
    @Default(PricingConfigStatus.initial) PricingConfigStatus status,
    PricingConfigResponse? config,
    LoginErrorResponse? errorResponse,
  }) = _PricingConfigState;

  factory PricingConfigState.fromJson(Map<String, dynamic> json) =>
      _$PricingConfigStateFromJson(json);
}
