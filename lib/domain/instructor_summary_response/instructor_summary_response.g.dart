// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorSummaryResponseImpl _$$InstructorSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructorSummaryResponseImpl(
      availableBalance: json['available_balance'] as num?,
      withdrawn: json['withdrawn'] as num?,
      totalCompletedRides: (json['total_completed_rides'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InstructorSummaryResponseImplToJson(
        _$InstructorSummaryResponseImpl instance) =>
    <String, dynamic>{
      'available_balance': instance.availableBalance,
      'withdrawn': instance.withdrawn,
      'total_completed_rides': instance.totalCompletedRides,
    };
