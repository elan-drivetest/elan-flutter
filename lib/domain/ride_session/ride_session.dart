import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_session.freezed.dart';
part 'ride_session.g.dart';

@freezed
class RideSession with _$RideSession {
  const factory RideSession({
    required int id,

    /// The booking this session is for.
    ///
    /// Now returned on every RideSession response
    /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §8.2). It used to be stripped, which
    /// is why the app had to cache the `ride_session_id → booking_id` link
    /// itself: `/rides/start` and `/rides/transfer` take a booking id while
    /// `/rides/stop` takes a session id, and nothing joined them.
    ///
    /// `instructor_id` is still stripped — the instructor already knows who
    /// they are.
    @JsonKey(name: 'booking_id') int? bookingId,
    @JsonKey(name: 'start_time') DateTime? startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    @JsonKey(name: 'status') String? status,
    /// Kilometres — but it means **two different things** depending on status
    /// (§5.2), so do not label it without checking which.
    ///
    /// * While the ride is `scheduled` or `in_progress`: the accept-time
    ///   estimate, `2 × pickup_distance` (0 for meet-at-centre). It is not
    ///   updated as the instructor drives.
    /// * Once stopped: the real driven distance, summed from the GPS
    ///   breadcrumbs this app uploaded.
    @JsonKey(name: 'total_distance', fromJson: _toDouble) double? totalDistance,
    @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
    double? pickupLatitude,
    @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
    double? pickupLongitude,
    @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
    double? dropoffLatitude,
    @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
    double? dropoffLongitude,
    @JsonKey(name: 'total_hours', fromJson: _toDouble) double? totalHours,
    @JsonKey(name: 'hourly_rate') int? hourlyRate,
    @JsonKey(name: 'instructor_earnings') int? instructorEarnings,
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
