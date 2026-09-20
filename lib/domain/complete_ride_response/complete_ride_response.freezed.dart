// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_ride_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompleteRideResponse _$CompleteRideResponseFromJson(Map<String, dynamic> json) {
  return _CompleteRideResponse.fromJson(json);
}

/// @nodoc
mixin _$CompleteRideResponse {
  @JsonKey(name: "data")
  List<CompleteRide>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this CompleteRideResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteRideResponseCopyWith<CompleteRideResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRideResponseCopyWith<$Res> {
  factory $CompleteRideResponseCopyWith(CompleteRideResponse value,
          $Res Function(CompleteRideResponse) then) =
      _$CompleteRideResponseCopyWithImpl<$Res, CompleteRideResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "data") List<CompleteRide>? data,
      @JsonKey(name: "meta") Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$CompleteRideResponseCopyWithImpl<$Res,
        $Val extends CompleteRideResponse>
    implements $CompleteRideResponseCopyWith<$Res> {
  _$CompleteRideResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CompleteRide>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompleteRideResponseImplCopyWith<$Res>
    implements $CompleteRideResponseCopyWith<$Res> {
  factory _$$CompleteRideResponseImplCopyWith(_$CompleteRideResponseImpl value,
          $Res Function(_$CompleteRideResponseImpl) then) =
      __$$CompleteRideResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "data") List<CompleteRide>? data,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$CompleteRideResponseImplCopyWithImpl<$Res>
    extends _$CompleteRideResponseCopyWithImpl<$Res, _$CompleteRideResponseImpl>
    implements _$$CompleteRideResponseImplCopyWith<$Res> {
  __$$CompleteRideResponseImplCopyWithImpl(_$CompleteRideResponseImpl _value,
      $Res Function(_$CompleteRideResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$CompleteRideResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CompleteRide>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteRideResponseImpl implements _CompleteRideResponse {
  const _$CompleteRideResponseImpl(
      {@JsonKey(name: "data") final List<CompleteRide>? data,
      @JsonKey(name: "meta") this.meta})
      : _data = data;

  factory _$CompleteRideResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteRideResponseImplFromJson(json);

  final List<CompleteRide>? _data;
  @override
  @JsonKey(name: "data")
  List<CompleteRide>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'CompleteRideResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRideResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRideResponseImplCopyWith<_$CompleteRideResponseImpl>
      get copyWith =>
          __$$CompleteRideResponseImplCopyWithImpl<_$CompleteRideResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteRideResponseImplToJson(
      this,
    );
  }
}

abstract class _CompleteRideResponse implements CompleteRideResponse {
  const factory _CompleteRideResponse(
      {@JsonKey(name: "data") final List<CompleteRide>? data,
      @JsonKey(name: "meta") final Meta? meta}) = _$CompleteRideResponseImpl;

  factory _CompleteRideResponse.fromJson(Map<String, dynamic> json) =
      _$CompleteRideResponseImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<CompleteRide>? get data;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;

  /// Create a copy of CompleteRideResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRideResponseImplCopyWith<_$CompleteRideResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CompleteRide _$CompleteRideFromJson(Map<String, dynamic> json) {
  return _CompleteRide.fromJson(json);
}

/// @nodoc
mixin _$CompleteRide {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "customerName")
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "testCenterName")
  String? get testCenterName => throw _privateConstructorUsedError;
  @JsonKey(name: "pickupLocation")
  String? get pickupLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "dropoffLocation")
  String? get dropoffLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "dateTime")
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "testType")
  String? get testType => throw _privateConstructorUsedError;

  /// Cents. `baseAmount + transportationAmount`, and **correct
  /// immediately** — it is written when the job is accepted, not when the
  /// payout cron runs.
  ///
  /// It used to stay 0 until the transfer went out, up to
  /// `instructor_payout_delay_days` (7) after the ride, which is why this
  /// card used to preview `totalHours x hourlyRate` client-side. That
  /// workaround is gone: under the flat-base model it produces a number
  /// wrong by the whole base.
  @JsonKey(name: "instructorEarnings")
  int? get instructorEarnings => throw _privateConstructorUsedError;

  /// Cents. The flat road-test portion, as frozen at accept.
  ///
  /// `0` for rides accepted before the pay-v2 deploy — those settle on the
  /// old wall-clock arithmetic and have no breakdown to show, so guard the
  /// breakdown UI on `baseAmount > 0` and fall back to the total alone.
  @JsonKey(name: "baseAmount")
  int? get baseAmount => throw _privateConstructorUsedError;

  /// Paid driving hours (pickup → centre → back). `0` for meet-at-centre.
  @JsonKey(name: "transportationHours", fromJson: _toDouble)
  double? get transportationHours => throw _privateConstructorUsedError;

  /// Cents per transportation hour, snapshotted at accept. Same field name
  /// as before; it no longer prices the road test.
  @JsonKey(name: "hourlyRate")
  int? get hourlyRate => throw _privateConstructorUsedError;

  /// Cents. `round(transportationHours x hourlyRate)`.
  @JsonKey(name: "transportationAmount")
  int? get transportationAmount => throw _privateConstructorUsedError;

  /// Kilometres actually driven, and safe to label as such (§5.2).
  ///
  /// Summed with haversine over the ride's GPS breadcrumbs: ordered by
  /// capture time, stationary jitter (<15 m) dropped, fixes worse than 100 m
  /// accuracy discarded. It under-reads true road distance by roughly 3–8%
  /// because it draws straight lines between samples — deliberately
  /// uncorrected, since no money depends on it — and it is only as good as
  /// the app's ping cadence ([LocationTrackingPolicy], §12.6).
  ///
  /// Two things this does *not* cover. It was previously a Distance-Matrix
  /// lookup from the Start point to the Stop point, which reported ≈ 0 km for
  /// any round trip that ended where it began; **rides completed before that
  /// fix were not backfilled**, so old history rows still hold the old
  /// number. And a session with fewer than two usable points still falls back
  /// to that point-to-point lookup.
  ///
  /// Arrives as a string like `"0.400000"` — a `decimal` column (§12.2).
  @JsonKey(name: "totalDistance", fromJson: _toDouble)
  double? get totalDistance => throw _privateConstructorUsedError;

  /// Wall-clock hours from Start to Stop. **Reporting only** — it no longer
  /// drives pay, so never label it, or anything derived from it, as
  /// earnings. It is the ride's duration and nothing more. Also a string on
  /// the wire.
  @JsonKey(name: "totalHours", fromJson: _toDouble)
  double? get totalHours => throw _privateConstructorUsedError;

  /// Serializes this CompleteRide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteRide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteRideCopyWith<CompleteRide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRideCopyWith<$Res> {
  factory $CompleteRideCopyWith(
          CompleteRide value, $Res Function(CompleteRide) then) =
      _$CompleteRideCopyWithImpl<$Res, CompleteRide>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "customerName") String? customerName,
      @JsonKey(name: "testCenterName") String? testCenterName,
      @JsonKey(name: "pickupLocation") String? pickupLocation,
      @JsonKey(name: "dropoffLocation") String? dropoffLocation,
      @JsonKey(name: "dateTime") DateTime? dateTime,
      @JsonKey(name: "testType") String? testType,
      @JsonKey(name: "instructorEarnings") int? instructorEarnings,
      @JsonKey(name: "baseAmount") int? baseAmount,
      @JsonKey(name: "transportationHours", fromJson: _toDouble)
      double? transportationHours,
      @JsonKey(name: "hourlyRate") int? hourlyRate,
      @JsonKey(name: "transportationAmount") int? transportationAmount,
      @JsonKey(name: "totalDistance", fromJson: _toDouble)
      double? totalDistance,
      @JsonKey(name: "totalHours", fromJson: _toDouble) double? totalHours});
}

/// @nodoc
class _$CompleteRideCopyWithImpl<$Res, $Val extends CompleteRide>
    implements $CompleteRideCopyWith<$Res> {
  _$CompleteRideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerName = freezed,
    Object? testCenterName = freezed,
    Object? pickupLocation = freezed,
    Object? dropoffLocation = freezed,
    Object? dateTime = freezed,
    Object? testType = freezed,
    Object? instructorEarnings = freezed,
    Object? baseAmount = freezed,
    Object? transportationHours = freezed,
    Object? hourlyRate = freezed,
    Object? transportationAmount = freezed,
    Object? totalDistance = freezed,
    Object? totalHours = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterName: freezed == testCenterName
          ? _value.testCenterName
          : testCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLocation: freezed == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      dropoffLocation: freezed == dropoffLocation
          ? _value.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testType: freezed == testType
          ? _value.testType
          : testType // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorEarnings: freezed == instructorEarnings
          ? _value.instructorEarnings
          : instructorEarnings // ignore: cast_nullable_to_non_nullable
              as int?,
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationHours: freezed == transportationHours
          ? _value.transportationHours
          : transportationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationAmount: freezed == transportationAmount
          ? _value.transportationAmount
          : transportationAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteRideImplCopyWith<$Res>
    implements $CompleteRideCopyWith<$Res> {
  factory _$$CompleteRideImplCopyWith(
          _$CompleteRideImpl value, $Res Function(_$CompleteRideImpl) then) =
      __$$CompleteRideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "customerName") String? customerName,
      @JsonKey(name: "testCenterName") String? testCenterName,
      @JsonKey(name: "pickupLocation") String? pickupLocation,
      @JsonKey(name: "dropoffLocation") String? dropoffLocation,
      @JsonKey(name: "dateTime") DateTime? dateTime,
      @JsonKey(name: "testType") String? testType,
      @JsonKey(name: "instructorEarnings") int? instructorEarnings,
      @JsonKey(name: "baseAmount") int? baseAmount,
      @JsonKey(name: "transportationHours", fromJson: _toDouble)
      double? transportationHours,
      @JsonKey(name: "hourlyRate") int? hourlyRate,
      @JsonKey(name: "transportationAmount") int? transportationAmount,
      @JsonKey(name: "totalDistance", fromJson: _toDouble)
      double? totalDistance,
      @JsonKey(name: "totalHours", fromJson: _toDouble) double? totalHours});
}

/// @nodoc
class __$$CompleteRideImplCopyWithImpl<$Res>
    extends _$CompleteRideCopyWithImpl<$Res, _$CompleteRideImpl>
    implements _$$CompleteRideImplCopyWith<$Res> {
  __$$CompleteRideImplCopyWithImpl(
      _$CompleteRideImpl _value, $Res Function(_$CompleteRideImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerName = freezed,
    Object? testCenterName = freezed,
    Object? pickupLocation = freezed,
    Object? dropoffLocation = freezed,
    Object? dateTime = freezed,
    Object? testType = freezed,
    Object? instructorEarnings = freezed,
    Object? baseAmount = freezed,
    Object? transportationHours = freezed,
    Object? hourlyRate = freezed,
    Object? transportationAmount = freezed,
    Object? totalDistance = freezed,
    Object? totalHours = freezed,
  }) {
    return _then(_$CompleteRideImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterName: freezed == testCenterName
          ? _value.testCenterName
          : testCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLocation: freezed == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      dropoffLocation: freezed == dropoffLocation
          ? _value.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testType: freezed == testType
          ? _value.testType
          : testType // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorEarnings: freezed == instructorEarnings
          ? _value.instructorEarnings
          : instructorEarnings // ignore: cast_nullable_to_non_nullable
              as int?,
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationHours: freezed == transportationHours
          ? _value.transportationHours
          : transportationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
      transportationAmount: freezed == transportationAmount
          ? _value.transportationAmount
          : transportationAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteRideImpl implements _CompleteRide {
  const _$CompleteRideImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "customerName") this.customerName,
      @JsonKey(name: "testCenterName") this.testCenterName,
      @JsonKey(name: "pickupLocation") this.pickupLocation,
      @JsonKey(name: "dropoffLocation") this.dropoffLocation,
      @JsonKey(name: "dateTime") this.dateTime,
      @JsonKey(name: "testType") this.testType,
      @JsonKey(name: "instructorEarnings") this.instructorEarnings,
      @JsonKey(name: "baseAmount") this.baseAmount,
      @JsonKey(name: "transportationHours", fromJson: _toDouble)
      this.transportationHours,
      @JsonKey(name: "hourlyRate") this.hourlyRate,
      @JsonKey(name: "transportationAmount") this.transportationAmount,
      @JsonKey(name: "totalDistance", fromJson: _toDouble) this.totalDistance,
      @JsonKey(name: "totalHours", fromJson: _toDouble) this.totalHours});

  factory _$CompleteRideImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteRideImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "customerName")
  final String? customerName;
  @override
  @JsonKey(name: "testCenterName")
  final String? testCenterName;
  @override
  @JsonKey(name: "pickupLocation")
  final String? pickupLocation;
  @override
  @JsonKey(name: "dropoffLocation")
  final String? dropoffLocation;
  @override
  @JsonKey(name: "dateTime")
  final DateTime? dateTime;
  @override
  @JsonKey(name: "testType")
  final String? testType;

  /// Cents. `baseAmount + transportationAmount`, and **correct
  /// immediately** — it is written when the job is accepted, not when the
  /// payout cron runs.
  ///
  /// It used to stay 0 until the transfer went out, up to
  /// `instructor_payout_delay_days` (7) after the ride, which is why this
  /// card used to preview `totalHours x hourlyRate` client-side. That
  /// workaround is gone: under the flat-base model it produces a number
  /// wrong by the whole base.
  @override
  @JsonKey(name: "instructorEarnings")
  final int? instructorEarnings;

  /// Cents. The flat road-test portion, as frozen at accept.
  ///
  /// `0` for rides accepted before the pay-v2 deploy — those settle on the
  /// old wall-clock arithmetic and have no breakdown to show, so guard the
  /// breakdown UI on `baseAmount > 0` and fall back to the total alone.
  @override
  @JsonKey(name: "baseAmount")
  final int? baseAmount;

  /// Paid driving hours (pickup → centre → back). `0` for meet-at-centre.
  @override
  @JsonKey(name: "transportationHours", fromJson: _toDouble)
  final double? transportationHours;

  /// Cents per transportation hour, snapshotted at accept. Same field name
  /// as before; it no longer prices the road test.
  @override
  @JsonKey(name: "hourlyRate")
  final int? hourlyRate;

  /// Cents. `round(transportationHours x hourlyRate)`.
  @override
  @JsonKey(name: "transportationAmount")
  final int? transportationAmount;

  /// Kilometres actually driven, and safe to label as such (§5.2).
  ///
  /// Summed with haversine over the ride's GPS breadcrumbs: ordered by
  /// capture time, stationary jitter (<15 m) dropped, fixes worse than 100 m
  /// accuracy discarded. It under-reads true road distance by roughly 3–8%
  /// because it draws straight lines between samples — deliberately
  /// uncorrected, since no money depends on it — and it is only as good as
  /// the app's ping cadence ([LocationTrackingPolicy], §12.6).
  ///
  /// Two things this does *not* cover. It was previously a Distance-Matrix
  /// lookup from the Start point to the Stop point, which reported ≈ 0 km for
  /// any round trip that ended where it began; **rides completed before that
  /// fix were not backfilled**, so old history rows still hold the old
  /// number. And a session with fewer than two usable points still falls back
  /// to that point-to-point lookup.
  ///
  /// Arrives as a string like `"0.400000"` — a `decimal` column (§12.2).
  @override
  @JsonKey(name: "totalDistance", fromJson: _toDouble)
  final double? totalDistance;

  /// Wall-clock hours from Start to Stop. **Reporting only** — it no longer
  /// drives pay, so never label it, or anything derived from it, as
  /// earnings. It is the ride's duration and nothing more. Also a string on
  /// the wire.
  @override
  @JsonKey(name: "totalHours", fromJson: _toDouble)
  final double? totalHours;

  @override
  String toString() {
    return 'CompleteRide(id: $id, customerName: $customerName, testCenterName: $testCenterName, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, dateTime: $dateTime, testType: $testType, instructorEarnings: $instructorEarnings, baseAmount: $baseAmount, transportationHours: $transportationHours, hourlyRate: $hourlyRate, transportationAmount: $transportationAmount, totalDistance: $totalDistance, totalHours: $totalHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.testCenterName, testCenterName) ||
                other.testCenterName == testCenterName) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.testType, testType) ||
                other.testType == testType) &&
            (identical(other.instructorEarnings, instructorEarnings) ||
                other.instructorEarnings == instructorEarnings) &&
            (identical(other.baseAmount, baseAmount) ||
                other.baseAmount == baseAmount) &&
            (identical(other.transportationHours, transportationHours) ||
                other.transportationHours == transportationHours) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            (identical(other.transportationAmount, transportationAmount) ||
                other.transportationAmount == transportationAmount) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerName,
      testCenterName,
      pickupLocation,
      dropoffLocation,
      dateTime,
      testType,
      instructorEarnings,
      baseAmount,
      transportationHours,
      hourlyRate,
      transportationAmount,
      totalDistance,
      totalHours);

  /// Create a copy of CompleteRide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRideImplCopyWith<_$CompleteRideImpl> get copyWith =>
      __$$CompleteRideImplCopyWithImpl<_$CompleteRideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteRideImplToJson(
      this,
    );
  }
}

abstract class _CompleteRide implements CompleteRide {
  const factory _CompleteRide(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "customerName") final String? customerName,
      @JsonKey(name: "testCenterName") final String? testCenterName,
      @JsonKey(name: "pickupLocation") final String? pickupLocation,
      @JsonKey(name: "dropoffLocation") final String? dropoffLocation,
      @JsonKey(name: "dateTime") final DateTime? dateTime,
      @JsonKey(name: "testType") final String? testType,
      @JsonKey(name: "instructorEarnings") final int? instructorEarnings,
      @JsonKey(name: "baseAmount") final int? baseAmount,
      @JsonKey(name: "transportationHours", fromJson: _toDouble)
      final double? transportationHours,
      @JsonKey(name: "hourlyRate") final int? hourlyRate,
      @JsonKey(name: "transportationAmount") final int? transportationAmount,
      @JsonKey(name: "totalDistance", fromJson: _toDouble)
      final double? totalDistance,
      @JsonKey(name: "totalHours", fromJson: _toDouble)
      final double? totalHours}) = _$CompleteRideImpl;

  factory _CompleteRide.fromJson(Map<String, dynamic> json) =
      _$CompleteRideImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "customerName")
  String? get customerName;
  @override
  @JsonKey(name: "testCenterName")
  String? get testCenterName;
  @override
  @JsonKey(name: "pickupLocation")
  String? get pickupLocation;
  @override
  @JsonKey(name: "dropoffLocation")
  String? get dropoffLocation;
  @override
  @JsonKey(name: "dateTime")
  DateTime? get dateTime;
  @override
  @JsonKey(name: "testType")
  String? get testType;

  /// Cents. `baseAmount + transportationAmount`, and **correct
  /// immediately** — it is written when the job is accepted, not when the
  /// payout cron runs.
  ///
  /// It used to stay 0 until the transfer went out, up to
  /// `instructor_payout_delay_days` (7) after the ride, which is why this
  /// card used to preview `totalHours x hourlyRate` client-side. That
  /// workaround is gone: under the flat-base model it produces a number
  /// wrong by the whole base.
  @override
  @JsonKey(name: "instructorEarnings")
  int? get instructorEarnings;

  /// Cents. The flat road-test portion, as frozen at accept.
  ///
  /// `0` for rides accepted before the pay-v2 deploy — those settle on the
  /// old wall-clock arithmetic and have no breakdown to show, so guard the
  /// breakdown UI on `baseAmount > 0` and fall back to the total alone.
  @override
  @JsonKey(name: "baseAmount")
  int? get baseAmount;

  /// Paid driving hours (pickup → centre → back). `0` for meet-at-centre.
  @override
  @JsonKey(name: "transportationHours", fromJson: _toDouble)
  double? get transportationHours;

  /// Cents per transportation hour, snapshotted at accept. Same field name
  /// as before; it no longer prices the road test.
  @override
  @JsonKey(name: "hourlyRate")
  int? get hourlyRate;

  /// Cents. `round(transportationHours x hourlyRate)`.
  @override
  @JsonKey(name: "transportationAmount")
  int? get transportationAmount;

  /// Kilometres actually driven, and safe to label as such (§5.2).
  ///
  /// Summed with haversine over the ride's GPS breadcrumbs: ordered by
  /// capture time, stationary jitter (<15 m) dropped, fixes worse than 100 m
  /// accuracy discarded. It under-reads true road distance by roughly 3–8%
  /// because it draws straight lines between samples — deliberately
  /// uncorrected, since no money depends on it — and it is only as good as
  /// the app's ping cadence ([LocationTrackingPolicy], §12.6).
  ///
  /// Two things this does *not* cover. It was previously a Distance-Matrix
  /// lookup from the Start point to the Stop point, which reported ≈ 0 km for
  /// any round trip that ended where it began; **rides completed before that
  /// fix were not backfilled**, so old history rows still hold the old
  /// number. And a session with fewer than two usable points still falls back
  /// to that point-to-point lookup.
  ///
  /// Arrives as a string like `"0.400000"` — a `decimal` column (§12.2).
  @override
  @JsonKey(name: "totalDistance", fromJson: _toDouble)
  double? get totalDistance;

  /// Wall-clock hours from Start to Stop. **Reporting only** — it no longer
  /// drives pay, so never label it, or anything derived from it, as
  /// earnings. It is the ride's duration and nothing more. Also a string on
  /// the wire.
  @override
  @JsonKey(name: "totalHours", fromJson: _toDouble)
  double? get totalHours;

  /// Create a copy of CompleteRide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRideImplCopyWith<_$CompleteRideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
