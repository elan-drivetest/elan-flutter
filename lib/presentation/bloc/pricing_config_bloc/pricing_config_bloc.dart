import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/public_repository.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:elan/domain/pricing_config_response/pricing_config_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pricing_config_event.dart';
part 'pricing_config_state.dart';
part 'pricing_config_bloc.freezed.dart';
part 'pricing_config_bloc.g.dart';

@lazySingleton
class PricingConfigBloc extends Bloc<PricingConfigEvent, PricingConfigState> {
  final PublicRepository repository;

  PricingConfigBloc(this.repository) : super(const PricingConfigState()) {
    on<_FetchPricingConfig>(_onFetchPricingConfig);
  }

  Future<void> _onFetchPricingConfig(
    _FetchPricingConfig event,
    Emitter<PricingConfigState> emit,
  ) async {
    // in-memory cache: skip network if already loaded
    if (!event.forceRefresh &&
        state.status == PricingConfigStatus.success &&
        state.config != null) {
      return;
    }

    if (state.status == PricingConfigStatus.loading) return;

    emit(state.copyWith(status: PricingConfigStatus.loading));

    final result = await repository.getPricingConfig();

    result.fold(
      (l) => emit(state.copyWith(
        status: PricingConfigStatus.error,
        errorResponse: l,
      )),
      (r) => emit(state.copyWith(
        status: PricingConfigStatus.success,
        config: r,
        errorResponse: null,
      )),
    );
  }
}
