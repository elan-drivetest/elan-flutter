// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompleteRideResponseImpl _$$CompleteRideResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteRideResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CompleteRide.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompleteRideResponseImplToJson(
        _$CompleteRideResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$CompleteRideImpl _$$CompleteRideImplFromJson(Map<String, dynamic> json) =>
    _$CompleteRideImpl(
      id: (json['id'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      testCenterName: json['testCenterName'] as String?,
      pickupLocation: json['pickupLocation'] as String?,
      dropoffLocation: json['dropoffLocation'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      testType: json['testType'] as String?,
      instructorEarnings: (json['instructorEarnings'] as num?)?.toInt(),
      totalDistance: json['totalDistance'] as String?,
      totalHours: json['totalHours'] as String?,
    );

Map<String, dynamic> _$$CompleteRideImplToJson(_$CompleteRideImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerName': instance.customerName,
      'testCenterName': instance.testCenterName,
      'pickupLocation': instance.pickupLocation,
      'dropoffLocation': instance.dropoffLocation,
      'dateTime': instance.dateTime?.toIso8601String(),
      'testType': instance.testType,
      'instructorEarnings': instance.instructorEarnings,
      'totalDistance': instance.totalDistance,
      'totalHours': instance.totalHours,
    };
