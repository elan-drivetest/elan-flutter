// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideSessionImpl _$$RideSessionImplFromJson(Map<String, dynamic> json) =>
    _$RideSessionImpl(
      id: (json['id'] as num).toInt(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      status: json['status'] as String?,
      totalDistance: _toDouble(json['total_distance']),
      pickupLatitude: _toDouble(json['pickup_latitude']),
      pickupLongitude: _toDouble(json['pickup_longitude']),
      dropoffLatitude: _toDouble(json['dropoff_latitude']),
      dropoffLongitude: _toDouble(json['dropoff_longitude']),
      totalHours: _toDouble(json['total_hours']),
      hourlyRate: (json['hourly_rate'] as num?)?.toInt(),
      instructorEarnings: (json['instructor_earnings'] as num?)?.toInt(),
      paymentScheduledAt: json['payment_scheduled_at'] == null
          ? null
          : DateTime.parse(json['payment_scheduled_at'] as String),
      paymentProcessedAt: json['payment_processed_at'] == null
          ? null
          : DateTime.parse(json['payment_processed_at'] as String),
    );

Map<String, dynamic> _$$RideSessionImplToJson(_$RideSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'total_distance': instance.totalDistance,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'dropoff_latitude': instance.dropoffLatitude,
      'dropoff_longitude': instance.dropoffLongitude,
      'total_hours': instance.totalHours,
      'hourly_rate': instance.hourlyRate,
      'instructor_earnings': instance.instructorEarnings,
      'payment_scheduled_at': instance.paymentScheduledAt?.toIso8601String(),
      'payment_processed_at': instance.paymentProcessedAt?.toIso8601String(),
    };
