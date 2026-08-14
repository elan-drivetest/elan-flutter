// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_ride_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableRideStateImpl _$$AvailableRideStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableRideStateImpl(
      status:
          $enumDecodeNullable(_$AvailableRideStatusEnumMap, json['status']) ??
              AvailableRideStatus.initial,
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      rides: (json['rides'] as List<dynamic>?)
          ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AvailableRideStateImplToJson(
        _$AvailableRideStateImpl instance) =>
    <String, dynamic>{
      'status': _$AvailableRideStatusEnumMap[instance.status]!,
      'hasReachedMax': instance.hasReachedMax,
      'errorResponse': instance.errorResponse,
      'rides': instance.rides,
    };

const _$AvailableRideStatusEnumMap = {
  AvailableRideStatus.initial: 'initial',
  AvailableRideStatus.loading: 'loading',
  AvailableRideStatus.paginating: 'paginating',
  AvailableRideStatus.success: 'success',
  AvailableRideStatus.error: 'error',
};
