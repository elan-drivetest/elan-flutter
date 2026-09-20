// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RideSession _$RideSessionFromJson(Map<String, dynamic> json) {
  return _RideSession.fromJson(json);
}

/// @nodoc
mixin _$RideSession {
  int get id => throw _privateConstructorUsedError;

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
  @JsonKey(name: 'booking_id')
  int? get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  /// Kilometres — but it means **two different things** depending on status
  /// (§5.2), so do not label it without checking which.
  ///
  /// * While the ride is `scheduled` or `in_progress`: the accept-time
  ///   estimate, `2 × pickup_distance` (0 for meet-at-centre). It is not
  ///   updated as the instructor drives.
  /// * Once stopped: the real driven distance, summed from the GPS
  ///   breadcrumbs this app uploaded.
  @JsonKey(name: 'total_distance', fromJson: _toDouble)
  double? get totalDistance => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
  double? get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
  double? get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
  double? get dropoffLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
  double? get dropoffLongitude => throw _privateConstructorUsedError;

  /// Wall-clock hours Start → Stop. Reporting only since pay v2 — it does
  /// not determine the payout any more.
  @JsonKey(name: 'total_hours', fromJson: _toDouble)
  double? get totalHours => throw _privateConstructorUsedError;

  /// Cents per **transportation** hour, snapshotted at accept.
  @JsonKey(name: 'hourly_rate')
  int? get hourlyRate => throw _privateConstructorUsedError;

  /// Cents. The flat road-test portion frozen onto this session at accept
  /// (`instructor_rate x 3`). `0`/null on sessions created before pay v2.
  @JsonKey(name: 'base_amount')
  int? get baseAmount => throw _privateConstructorUsedError;

  /// Paid driving hours, frozen at accept. `0` for meet-at-centre.
  @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
  double? get transportationHours => throw _privateConstructorUsedError;

  /// Cents. `round(transportation_hours x hourly_rate)`.
  @JsonKey(name: 'transportation_amount')
  int? get transportationAmount => throw _privateConstructorUsedError;

  /// Cents. `base_amount + transportation_amount`, written at accept — no
  /// longer zero until the payout cron runs.
  @JsonKey(name: 'instructor_earnings')
  int? get instructorEarnings => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_scheduled_at')
  DateTime? get paymentScheduledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_processed_at')
  DateTime? get paymentProcessedAt => throw _privateConstructorUsedError;

  /// Serializes this RideSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RideSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideSessionCopyWith<RideSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideSessionCopyWith<$Res> {
  factory $RideSessionCopyWith(
          RideSession value, $Res Function(RideSession) then) =
      _$RideSessionCopyWithImpl<$Res, RideSession>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'booking_id') int? bookingId,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'total_distance', fromJson: _toDouble)
      double? totalDistance,
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
      @JsonKey(name: 'base_amount') int? baseAmount,
      @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
      double? transportationHours,
      @JsonKey(name: 'transportation_amount') int? transportationAmount,
      @JsonKey(name: 'instructor_earnings') int? instructorEarnings,
      @JsonKey(name: 'payment_scheduled_at') DateTime? paymentScheduledAt,
      @JsonKey(name: 'payment_processed_at') DateTime? paymentProcessedAt});
}

/// @nodoc
class _$RideSessionCopyWithImpl<$Res, $Val extends RideSession>
    implements $RideSessionCopyWith<$Res> {
  _$RideSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? baseAmount = freezed,
    Object? transportationHours = freezed,
    Object? transportationAmount = freezed,
    Object? instructorEarnings = freezed,
    Object? paymentScheduledAt = freezed,
    Object? paymentProcessedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationHours: freezed == transportationHours
          ? _value.transportationHours
          : transportationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      transportationAmount: freezed == transportationAmount
          ? _value.transportationAmount
          : transportationAmount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RideSessionImplCopyWith<$Res>
    implements $RideSessionCopyWith<$Res> {
  factory _$$RideSessionImplCopyWith(
          _$RideSessionImpl value, $Res Function(_$RideSessionImpl) then) =
      __$$RideSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'booking_id') int? bookingId,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'total_distance', fromJson: _toDouble)
      double? totalDistance,
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
      @JsonKey(name: 'base_amount') int? baseAmount,
      @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
      double? transportationHours,
      @JsonKey(name: 'transportation_amount') int? transportationAmount,
      @JsonKey(name: 'instructor_earnings') int? instructorEarnings,
      @JsonKey(name: 'payment_scheduled_at') DateTime? paymentScheduledAt,
      @JsonKey(name: 'payment_processed_at') DateTime? paymentProcessedAt});
}

/// @nodoc
class __$$RideSessionImplCopyWithImpl<$Res>
    extends _$RideSessionCopyWithImpl<$Res, _$RideSessionImpl>
    implements _$$RideSessionImplCopyWith<$Res> {
  __$$RideSessionImplCopyWithImpl(
      _$RideSessionImpl _value, $Res Function(_$RideSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? baseAmount = freezed,
    Object? transportationHours = freezed,
    Object? transportationAmount = freezed,
    Object? instructorEarnings = freezed,
    Object? paymentScheduledAt = freezed,
    Object? paymentProcessedAt = freezed,
  }) {
    return _then(_$RideSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationHours: freezed == transportationHours
          ? _value.transportationHours
          : transportationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      transportationAmount: freezed == transportationAmount
          ? _value.transportationAmount
          : transportationAmount // ignore: cast_nullable_to_non_nullable
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
class _$RideSessionImpl implements _RideSession {
  const _$RideSessionImpl(
      {required this.id,
      @JsonKey(name: 'booking_id') this.bookingId,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'total_distance', fromJson: _toDouble) this.totalDistance,
      @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
      this.pickupLatitude,
      @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
      this.pickupLongitude,
      @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
      this.dropoffLatitude,
      @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
      this.dropoffLongitude,
      @JsonKey(name: 'total_hours', fromJson: _toDouble) this.totalHours,
      @JsonKey(name: 'hourly_rate') this.hourlyRate,
      @JsonKey(name: 'base_amount') this.baseAmount,
      @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
      this.transportationHours,
      @JsonKey(name: 'transportation_amount') this.transportationAmount,
      @JsonKey(name: 'instructor_earnings') this.instructorEarnings,
      @JsonKey(name: 'payment_scheduled_at') this.paymentScheduledAt,
      @JsonKey(name: 'payment_processed_at') this.paymentProcessedAt});

  factory _$RideSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideSessionImplFromJson(json);

  @override
  final int id;

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
  @override
  @JsonKey(name: 'booking_id')
  final int? bookingId;
  @override
  @JsonKey(name: 'start_time')
  final DateTime? startTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime? endTime;
  @override
  @JsonKey(name: 'status')
  final String? status;

  /// Kilometres — but it means **two different things** depending on status
  /// (§5.2), so do not label it without checking which.
  ///
  /// * While the ride is `scheduled` or `in_progress`: the accept-time
  ///   estimate, `2 × pickup_distance` (0 for meet-at-centre). It is not
  ///   updated as the instructor drives.
  /// * Once stopped: the real driven distance, summed from the GPS
  ///   breadcrumbs this app uploaded.
  @override
  @JsonKey(name: 'total_distance', fromJson: _toDouble)
  final double? totalDistance;
  @override
  @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
  final double? pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
  final double? pickupLongitude;
  @override
  @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
  final double? dropoffLatitude;
  @override
  @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
  final double? dropoffLongitude;

  /// Wall-clock hours Start → Stop. Reporting only since pay v2 — it does
  /// not determine the payout any more.
  @override
  @JsonKey(name: 'total_hours', fromJson: _toDouble)
  final double? totalHours;

  /// Cents per **transportation** hour, snapshotted at accept.
  @override
  @JsonKey(name: 'hourly_rate')
  final int? hourlyRate;

  /// Cents. The flat road-test portion frozen onto this session at accept
  /// (`instructor_rate x 3`). `0`/null on sessions created before pay v2.
  @override
  @JsonKey(name: 'base_amount')
  final int? baseAmount;

  /// Paid driving hours, frozen at accept. `0` for meet-at-centre.
  @override
  @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
  final double? transportationHours;

  /// Cents. `round(transportation_hours x hourly_rate)`.
  @override
  @JsonKey(name: 'transportation_amount')
  final int? transportationAmount;

  /// Cents. `base_amount + transportation_amount`, written at accept — no
  /// longer zero until the payout cron runs.
  @override
  @JsonKey(name: 'instructor_earnings')
  final int? instructorEarnings;
  @override
  @JsonKey(name: 'payment_scheduled_at')
  final DateTime? paymentScheduledAt;
  @override
  @JsonKey(name: 'payment_processed_at')
  final DateTime? paymentProcessedAt;

  @override
  String toString() {
    return 'RideSession(id: $id, bookingId: $bookingId, startTime: $startTime, endTime: $endTime, status: $status, totalDistance: $totalDistance, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, dropoffLatitude: $dropoffLatitude, dropoffLongitude: $dropoffLongitude, totalHours: $totalHours, hourlyRate: $hourlyRate, baseAmount: $baseAmount, transportationHours: $transportationHours, transportationAmount: $transportationAmount, instructorEarnings: $instructorEarnings, paymentScheduledAt: $paymentScheduledAt, paymentProcessedAt: $paymentProcessedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideSessionImpl &&
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
            (identical(other.baseAmount, baseAmount) ||
                other.baseAmount == baseAmount) &&
            (identical(other.transportationHours, transportationHours) ||
                other.transportationHours == transportationHours) &&
            (identical(other.transportationAmount, transportationAmount) ||
                other.transportationAmount == transportationAmount) &&
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
      baseAmount,
      transportationHours,
      transportationAmount,
      instructorEarnings,
      paymentScheduledAt,
      paymentProcessedAt);

  /// Create a copy of RideSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideSessionImplCopyWith<_$RideSessionImpl> get copyWith =>
      __$$RideSessionImplCopyWithImpl<_$RideSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideSessionImplToJson(
      this,
    );
  }
}

abstract class _RideSession implements RideSession {
  const factory _RideSession(
      {required final int id,
      @JsonKey(name: 'booking_id') final int? bookingId,
      @JsonKey(name: 'start_time') final DateTime? startTime,
      @JsonKey(name: 'end_time') final DateTime? endTime,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'total_distance', fromJson: _toDouble)
      final double? totalDistance,
      @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
      final double? pickupLatitude,
      @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
      final double? pickupLongitude,
      @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
      final double? dropoffLatitude,
      @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
      final double? dropoffLongitude,
      @JsonKey(name: 'total_hours', fromJson: _toDouble)
      final double? totalHours,
      @JsonKey(name: 'hourly_rate') final int? hourlyRate,
      @JsonKey(name: 'base_amount') final int? baseAmount,
      @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
      final double? transportationHours,
      @JsonKey(name: 'transportation_amount') final int? transportationAmount,
      @JsonKey(name: 'instructor_earnings') final int? instructorEarnings,
      @JsonKey(name: 'payment_scheduled_at') final DateTime? paymentScheduledAt,
      @JsonKey(name: 'payment_processed_at')
      final DateTime? paymentProcessedAt}) = _$RideSessionImpl;

  factory _RideSession.fromJson(Map<String, dynamic> json) =
      _$RideSessionImpl.fromJson;

  @override
  int get id;

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
  @override
  @JsonKey(name: 'booking_id')
  int? get bookingId;
  @override
  @JsonKey(name: 'start_time')
  DateTime? get startTime;
  @override
  @JsonKey(name: 'end_time')
  DateTime? get endTime;
  @override
  @JsonKey(name: 'status')
  String? get status;

  /// Kilometres — but it means **two different things** depending on status
  /// (§5.2), so do not label it without checking which.
  ///
  /// * While the ride is `scheduled` or `in_progress`: the accept-time
  ///   estimate, `2 × pickup_distance` (0 for meet-at-centre). It is not
  ///   updated as the instructor drives.
  /// * Once stopped: the real driven distance, summed from the GPS
  ///   breadcrumbs this app uploaded.
  @override
  @JsonKey(name: 'total_distance', fromJson: _toDouble)
  double? get totalDistance;
  @override
  @JsonKey(name: 'pickup_latitude', fromJson: _toDouble)
  double? get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude', fromJson: _toDouble)
  double? get pickupLongitude;
  @override
  @JsonKey(name: 'dropoff_latitude', fromJson: _toDouble)
  double? get dropoffLatitude;
  @override
  @JsonKey(name: 'dropoff_longitude', fromJson: _toDouble)
  double? get dropoffLongitude;

  /// Wall-clock hours Start → Stop. Reporting only since pay v2 — it does
  /// not determine the payout any more.
  @override
  @JsonKey(name: 'total_hours', fromJson: _toDouble)
  double? get totalHours;

  /// Cents per **transportation** hour, snapshotted at accept.
  @override
  @JsonKey(name: 'hourly_rate')
  int? get hourlyRate;

  /// Cents. The flat road-test portion frozen onto this session at accept
  /// (`instructor_rate x 3`). `0`/null on sessions created before pay v2.
  @override
  @JsonKey(name: 'base_amount')
  int? get baseAmount;

  /// Paid driving hours, frozen at accept. `0` for meet-at-centre.
  @override
  @JsonKey(name: 'transportation_hours', fromJson: _toDouble)
  double? get transportationHours;

  /// Cents. `round(transportation_hours x hourly_rate)`.
  @override
  @JsonKey(name: 'transportation_amount')
  int? get transportationAmount;

  /// Cents. `base_amount + transportation_amount`, written at accept — no
  /// longer zero until the payout cron runs.
  @override
  @JsonKey(name: 'instructor_earnings')
  int? get instructorEarnings;
  @override
  @JsonKey(name: 'payment_scheduled_at')
  DateTime? get paymentScheduledAt;
  @override
  @JsonKey(name: 'payment_processed_at')
  DateTime? get paymentProcessedAt;

  /// Create a copy of RideSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideSessionImplCopyWith<_$RideSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
