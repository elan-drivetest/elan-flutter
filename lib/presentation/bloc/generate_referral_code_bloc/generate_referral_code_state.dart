part of 'generate_referral_code_bloc.dart';

enum GenerateReferralCodeStatus {
  initial,
  loading,
  actionLoading,
  /// Loading more pages while existing items are already displayed.
  paginating,
  success,
  generateSuccess,
  error,
  generateError;
}

@freezed
class GenerateReferralCodeState with _$GenerateReferralCodeState {
  const factory GenerateReferralCodeState({
    @Default(GenerateReferralCodeStatus.initial) GenerateReferralCodeStatus status,
    @Default(false) bool hasReachedMax,
    ErrorResponse? errorResponse,
    List<ReferralCode>? data,
  }) = _GenerateReferralCodeState;

  factory GenerateReferralCodeState.fromJson(Map<String, dynamic> json) =>
      _$GenerateReferralCodeStateFromJson(json);
}