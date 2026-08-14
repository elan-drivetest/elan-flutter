// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_info_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorInfoStateImpl _$$InstructorInfoStateImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructorInfoStateImpl(
      status:
          $enumDecodeNullable(_$InstructorInfoStatusEnumMap, json['status']) ??
              InstructorInfoStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      instructorInfo: json['instructorInfo'] == null
          ? null
          : Instructor.fromJson(json['instructorInfo'] as Map<String, dynamic>),
      vehicleInfo: json['vehicleInfo'] == null
          ? null
          : Vehicle.fromJson(json['vehicleInfo'] as Map<String, dynamic>),
      userInfo: json['userInfo'] == null
          ? null
          : User.fromJson(json['userInfo'] as Map<String, dynamic>),
      profileCompletePercentage:
          (json['profileCompletePercentage'] as num?)?.toInt() ?? 0,
      licenseStatus: $enumDecodeNullable(
              _$LicenseInfoStatusEnumMap, json['licenseStatus']) ??
          LicenseInfoStatus.incomplete,
      paymentStatus: $enumDecodeNullable(
              _$PaymentInfoStatusEnumMap, json['paymentStatus']) ??
          PaymentInfoStatus.incomplete,
      vehicleStatus:
          $enumDecodeNullable(_$CarInfoStatusEnumMap, json['vehicleStatus']) ??
              CarInfoStatus.incomplete,
    );

Map<String, dynamic> _$$InstructorInfoStateImplToJson(
        _$InstructorInfoStateImpl instance) =>
    <String, dynamic>{
      'status': _$InstructorInfoStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'instructorInfo': instance.instructorInfo,
      'vehicleInfo': instance.vehicleInfo,
      'userInfo': instance.userInfo,
      'profileCompletePercentage': instance.profileCompletePercentage,
      'licenseStatus': _$LicenseInfoStatusEnumMap[instance.licenseStatus]!,
      'paymentStatus': _$PaymentInfoStatusEnumMap[instance.paymentStatus]!,
      'vehicleStatus': _$CarInfoStatusEnumMap[instance.vehicleStatus]!,
    };

const _$InstructorInfoStatusEnumMap = {
  InstructorInfoStatus.initial: 'initial',
  InstructorInfoStatus.loading: 'loading',
  InstructorInfoStatus.actionLoading: 'actionLoading',
  InstructorInfoStatus.success: 'success',
  InstructorInfoStatus.updateSuccess: 'updateSuccess',
  InstructorInfoStatus.error: 'error',
};

const _$LicenseInfoStatusEnumMap = {
  LicenseInfoStatus.complete: 'complete',
  LicenseInfoStatus.incomplete: 'incomplete',
};

const _$PaymentInfoStatusEnumMap = {
  PaymentInfoStatus.complete: 'complete',
  PaymentInfoStatus.incomplete: 'incomplete',
};

const _$CarInfoStatusEnumMap = {
  CarInfoStatus.complete: 'complete',
  CarInfoStatus.incomplete: 'incomplete',
};
