import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_response.freezed.dart';
part 'accept_response.g.dart';

@freezed
class AcceptResponse with _$AcceptResponse {
  const factory AcceptResponse({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "start_time")
    DateTime? startTime,
    @JsonKey(name: "end_time")
    dynamic endTime,
    @JsonKey(name: "status")
    String? status,
    @JsonKey(name: "total_distance")
    String? totalDistance,
    @JsonKey(name: "pickup_latitude")
    dynamic pickupLatitude,
    @JsonKey(name: "pickup_longitude")
    dynamic pickupLongitude,
    @JsonKey(name: "dropoff_latitude")
    dynamic dropoffLatitude,
    @JsonKey(name: "dropoff_longitude")
    dynamic dropoffLongitude,
    @JsonKey(name: "total_hours")
    String? totalHours,
    @JsonKey(name: "hourly_rate")
    int? hourlyRate,
    @JsonKey(name: "instructor_earnings")
    int? instructorEarnings,
    @JsonKey(name: "payment_scheduled_at")
    dynamic paymentScheduledAt,
    @JsonKey(name: "payment_processed_at")
    dynamic paymentProcessedAt,
  }) = _AcceptResponse;

  factory AcceptResponse.fromJson(Map<String, dynamic> json) => _$AcceptResponseFromJson(json);
}
