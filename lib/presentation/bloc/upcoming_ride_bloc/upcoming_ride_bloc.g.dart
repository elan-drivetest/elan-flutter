// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_ride_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpcomingRideStateImpl _$$UpcomingRideStateImplFromJson(
        Map<String, dynamic> json) =>
    _$UpcomingRideStateImpl(
      status:
          $enumDecodeNullable(_$UpcomingRideStatusEnumMap, json['status']) ??
              UpcomingRideStatus.initial,
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      rides: (json['rides'] as List<dynamic>?)
          ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UpcomingRideStateImplToJson(
        _$UpcomingRideStateImpl instance) =>
    <String, dynamic>{
      'status': _$UpcomingRideStatusEnumMap[instance.status]!,
      'hasReachedMax': instance.hasReachedMax,
      'errorResponse': instance.errorResponse,
      'rides': instance.rides,
    };

const _$UpcomingRideStatusEnumMap = {
  UpcomingRideStatus.initial: 'initial',
  UpcomingRideStatus.loading: 'loading',
  UpcomingRideStatus.actionLoading: 'actionLoading',
  UpcomingRideStatus.success: 'success',
  UpcomingRideStatus.update: 'update',
  UpcomingRideStatus.empty: 'empty',
  UpcomingRideStatus.error: 'error',
};
