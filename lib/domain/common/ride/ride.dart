import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride.freezed.dart';
part 'ride.g.dart';

@freezed
class Ride with _$Ride {
  const factory Ride({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "instructor_id") int? instructorId,
    @JsonKey(name: "test_type") String? testType,
    @JsonKey(name: "test_date") DateTime? testDate,
    @JsonKey(name: "meet_at_center") bool? meetAtCenter,
    @JsonKey(name: "pickup_address") String? pickupAddress,
    @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
    double? pickupLatitude,
    @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
    double? pickupLongitude,
    @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
    double? pickupDistance,
    @JsonKey(name: "is_rescheduled") bool? isRescheduled,
    @JsonKey(name: "timezone") String? timezone,
    @JsonKey(name: "road_test_doc_url") String? roadTestDocUrl,
    @JsonKey(name: "g1_license_doc_url") String? g1LicenseDocUrl,
    /// Exposed to instructors alongside the centre's coordinates (§14.2), so a
    /// centre can be joined by id rather than matched on its name.
    @JsonKey(name: "test_center_id") int? testCenterId,
    @JsonKey(name: "test_center_name") String? testCenterName,
    @JsonKey(name: "test_center_address") String? testCenterAddress,
    @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
    double? testCenterLatitude,
    @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
    double? testCenterLongitude,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
    double? totalRideHour,
    @JsonKey(name: "ride_price") int? ridePrice,
  }) = _Ride;

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);
}

double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
