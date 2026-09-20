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

    /// **Deprecated.** Now just mirrors [transportationHours] server-side, and
    /// will be dropped from the API once the pre-v2 builds are off the field.
    /// Nothing should read it — use [transportationHours].
    @Deprecated('Mirrors transportationHours; being removed from the API.')
    @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
    double? totalRideHour,

    // ── Instructor pay v2 (`GET /v1/rides/available` only) ──
    //
    // Pay is `(instructor_rate x 3) + round(transportation_hours x
    // instructor_rate)`, computed once and frozen onto the ride the moment the
    // instructor accepts. It is no longer an estimate, and the wall clock no
    // longer moves it. Never reproduce the formula here — read the fields.

    /// Cents. What the instructor **will be paid** for this job, base plus
    /// transportation. Formerly a distance-derived estimate that the payout
    /// then disagreed with; now the number that actually settles.
    @JsonKey(name: "ride_price") int? ridePrice,

    /// Cents. The flat road-test portion, `instructor_rate x 3` (e.g. 12000).
    /// Paid on every ride, meet-at-centre included. Absent on pre-v2
    /// responses, which is why the breakdown UI guards on `> 0`.
    @JsonKey(name: "base_amount") int? baseAmount,

    /// Paid driving hours: pickup → centre → back to pickup. `0` for
    /// meet-at-centre, where there is no pickup leg at all.
    ///
    /// The instructor's own commute to the pickup address is deliberately not
    /// in here — it would make the same job worth a different amount to every
    /// instructor looking at the board.
    @JsonKey(name: "transportation_hours", fromJson: _parseDouble)
    double? transportationHours,

    /// Cents per hour of transportation — the single pay lever
    /// (`instructor_rate`). Not a rate for the road test, which is flat.
    @JsonKey(name: "hourly_rate") int? hourlyRate,

    /// Cents. `round(transportation_hours x hourly_rate)`.
    @JsonKey(name: "transportation_amount") int? transportationAmount,

    /// Seconds. One-way drive time pickup → centre, from Google, stored on the
    /// booking. Doubled server-side to get [transportationHours]. Null on
    /// bookings taken before v2, which fall back to a distance/speed estimate.
    @JsonKey(name: "pickup_duration") int? pickupDuration,
  }) = _Ride;

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);
}

double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
