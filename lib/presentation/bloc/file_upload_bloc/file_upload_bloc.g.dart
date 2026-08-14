// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadStateImpl _$$FileUploadStateImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadStateImpl(
      status: $enumDecodeNullable(_$FileUploadStatusEnumMap, json['status']) ??
          FileUploadStatus.initial,
      errorResponse: json['errorResponse'] == null
          ? null
          : ErrorResponse.fromJson(
              json['errorResponse'] as Map<String, dynamic>),
      response: json['response'] == null
          ? null
          : FileResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FileUploadStateImplToJson(
        _$FileUploadStateImpl instance) =>
    <String, dynamic>{
      'status': _$FileUploadStatusEnumMap[instance.status]!,
      'errorResponse': instance.errorResponse,
      'response': instance.response,
    };

const _$FileUploadStatusEnumMap = {
  FileUploadStatus.initial: 'initial',
  FileUploadStatus.loading: 'loading',
  FileUploadStatus.success: 'success',
  FileUploadStatus.error: 'error',
};
