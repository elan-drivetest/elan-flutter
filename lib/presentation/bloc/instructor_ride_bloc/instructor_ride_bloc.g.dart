// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_ride_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorRideStateImpl _$$InstructorRideStateImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructorRideStateImpl(
      status:
          $enumDecodeNullable(_$InstructorRideStatusEnumMap, json['status']) ??
              InstructorRideStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      currentRide: json['currentRide'] == null
          ? null
          : RideSession.fromJson(json['currentRide'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InstructorRideStateImplToJson(
        _$InstructorRideStateImpl instance) =>
    <String, dynamic>{
      'status': _$InstructorRideStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'currentRide': instance.currentRide,
    };

const _$InstructorRideStatusEnumMap = {
  InstructorRideStatus.initial: 'initial',
  InstructorRideStatus.loading: 'loading',
  InstructorRideStatus.success: 'success',
  InstructorRideStatus.empty: 'empty',
  InstructorRideStatus.startSuccess: 'startSuccess',
  InstructorRideStatus.stopSuccess: 'stopSuccess',
  InstructorRideStatus.error: 'error',
};
