// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferResponseImpl _$$TransferResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      transferReason: json['transfer_reason'] as String?,
    );

Map<String, dynamic> _$$TransferResponseImplToJson(
        _$TransferResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transfer_reason': instance.transferReason,
    };
