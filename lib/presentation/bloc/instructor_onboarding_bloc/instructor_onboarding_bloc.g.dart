// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_onboarding_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorOnboardingStateImpl _$$InstructorOnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructorOnboardingStateImpl(
      status: $enumDecodeNullable(
              _$InstructorOnboardingStatusEnumMap, json['status']) ??
          InstructorOnboardingStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      response: json['response'] == null
          ? null
          : InstructorResponse.fromJson(
              json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InstructorOnboardingStateImplToJson(
        _$InstructorOnboardingStateImpl instance) =>
    <String, dynamic>{
      'status': _$InstructorOnboardingStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'response': instance.response,
    };

const _$InstructorOnboardingStatusEnumMap = {
  InstructorOnboardingStatus.initial: 'initial',
  InstructorOnboardingStatus.loading: 'loading',
  InstructorOnboardingStatus.success: 'success',
  InstructorOnboardingStatus.error: 'error',
};
