part of 'pricing_config_bloc.dart';

@freezed
class PricingConfigEvent with _$PricingConfigEvent {
  const factory PricingConfigEvent.fetchPricingConfig({
    @Default(false) bool forceRefresh,
  }) = _FetchPricingConfig;
}
