// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterErrorResponseImpl _$$RegisterErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterErrorResponseImpl(
      statusCode: (json['status_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegisterErrorResponseImplToJson(
        _$RegisterErrorResponseImpl instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'errors': instance.errors,
    };

_$ErrorsImpl _$$ErrorsImplFromJson(Map<String, dynamic> json) => _$ErrorsImpl(
      fullName: const StringListConverter().fromJson(json['full_name']),
      email: const StringListConverter().fromJson(json['email']),
      password: const StringListConverter().fromJson(json['password']),
      phoneNumber: const StringListConverter().fromJson(json['phone_number']),
      address: const StringListConverter().fromJson(json['address']),
    );

Map<String, dynamic> _$$ErrorsImplToJson(_$ErrorsImpl instance) =>
    <String, dynamic>{
      'full_name': const StringListConverter().toJson(instance.fullName),
      'email': const StringListConverter().toJson(instance.email),
      'password': const StringListConverter().toJson(instance.password),
      'phone_number': const StringListConverter().toJson(instance.phoneNumber),
      'address': const StringListConverter().toJson(instance.address),
    };
