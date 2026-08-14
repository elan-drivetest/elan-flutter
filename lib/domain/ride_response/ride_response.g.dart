// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideResponseImpl _$$RideResponseImplFromJson(Map<String, dynamic> json) =>
    _$RideResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RideResponseImplToJson(_$RideResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
