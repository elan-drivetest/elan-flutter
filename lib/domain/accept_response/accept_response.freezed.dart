// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AcceptResponse _$AcceptResponseFromJson(Map<String, dynamic> json) {
  return _AcceptResponse.fromJson(json);
}

/// @nodoc
mixin _$AcceptResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;

  /// Now returned (§8.2) — the app no longer has to remember this itself.
  @JsonKey(name: "booking_id")
  int? get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "total_distance", fromJson: _toDouble)
  double? get totalDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
  double? get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
  double? get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
  double? get dropoffLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
  double? get dropoffLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: "total_hours", fromJson: _toDouble)
  double? get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: "hourly_rate")
  int? get hourlyRate => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_earnings")
  int? get instructorEarnings => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_scheduled_at")
  DateTime? get paymentScheduledAt => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_processed_at")
  DateTime? get paymentProcessedAt => throw _privateConstructorUsedError;

  /// Serializes this AcceptResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcceptResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcceptResponseCopyWith<AcceptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptResponseCopyWith<$Res> {
  factory $AcceptResponseCopyWith(
          AcceptResponse value, $Res Function(AcceptResponse) then) =
      _$AcceptResponseCopyWithImpl<$Res, AcceptResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "booking_id") int? bookingId,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "end_time") DateTime? endTime,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "total_distance", fromJson: _toDouble)
      double? totalDistance,
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
      @JsonKey(name: "payment_processed_at") DateTime? paymentProcessedAt});
}

/// @nodoc
class _$AcceptResponseCopyWithImpl<$Res, $Val extends AcceptResponse>
    implements $AcceptResponseCopyWith<$Res> {
  _$AcceptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcceptResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? totalDistance = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? dropoffLatitude = freezed,
    Object? dropoffLongitude = freezed,
    Object? totalHours = freezed,
    Object? hourlyRate = freezed,
    Object? instructorEarnings = freezed,
    Object? paymentScheduledAt = freezed,
    Object? paymentProcessedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLatitude: freezed == dropoffLatitude
          ? _value.dropoffLatitude
          : dropoffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLongitude: freezed == dropoffLongitude
          ? _value.dropoffLongitude
          : dropoffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorEarnings: freezed == instructorEarnings
          ? _value.instructorEarnings
          : instructorEarnings // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentScheduledAt: freezed == paymentScheduledAt
          ? _value.paymentScheduledAt
          : paymentScheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentProcessedAt: freezed == paymentProcessedAt
          ? _value.paymentProcessedAt
          : paymentProcessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AcceptResponseImplCopyWith<$Res>
    implements $AcceptResponseCopyWith<$Res> {
  factory _$$AcceptResponseImplCopyWith(_$AcceptResponseImpl value,
          $Res Function(_$AcceptResponseImpl) then) =
      __$$AcceptResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "booking_id") int? bookingId,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "end_time") DateTime? endTime,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "total_distance", fromJson: _toDouble)
      double? totalDistance,
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
      @JsonKey(name: "payment_processed_at") DateTime? paymentProcessedAt});
}

/// @nodoc
class __$$AcceptResponseImplCopyWithImpl<$Res>
    extends _$AcceptResponseCopyWithImpl<$Res, _$AcceptResponseImpl>
    implements _$$AcceptResponseImplCopyWith<$Res> {
  __$$AcceptResponseImplCopyWithImpl(
      _$AcceptResponseImpl _value, $Res Function(_$AcceptResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AcceptResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? totalDistance = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? dropoffLatitude = freezed,
    Object? dropoffLongitude = freezed,
    Object? totalHours = freezed,
    Object? hourlyRate = freezed,
    Object? instructorEarnings = freezed,
    Object? paymentScheduledAt = freezed,
    Object? paymentProcessedAt = freezed,
  }) {
    return _then(_$AcceptResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLatitude: freezed == dropoffLatitude
          ? _value.dropoffLatitude
          : dropoffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLongitude: freezed == dropoffLongitude
          ? _value.dropoffLongitude
          : dropoffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorEarnings: freezed == instructorEarnings
          ? _value.instructorEarnings
          : instructorEarnings // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentScheduledAt: freezed == paymentScheduledAt
          ? _value.paymentScheduledAt
          : paymentScheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentProcessedAt: freezed == paymentProcessedAt
          ? _value.paymentProcessedAt
          : paymentProcessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AcceptResponseImpl implements _AcceptResponse {
  const _$AcceptResponseImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "booking_id") this.bookingId,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "total_distance", fromJson: _toDouble) this.totalDistance,
      @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
      this.pickupLatitude,
      @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
      this.pickupLongitude,
      @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
      this.dropoffLatitude,
      @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
      this.dropoffLongitude,
      @JsonKey(name: "total_hours", fromJson: _toDouble) this.totalHours,
      @JsonKey(name: "hourly_rate") this.hourlyRate,
      @JsonKey(name: "instructor_earnings") this.instructorEarnings,
      @JsonKey(name: "payment_scheduled_at") this.paymentScheduledAt,
      @JsonKey(name: "payment_processed_at") this.paymentProcessedAt});

  factory _$AcceptResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;

  /// Now returned (§8.2) — the app no longer has to remember this itself.
  @override
  @JsonKey(name: "booking_id")
  final int? bookingId;
  @override
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @override
  @JsonKey(name: "end_time")
  final DateTime? endTime;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "total_distance", fromJson: _toDouble)
  final double? totalDistance;
  @override
  @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
  final double? pickupLatitude;
  @override
  @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
  final double? pickupLongitude;
  @override
  @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
  final double? dropoffLatitude;
  @override
  @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
  final double? dropoffLongitude;
  @override
  @JsonKey(name: "total_hours", fromJson: _toDouble)
  final double? totalHours;
  @override
  @JsonKey(name: "hourly_rate")
  final int? hourlyRate;
  @override
  @JsonKey(name: "instructor_earnings")
  final int? instructorEarnings;
  @override
  @JsonKey(name: "payment_scheduled_at")
  final DateTime? paymentScheduledAt;
  @override
  @JsonKey(name: "payment_processed_at")
  final DateTime? paymentProcessedAt;

  @override
  String toString() {
    return 'AcceptResponse(id: $id, bookingId: $bookingId, startTime: $startTime, endTime: $endTime, status: $status, totalDistance: $totalDistance, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, dropoffLatitude: $dropoffLatitude, dropoffLongitude: $dropoffLongitude, totalHours: $totalHours, hourlyRate: $hourlyRate, instructorEarnings: $instructorEarnings, paymentScheduledAt: $paymentScheduledAt, paymentProcessedAt: $paymentProcessedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.dropoffLatitude, dropoffLatitude) ||
                other.dropoffLatitude == dropoffLatitude) &&
            (identical(other.dropoffLongitude, dropoffLongitude) ||
                other.dropoffLongitude == dropoffLongitude) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            (identical(other.instructorEarnings, instructorEarnings) ||
                other.instructorEarnings == instructorEarnings) &&
            (identical(other.paymentScheduledAt, paymentScheduledAt) ||
                other.paymentScheduledAt == paymentScheduledAt) &&
            (identical(other.paymentProcessedAt, paymentProcessedAt) ||
                other.paymentProcessedAt == paymentProcessedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookingId,
      startTime,
      endTime,
      status,
      totalDistance,
      pickupLatitude,
      pickupLongitude,
      dropoffLatitude,
      dropoffLongitude,
      totalHours,
      hourlyRate,
      instructorEarnings,
      paymentScheduledAt,
      paymentProcessedAt);

  /// Create a copy of AcceptResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptResponseImplCopyWith<_$AcceptResponseImpl> get copyWith =>
      __$$AcceptResponseImplCopyWithImpl<_$AcceptResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptResponseImplToJson(
      this,
    );
  }
}

abstract class _AcceptResponse implements AcceptResponse {
  const factory _AcceptResponse(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "booking_id") final int? bookingId,
      @JsonKey(name: "start_time") final DateTime? startTime,
      @JsonKey(name: "end_time") final DateTime? endTime,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "total_distance", fromJson: _toDouble)
      final double? totalDistance,
      @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
      final double? pickupLatitude,
      @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
      final double? pickupLongitude,
      @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
      final double? dropoffLatitude,
      @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
      final double? dropoffLongitude,
      @JsonKey(name: "total_hours", fromJson: _toDouble)
      final double? totalHours,
      @JsonKey(name: "hourly_rate") final int? hourlyRate,
      @JsonKey(name: "instructor_earnings") final int? instructorEarnings,
      @JsonKey(name: "payment_scheduled_at") final DateTime? paymentScheduledAt,
      @JsonKey(name: "payment_processed_at")
      final DateTime? paymentProcessedAt}) = _$AcceptResponseImpl;

  factory _AcceptResponse.fromJson(Map<String, dynamic> json) =
      _$AcceptResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;

  /// Now returned (§8.2) — the app no longer has to remember this itself.
  @override
  @JsonKey(name: "booking_id")
  int? get bookingId;
  @override
  @JsonKey(name: "start_time")
  DateTime? get startTime;
  @override
  @JsonKey(name: "end_time")
  DateTime? get endTime;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "total_distance", fromJson: _toDouble)
  double? get totalDistance;
  @override
  @JsonKey(name: "pickup_latitude", fromJson: _toDouble)
  double? get pickupLatitude;
  @override
  @JsonKey(name: "pickup_longitude", fromJson: _toDouble)
  double? get pickupLongitude;
  @override
  @JsonKey(name: "dropoff_latitude", fromJson: _toDouble)
  double? get dropoffLatitude;
  @override
  @JsonKey(name: "dropoff_longitude", fromJson: _toDouble)
  double? get dropoffLongitude;
  @override
  @JsonKey(name: "total_hours", fromJson: _toDouble)
  double? get totalHours;
  @override
  @JsonKey(name: "hourly_rate")
  int? get hourlyRate;
  @override
  @JsonKey(name: "instructor_earnings")
  int? get instructorEarnings;
  @override
  @JsonKey(name: "payment_scheduled_at")
  DateTime? get paymentScheduledAt;
  @override
  @JsonKey(name: "payment_processed_at")
  DateTime? get paymentProcessedAt;

  /// Create a copy of AcceptResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptResponseImplCopyWith<_$AcceptResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
