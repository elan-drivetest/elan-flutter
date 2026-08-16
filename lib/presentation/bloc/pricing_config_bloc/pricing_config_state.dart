part of 'pricing_config_bloc.dart';

enum PricingConfigStatus { initial, loading, success, error }

@freezed
class PricingConfigState with _$PricingConfigState {
  const factory PricingConfigState({
    @Default(PricingConfigStatus.initial) PricingConfigStatus status,
    ErrorResponse? errorResponse,

    /// Always populated — defaults before the first fetch, cached values after a
    /// cold start, live values once the fetch lands. Never null, so no call site
    /// needs a null check or a loading branch.
    @Default(PricingConfig()) PricingConfig config,

    /// True while [config] is compiled-in defaults or a cached copy rather than
    /// a fresh server response. Use it to decide whether to show a stale-data
    /// hint — not to gate rendering.
    @Default(true) bool isFallback,
  }) = _PricingConfigState;
}
