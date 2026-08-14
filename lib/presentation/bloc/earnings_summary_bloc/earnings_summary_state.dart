part of 'earnings_summary_bloc.dart';

enum EarningsSummaryStatus { initial, loading, success, error }

@freezed
class EarningsSummaryState with _$EarningsSummaryState {
  const factory EarningsSummaryState({
    @Default(EarningsSummaryStatus.initial) EarningsSummaryStatus status,
    ErrorResponse? errorResponse,
    EarningsSummary? earningsSummary,
  }) = _EarningsSummaryState;
}
