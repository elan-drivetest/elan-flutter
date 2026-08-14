// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_summary_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralSummaryStateImpl _$$ReferralSummaryStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralSummaryStateImpl(
      status:
          $enumDecodeNullable(_$ReferralSummaryStatusEnumMap, json['status']) ??
              ReferralSummaryStatus.initial,
      summaryResponse: json['summaryResponse'] == null
          ? null
          : ReferralCodeSummaryResponse.fromJson(
              json['summaryResponse'] as Map<String, dynamic>),
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferralSummaryStateImplToJson(
        _$ReferralSummaryStateImpl instance) =>
    <String, dynamic>{
      'status': _$ReferralSummaryStatusEnumMap[instance.status]!,
      'summaryResponse': instance.summaryResponse,
      'errorResponse': instance.errorResponse,
    };

const _$ReferralSummaryStatusEnumMap = {
  ReferralSummaryStatus.initial: 'initial',
  ReferralSummaryStatus.loading: 'loading',
  ReferralSummaryStatus.success: 'success',
  ReferralSummaryStatus.error: 'error',
  ReferralSummaryStatus.claimLoading: 'claimLoading',
  ReferralSummaryStatus.claimSuccess: 'claimSuccess',
  ReferralSummaryStatus.claimError: 'claimError',
};
