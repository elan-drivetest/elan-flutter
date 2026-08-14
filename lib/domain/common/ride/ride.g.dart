// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideImpl _$$RideImplFromJson(Map<String, dynamic> json) => _$RideImpl(
      id: (json['id'] as num?)?.toInt(),
      instructorId: (json['instructor_id'] as num?)?.toInt(),
      testType: json['test_type'] as String?,
      testDate: json['test_date'] == null
          ? null
          : DateTime.parse(json['test_date'] as String),
      meetAtCenter: json['meet_at_center'] as bool?,
      pickupAddress: json['pickup_address'] as String?,
      pickupLatitude: _parseDouble(json['pickup_latitude']),
      pickupLongitude: _parseDouble(json['pickup_longitude']),
      pickupDistance: _parseDouble(json['pickup_distance']),
      isRescheduled: json['is_rescheduled'] as bool?,
      timezone: json['timezone'] as String?,
      roadTestDocUrl: json['road_test_doc_url'] as String?,
      g1LicenseDocUrl: json['g1_license_doc_url'] as String?,
      testCenterName: json['test_center_name'] as String?,
      testCenterAddress: json['test_center_address'] as String?,
      testCenterLatitude: _parseDouble(json['test_center_latitude']),
      testCenterLongitude: _parseDouble(json['test_center_longitude']),
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      totalRideHour: _parseDouble(json['total_ride_hour']),
      ridePrice: (json['ride_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RideImplToJson(_$RideImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor_id': instance.instructorId,
      'test_type': instance.testType,
      'test_date': instance.testDate?.toIso8601String(),
      'meet_at_center': instance.meetAtCenter,
      'pickup_address': instance.pickupAddress,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'pickup_distance': instance.pickupDistance,
      'is_rescheduled': instance.isRescheduled,
      'timezone': instance.timezone,
      'road_test_doc_url': instance.roadTestDocUrl,
      'g1_license_doc_url': instance.g1LicenseDocUrl,
      'test_center_name': instance.testCenterName,
      'test_center_address': instance.testCenterAddress,
      'test_center_latitude': instance.testCenterLatitude,
      'test_center_longitude': instance.testCenterLongitude,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'total_ride_hour': instance.totalRideHour,
      'ride_price': instance.ridePrice,
    };
