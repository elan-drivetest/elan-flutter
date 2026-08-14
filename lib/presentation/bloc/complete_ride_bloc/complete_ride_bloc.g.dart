// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_ride_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompleteRideStateImpl _$$CompleteRideStateImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteRideStateImpl(
      status:
          $enumDecodeNullable(_$CompleteRideStatusEnumMap, json['status']) ??
              CompleteRideStatus.initial,
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      rides: (json['rides'] as List<dynamic>?)
          ?.map((e) => CompleteRide.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompleteRideStateImplToJson(
        _$CompleteRideStateImpl instance) =>
    <String, dynamic>{
      'status': _$CompleteRideStatusEnumMap[instance.status]!,
      'hasReachedMax': instance.hasReachedMax,
      'errorResponse': instance.errorResponse,
      'rides': instance.rides,
    };

const _$CompleteRideStatusEnumMap = {
  CompleteRideStatus.initial: 'initial',
  CompleteRideStatus.loading: 'loading',
  CompleteRideStatus.paginating: 'paginating',
  CompleteRideStatus.success: 'success',
  CompleteRideStatus.error: 'error',
};
