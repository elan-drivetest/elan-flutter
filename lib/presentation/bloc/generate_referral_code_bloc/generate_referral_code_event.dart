part of 'generate_referral_code_bloc.dart';

@freezed
class GenerateReferralCodeEvent with _$GenerateReferralCodeEvent {
  const factory GenerateReferralCodeEvent.getReferralCodes() = _GetReferralCodes;
  const factory GenerateReferralCodeEvent.refreshData() = _RefreshData;
  const factory GenerateReferralCodeEvent.generateReferralCode({required int amount}) = _GenerateReferralCode;

}