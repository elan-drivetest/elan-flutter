import 'package:elan/domain/common/meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_ride_response.freezed.dart';
part 'complete_ride_response.g.dart';

@freezed
class CompleteRideResponse with _$CompleteRideResponse {
  const factory CompleteRideResponse({
    @JsonKey(name: "data")
    List<CompleteRide>? data,
    @JsonKey(name: "meta")
    Meta? meta,
  }) = _CompleteRideResponse;

  factory CompleteRideResponse.fromJson(Map<String, dynamic> json) => _$CompleteRideResponseFromJson(json);
}

@freezed
class CompleteRide with _$CompleteRide {
  const factory CompleteRide({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "customerName")
    String? customerName,
    @JsonKey(name: "testCenterName")
    String? testCenterName,
    @JsonKey(name: "pickupLocation")
    String? pickupLocation,
    @JsonKey(name: "dropoffLocation")
    String? dropoffLocation,
    @JsonKey(name: "dateTime")
    DateTime? dateTime,
    @JsonKey(name: "testType")
    String? testType,
    @JsonKey(name: "instructorEarnings")
    int? instructorEarnings,
    @JsonKey(name: "totalDistance")
    String? totalDistance,
    @JsonKey(name: "totalHours")
    String? totalHours,
  }) = _CompleteRide;

  factory CompleteRide.fromJson(Map<String, dynamic> json) => _$CompleteRideFromJson(json);
}
