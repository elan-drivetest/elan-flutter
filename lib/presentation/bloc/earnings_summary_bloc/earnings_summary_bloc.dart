import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/common/earnings/earnings_summary.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'earnings_summary_event.dart';
part 'earnings_summary_state.dart';
part 'earnings_summary_bloc.freezed.dart';

@injectable
class EarningsSummaryBloc
    extends Bloc<EarningsSummaryEvent, EarningsSummaryState> {
  final UserRepository repository;

  EarningsSummaryBloc(this.repository)
      : super(const EarningsSummaryState()) {
    on<_GetEarningsSummary>(_onGetEarningsSummary);
  }

  Future<void> _onGetEarningsSummary(
    _GetEarningsSummary event,
    Emitter<EarningsSummaryState> emit,
  ) async {
    emit(state.copyWith(status: EarningsSummaryStatus.loading));

    final result = await repository.getEarningsSummary();

    result.fold(
      (l) => emit(
        state.copyWith(
          status: EarningsSummaryStatus.error,
          errorResponse: l,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: EarningsSummaryStatus.success,
          earningsSummary: r,
        ),
      ),
    );
  }
}
