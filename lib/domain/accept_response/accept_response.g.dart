// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcceptResponseImpl _$$AcceptResponseImplFromJson(Map<String, dynamic> json) =>
    _$AcceptResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'],
      status: json['status'] as String?,
      totalDistance: json['total_distance'] as String?,
      pickupLatitude: json['pickup_latitude'],
      pickupLongitude: json['pickup_longitude'],
      dropoffLatitude: json['dropoff_latitude'],
      dropoffLongitude: json['dropoff_longitude'],
      totalHours: json['total_hours'] as String?,
      hourlyRate: (json['hourly_rate'] as num?)?.toInt(),
      instructorEarnings: (json['instructor_earnings'] as num?)?.toInt(),
      paymentScheduledAt: json['payment_scheduled_at'],
      paymentProcessedAt: json['payment_processed_at'],
    );

Map<String, dynamic> _$$AcceptResponseImplToJson(
        _$AcceptResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime,
      'status': instance.status,
      'total_distance': instance.totalDistance,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'dropoff_latitude': instance.dropoffLatitude,
      'dropoff_longitude': instance.dropoffLongitude,
      'total_hours': instance.totalHours,
      'hourly_rate': instance.hourlyRate,
      'instructor_earnings': instance.instructorEarnings,
      'payment_scheduled_at': instance.paymentScheduledAt,
      'payment_processed_at': instance.paymentProcessedAt,
    };
