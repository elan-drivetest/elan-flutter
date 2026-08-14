import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/referral_code_summary_response/referral_code_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'referral_summary_event.dart';
part 'referral_summary_state.dart';
part 'referral_summary_bloc.freezed.dart';
part 'referral_summary_bloc.g.dart';

@injectable
class ReferralSummaryBloc extends Bloc<ReferralSummaryEvent, ReferralSummaryState> {
  final UserRepository repository;

  ReferralSummaryBloc(this.repository) : super(const ReferralSummaryState()) {
    on<_FetchSummary>(_onFetchSummary);
    on<_ClaimReferralCode>(_onClaimReferralCode);
  }

  Future<void> _onFetchSummary(
    _FetchSummary event,
    Emitter<ReferralSummaryState> emit,
  ) async {
    emit(state.copyWith(status: ReferralSummaryStatus.loading));

    final result = await repository.getReferralCodeSummary();

    result.fold(
      (l) => emit(state.copyWith(
          status: ReferralSummaryStatus.error, errorResponse: l)),
      (r) => emit(state.copyWith(
          status: ReferralSummaryStatus.success, summaryResponse: r)),
    );
  }

  Future<void> _onClaimReferralCode(
    _ClaimReferralCode event,
    Emitter<ReferralSummaryState> emit,
  ) async {
    emit(state.copyWith(status: ReferralSummaryStatus.claimLoading));
    final result = await repository.claimReferralCode(code: event.code);
    result.fold(
      (l) => emit(state.copyWith(
          status: ReferralSummaryStatus.claimError, errorResponse: l)),
      (r) {
        emit(state.copyWith(status: ReferralSummaryStatus.claimSuccess));
        add(const ReferralSummaryEvent.fetchSummary());
      },
    );
  }
}
