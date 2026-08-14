part of 'referral_summary_bloc.dart';

enum ReferralSummaryStatus { initial, loading, success, error, claimLoading, claimSuccess, claimError }

@freezed
class ReferralSummaryState with _$ReferralSummaryState {
  const factory ReferralSummaryState({
    @Default(ReferralSummaryStatus.initial) ReferralSummaryStatus status,
    ReferralCodeSummaryResponse? summaryResponse,
    ErrorResponse? errorResponse,
  }) = _ReferralSummaryState;

  factory ReferralSummaryState.fromJson(Map<String, dynamic> json) =>
      _$ReferralSummaryStateFromJson(json);
}
