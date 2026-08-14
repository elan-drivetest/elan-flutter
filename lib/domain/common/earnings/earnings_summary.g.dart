// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EarningsSummaryImpl _$$EarningsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$EarningsSummaryImpl(
      availableBalance: (json['available_balance'] as num?)?.toInt(),
      withdrawn: (json['withdrawn'] as num?)?.toInt(),
      totalCompletedRides: (json['total_completed_rides'] as num?)?.toInt(),
      hourlyRate: (json['hourly_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EarningsSummaryImplToJson(
        _$EarningsSummaryImpl instance) =>
    <String, dynamic>{
      'available_balance': instance.availableBalance,
      'withdrawn': instance.withdrawn,
      'total_completed_rides': instance.totalCompletedRides,
      'hourly_rate': instance.hourlyRate,
    };
