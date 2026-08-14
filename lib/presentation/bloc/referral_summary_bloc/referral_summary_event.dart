part of 'referral_summary_bloc.dart';

@freezed
class ReferralSummaryEvent with _$ReferralSummaryEvent {
  const factory ReferralSummaryEvent.fetchSummary() = _FetchSummary;
  const factory ReferralSummaryEvent.claimReferralCode({required String code}) = _ClaimReferralCode;
}
