// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleRequestResponseImpl _$$VehicleRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleRequestResponseImpl(
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: (json['year'] as num?)?.toInt(),
      color: json['color'] as String?,
      licensePlate: json['license_plate'] as String?,
      registrationDocUrl: json['registration_doc_url'] as String?,
      insuranceDocUrl: json['insurance_doc_url'] as String?,
      vehicleImageUrl: json['vehicle_image_url'] as String?,
    );

Map<String, dynamic> _$$VehicleRequestResponseImplToJson(
        _$VehicleRequestResponseImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'license_plate': instance.licensePlate,
      'registration_doc_url': instance.registrationDocUrl,
      'insurance_doc_url': instance.insuranceDocUrl,
      'vehicle_image_url': instance.vehicleImageUrl,
    };
