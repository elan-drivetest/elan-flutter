import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/pricing_config_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/pricing_config/pricing_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pricing_config_event.dart';
part 'pricing_config_state.dart';
part 'pricing_config_bloc.freezed.dart';

/// Server-owned numeric configuration, resolved once at app start.
///
/// Resolution order is **live → cached last-good → baked-in defaults**, and
/// `state.config` is non-null from construction onward. That is deliberate:
/// callers read `context.read<PricingConfigBloc>().state.config.someKey`
/// without null checks or a loading branch, and a failed fetch degrades to the
/// last known-good values rather than blanking the UI.
///
/// This never blocks a screen. The endpoint is unauthenticated, so it is safe
/// to fire before login.
@injectable
class PricingConfigBloc extends Bloc<PricingConfigEvent, PricingConfigState> {
  final PricingConfigRepository repository;

  PricingConfigBloc(this.repository) : super(const PricingConfigState()) {
    on<_FetchPricingConfig>(_onFetchPricingConfig);
  }

  Future<void> _onFetchPricingConfig(
    _FetchPricingConfig event,
    Emitter<PricingConfigState> emit,
  ) async {
    // Seed from cache first so the very first frame after a cold start shows
    // the last-known-good numbers instead of the compiled-in defaults.
    final cached = await repository.getCachedPricingConfig();
    if (cached != null) {
      emit(state.copyWith(
        status: PricingConfigStatus.loading,
        config: cached,
        isFallback: true,
      ));
    } else {
      emit(state.copyWith(status: PricingConfigStatus.loading));
    }

    final result = await repository.getPricingConfig();

    result.fold(
      (l) => emit(state.copyWith(
        status: PricingConfigStatus.error,
        errorResponse: l,
        // `config` is intentionally left as-is: cached values if we had them,
        // defaults otherwise. Never blank it on failure.
      )),
      (r) => emit(state.copyWith(
        status: PricingConfigStatus.success,
        config: r,
        isFallback: false,
        errorResponse: null,
      )),
    );
  }
}
