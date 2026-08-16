part of 'pricing_config_bloc.dart';

@freezed
class PricingConfigEvent with _$PricingConfigEvent {
  const factory PricingConfigEvent.fetch() = _FetchPricingConfig;
}
