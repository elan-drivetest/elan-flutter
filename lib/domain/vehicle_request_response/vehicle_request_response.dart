import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_request_response.freezed.dart';
part 'vehicle_request_response.g.dart';

@freezed
class VehicleRequestResponse with _$VehicleRequestResponse {
  const factory VehicleRequestResponse({
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'license_plate') String? licensePlate,
    @JsonKey(name: 'registration_doc_url') String? registrationDocUrl,
    @JsonKey(name: 'insurance_doc_url') String? insuranceDocUrl,
    @JsonKey(name: 'vehicle_image_url') String? vehicleImageUrl,
  }) = _VehicleRequestResponse;

  factory VehicleRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestResponseFromJson(json);
}
