import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_response.freezed.dart';
part 'accept_response.g.dart';

/// The RideSession returned by `POST /v1/rides/accept`.
///
/// This is the **same server object** as [RideSession], so it is typed the same
/// way. It previously declared the coordinates as `dynamic` and the decimals as
/// `String?`, which meant two models of one object disagreed about their own
/// fields and neither could be used for arithmetic without re-parsing.
///
/// Every `decimal` column arrives as a **string** (`"5.200000"`) because the
/// backend's mappers cast rather than convert — see
/// `INSTRUCTOR_APP_RIDE_JOURNEY.md` §12.2. `_toDouble` accepts either form, so
/// it is correct whether or not that ever changes.
///
/// `hourly_rate` and `instructor_earnings` are genuine integers (cents), not
/// decimals, so they are left as `int?`.
///
/// `booking_id` is now returned on every RideSession response (§8.2, §14.4
/// fixed); `instructor_id` remains stripped.
@freezed
class AcceptResponse with _$AcceptResponse {
  const factory AcceptResponse({
    @JsonKey(name: "id") int? id,

    /// Now returned (§8.2) — the app no longer has to remember this itself.
    @JsonKey(name: "booking_id") int? bookingId,
    @JsonKey(name: "start_time") DateTime? startTime,
    @JsonKey(name: "end_time") DateTime? endTime,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "total_distance", fromJson: _toDouble) double? totalDistance,
    @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
    double? pickupLatitude,
    @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
    double? pickupLongitude,
    @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
    double? dropoffLatitude,
    @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
    double? dropoffLongitude,
    @JsonKey(name: "total_hours", fromJson: _toDouble) double? totalHours,
    @JsonKey(name: "hourly_rate") int? hourlyRate,
    @JsonKey(name: "instructor_earnings") int? instructorEarnings,
    @JsonKey(name: "payment_scheduled_at") DateTime? paymentScheduledAt,
    @JsonKey(name: "payment_processed_at") DateTime? paymentProcessedAt,
  }) = _AcceptResponse;

  factory AcceptResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptResponseFromJson(json);
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
