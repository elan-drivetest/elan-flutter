import 'package:freezed_annotation/freezed_annotation.dart';


part 'ride_session.freezed.dart';
part 'ride_session.g.dart';

@freezed
class RideSession with _$RideSession {
  const factory RideSession({
    required int id,
    @JsonKey(name: 'start_time') DateTime? startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'total_distance', fromJson: _toDouble)
    double? totalDistance,
    @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
    double? pickupLatitude,
    @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
    double? pickupLongitude,
    @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble) double? dropoffLatitude,
    @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble) double? dropoffLongitude,
    @JsonKey(name: 'total_hours', fromJson: _toDouble)
    double? totalHours,
    @JsonKey(name: 'hourly_rate')  int? hourlyRate,
    @JsonKey(name: 'instructor_earnings')  int? instructorEarnings,
    @JsonKey(name: 'payment_scheduled_at') DateTime? paymentScheduledAt,
    @JsonKey(name: 'payment_processed_at') DateTime? paymentProcessedAt,
  }) = _RideSession;

  factory RideSession.fromJson(Map<String, dynamic> json) =>
      _$RideSessionFromJson(json);
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}