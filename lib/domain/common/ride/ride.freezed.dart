// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ride _$RideFromJson(Map<String, dynamic> json) {
  return _Ride.fromJson(json);
}

/// @nodoc
mixin _$Ride {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_id")
  int? get instructorId => throw _privateConstructorUsedError;
  @JsonKey(name: "test_type")
  String? get testType => throw _privateConstructorUsedError;
  @JsonKey(name: "test_date")
  DateTime? get testDate => throw _privateConstructorUsedError;
  @JsonKey(name: "meet_at_center")
  bool? get meetAtCenter => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_address")
  String? get pickupAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
  double? get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
  double? get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
  double? get pickupDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "is_rescheduled")
  bool? get isRescheduled => throw _privateConstructorUsedError;
  @JsonKey(name: "timezone")
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: "road_test_doc_url")
  String? get roadTestDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "g1_license_doc_url")
  String? get g1LicenseDocUrl => throw _privateConstructorUsedError;

  /// Exposed to instructors alongside the centre's coordinates (§14.2), so a
  /// centre can be joined by id rather than matched on its name.
  @JsonKey(name: "test_center_id")
  int? get testCenterId => throw _privateConstructorUsedError;
  @JsonKey(name: "test_center_name")
  String? get testCenterName => throw _privateConstructorUsedError;
  @JsonKey(name: "test_center_address")
  String? get testCenterAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
  double? get testCenterLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
  double? get testCenterLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
  double? get totalRideHour => throw _privateConstructorUsedError;
  @JsonKey(name: "ride_price")
  int? get ridePrice => throw _privateConstructorUsedError;

  /// Serializes this Ride to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideCopyWith<Ride> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideCopyWith<$Res> {
  factory $RideCopyWith(Ride value, $Res Function(Ride) then) =
      _$RideCopyWithImpl<$Res, Ride>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "ride_price") int? ridePrice});
}

/// @nodoc
class _$RideCopyWithImpl<$Res, $Val extends Ride>
    implements $RideCopyWith<$Res> {
  _$RideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? instructorId = freezed,
    Object? testType = freezed,
    Object? testDate = freezed,
    Object? meetAtCenter = freezed,
    Object? pickupAddress = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? pickupDistance = freezed,
    Object? isRescheduled = freezed,
    Object? timezone = freezed,
    Object? roadTestDocUrl = freezed,
    Object? g1LicenseDocUrl = freezed,
    Object? testCenterId = freezed,
    Object? testCenterName = freezed,
    Object? testCenterAddress = freezed,
    Object? testCenterLatitude = freezed,
    Object? testCenterLongitude = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? totalRideHour = freezed,
    Object? ridePrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorId: freezed == instructorId
          ? _value.instructorId
          : instructorId // ignore: cast_nullable_to_non_nullable
              as int?,
      testType: freezed == testType
          ? _value.testType
          : testType // ignore: cast_nullable_to_non_nullable
              as String?,
      testDate: freezed == testDate
          ? _value.testDate
          : testDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      meetAtCenter: freezed == meetAtCenter
          ? _value.meetAtCenter
          : meetAtCenter // ignore: cast_nullable_to_non_nullable
              as bool?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupDistance: freezed == pickupDistance
          ? _value.pickupDistance
          : pickupDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      isRescheduled: freezed == isRescheduled
          ? _value.isRescheduled
          : isRescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      roadTestDocUrl: freezed == roadTestDocUrl
          ? _value.roadTestDocUrl
          : roadTestDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      g1LicenseDocUrl: freezed == g1LicenseDocUrl
          ? _value.g1LicenseDocUrl
          : g1LicenseDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterId: freezed == testCenterId
          ? _value.testCenterId
          : testCenterId // ignore: cast_nullable_to_non_nullable
              as int?,
      testCenterName: freezed == testCenterName
          ? _value.testCenterName
          : testCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterAddress: freezed == testCenterAddress
          ? _value.testCenterAddress
          : testCenterAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterLatitude: freezed == testCenterLatitude
          ? _value.testCenterLatitude
          : testCenterLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      testCenterLongitude: freezed == testCenterLongitude
          ? _value.testCenterLongitude
          : testCenterLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRideHour: freezed == totalRideHour
          ? _value.totalRideHour
          : totalRideHour // ignore: cast_nullable_to_non_nullable
              as double?,
      ridePrice: freezed == ridePrice
          ? _value.ridePrice
          : ridePrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RideImplCopyWith<$Res> implements $RideCopyWith<$Res> {
  factory _$$RideImplCopyWith(
          _$RideImpl value, $Res Function(_$RideImpl) then) =
      __$$RideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "ride_price") int? ridePrice});
}

/// @nodoc
class __$$RideImplCopyWithImpl<$Res>
    extends _$RideCopyWithImpl<$Res, _$RideImpl>
    implements _$$RideImplCopyWith<$Res> {
  __$$RideImplCopyWithImpl(_$RideImpl _value, $Res Function(_$RideImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? instructorId = freezed,
    Object? testType = freezed,
    Object? testDate = freezed,
    Object? meetAtCenter = freezed,
    Object? pickupAddress = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? pickupDistance = freezed,
    Object? isRescheduled = freezed,
    Object? timezone = freezed,
    Object? roadTestDocUrl = freezed,
    Object? g1LicenseDocUrl = freezed,
    Object? testCenterId = freezed,
    Object? testCenterName = freezed,
    Object? testCenterAddress = freezed,
    Object? testCenterLatitude = freezed,
    Object? testCenterLongitude = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? totalRideHour = freezed,
    Object? ridePrice = freezed,
  }) {
    return _then(_$RideImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      instructorId: freezed == instructorId
          ? _value.instructorId
          : instructorId // ignore: cast_nullable_to_non_nullable
              as int?,
      testType: freezed == testType
          ? _value.testType
          : testType // ignore: cast_nullable_to_non_nullable
              as String?,
      testDate: freezed == testDate
          ? _value.testDate
          : testDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      meetAtCenter: freezed == meetAtCenter
          ? _value.meetAtCenter
          : meetAtCenter // ignore: cast_nullable_to_non_nullable
              as bool?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupDistance: freezed == pickupDistance
          ? _value.pickupDistance
          : pickupDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      isRescheduled: freezed == isRescheduled
          ? _value.isRescheduled
          : isRescheduled // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      roadTestDocUrl: freezed == roadTestDocUrl
          ? _value.roadTestDocUrl
          : roadTestDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      g1LicenseDocUrl: freezed == g1LicenseDocUrl
          ? _value.g1LicenseDocUrl
          : g1LicenseDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterId: freezed == testCenterId
          ? _value.testCenterId
          : testCenterId // ignore: cast_nullable_to_non_nullable
              as int?,
      testCenterName: freezed == testCenterName
          ? _value.testCenterName
          : testCenterName // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterAddress: freezed == testCenterAddress
          ? _value.testCenterAddress
          : testCenterAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      testCenterLatitude: freezed == testCenterLatitude
          ? _value.testCenterLatitude
          : testCenterLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      testCenterLongitude: freezed == testCenterLongitude
          ? _value.testCenterLongitude
          : testCenterLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRideHour: freezed == totalRideHour
          ? _value.totalRideHour
          : totalRideHour // ignore: cast_nullable_to_non_nullable
              as double?,
      ridePrice: freezed == ridePrice
          ? _value.ridePrice
          : ridePrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideImpl implements _Ride {
  const _$RideImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "instructor_id") this.instructorId,
      @JsonKey(name: "test_type") this.testType,
      @JsonKey(name: "test_date") this.testDate,
      @JsonKey(name: "meet_at_center") this.meetAtCenter,
      @JsonKey(name: "pickup_address") this.pickupAddress,
      @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
      this.pickupLatitude,
      @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
      this.pickupLongitude,
      @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
      this.pickupDistance,
      @JsonKey(name: "is_rescheduled") this.isRescheduled,
      @JsonKey(name: "timezone") this.timezone,
      @JsonKey(name: "road_test_doc_url") this.roadTestDocUrl,
      @JsonKey(name: "g1_license_doc_url") this.g1LicenseDocUrl,
      @JsonKey(name: "test_center_id") this.testCenterId,
      @JsonKey(name: "test_center_name") this.testCenterName,
      @JsonKey(name: "test_center_address") this.testCenterAddress,
      @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
      this.testCenterLatitude,
      @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
      this.testCenterLongitude,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
      this.totalRideHour,
      @JsonKey(name: "ride_price") this.ridePrice});

  factory _$RideImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "instructor_id")
  final int? instructorId;
  @override
  @JsonKey(name: "test_type")
  final String? testType;
  @override
  @JsonKey(name: "test_date")
  final DateTime? testDate;
  @override
  @JsonKey(name: "meet_at_center")
  final bool? meetAtCenter;
  @override
  @JsonKey(name: "pickup_address")
  final String? pickupAddress;
  @override
  @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
  final double? pickupLatitude;
  @override
  @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
  final double? pickupLongitude;
  @override
  @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
  final double? pickupDistance;
  @override
  @JsonKey(name: "is_rescheduled")
  final bool? isRescheduled;
  @override
  @JsonKey(name: "timezone")
  final String? timezone;
  @override
  @JsonKey(name: "road_test_doc_url")
  final String? roadTestDocUrl;
  @override
  @JsonKey(name: "g1_license_doc_url")
  final String? g1LicenseDocUrl;

  /// Exposed to instructors alongside the centre's coordinates (§14.2), so a
  /// centre can be joined by id rather than matched on its name.
  @override
  @JsonKey(name: "test_center_id")
  final int? testCenterId;
  @override
  @JsonKey(name: "test_center_name")
  final String? testCenterName;
  @override
  @JsonKey(name: "test_center_address")
  final String? testCenterAddress;
  @override
  @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
  final double? testCenterLatitude;
  @override
  @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
  final double? testCenterLongitude;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
  final double? totalRideHour;
  @override
  @JsonKey(name: "ride_price")
  final int? ridePrice;

  @override
  String toString() {
    return 'Ride(id: $id, instructorId: $instructorId, testType: $testType, testDate: $testDate, meetAtCenter: $meetAtCenter, pickupAddress: $pickupAddress, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, pickupDistance: $pickupDistance, isRescheduled: $isRescheduled, timezone: $timezone, roadTestDocUrl: $roadTestDocUrl, g1LicenseDocUrl: $g1LicenseDocUrl, testCenterId: $testCenterId, testCenterName: $testCenterName, testCenterAddress: $testCenterAddress, testCenterLatitude: $testCenterLatitude, testCenterLongitude: $testCenterLongitude, fullName: $fullName, phoneNumber: $phoneNumber, totalRideHour: $totalRideHour, ridePrice: $ridePrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.instructorId, instructorId) ||
                other.instructorId == instructorId) &&
            (identical(other.testType, testType) ||
                other.testType == testType) &&
            (identical(other.testDate, testDate) ||
                other.testDate == testDate) &&
            (identical(other.meetAtCenter, meetAtCenter) ||
                other.meetAtCenter == meetAtCenter) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.pickupDistance, pickupDistance) ||
                other.pickupDistance == pickupDistance) &&
            (identical(other.isRescheduled, isRescheduled) ||
                other.isRescheduled == isRescheduled) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.roadTestDocUrl, roadTestDocUrl) ||
                other.roadTestDocUrl == roadTestDocUrl) &&
            (identical(other.g1LicenseDocUrl, g1LicenseDocUrl) ||
                other.g1LicenseDocUrl == g1LicenseDocUrl) &&
            (identical(other.testCenterId, testCenterId) ||
                other.testCenterId == testCenterId) &&
            (identical(other.testCenterName, testCenterName) ||
                other.testCenterName == testCenterName) &&
            (identical(other.testCenterAddress, testCenterAddress) ||
                other.testCenterAddress == testCenterAddress) &&
            (identical(other.testCenterLatitude, testCenterLatitude) ||
                other.testCenterLatitude == testCenterLatitude) &&
            (identical(other.testCenterLongitude, testCenterLongitude) ||
                other.testCenterLongitude == testCenterLongitude) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.totalRideHour, totalRideHour) ||
                other.totalRideHour == totalRideHour) &&
            (identical(other.ridePrice, ridePrice) ||
                other.ridePrice == ridePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        instructorId,
        testType,
        testDate,
        meetAtCenter,
        pickupAddress,
        pickupLatitude,
        pickupLongitude,
        pickupDistance,
        isRescheduled,
        timezone,
        roadTestDocUrl,
        g1LicenseDocUrl,
        testCenterId,
        testCenterName,
        testCenterAddress,
        testCenterLatitude,
        testCenterLongitude,
        fullName,
        phoneNumber,
        totalRideHour,
        ridePrice
      ]);

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      __$$RideImplCopyWithImpl<_$RideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideImplToJson(
      this,
    );
  }
}

abstract class _Ride implements Ride {
  const factory _Ride(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "instructor_id") final int? instructorId,
      @JsonKey(name: "test_type") final String? testType,
      @JsonKey(name: "test_date") final DateTime? testDate,
      @JsonKey(name: "meet_at_center") final bool? meetAtCenter,
      @JsonKey(name: "pickup_address") final String? pickupAddress,
      @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
      final double? pickupLatitude,
      @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
      final double? pickupLongitude,
      @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
      final double? pickupDistance,
      @JsonKey(name: "is_rescheduled") final bool? isRescheduled,
      @JsonKey(name: "timezone") final String? timezone,
      @JsonKey(name: "road_test_doc_url") final String? roadTestDocUrl,
      @JsonKey(name: "g1_license_doc_url") final String? g1LicenseDocUrl,
      @JsonKey(name: "test_center_id") final int? testCenterId,
      @JsonKey(name: "test_center_name") final String? testCenterName,
      @JsonKey(name: "test_center_address") final String? testCenterAddress,
      @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
      final double? testCenterLatitude,
      @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
      final double? testCenterLongitude,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
      final double? totalRideHour,
      @JsonKey(name: "ride_price") final int? ridePrice}) = _$RideImpl;

  factory _Ride.fromJson(Map<String, dynamic> json) = _$RideImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "instructor_id")
  int? get instructorId;
  @override
  @JsonKey(name: "test_type")
  String? get testType;
  @override
  @JsonKey(name: "test_date")
  DateTime? get testDate;
  @override
  @JsonKey(name: "meet_at_center")
  bool? get meetAtCenter;
  @override
  @JsonKey(name: "pickup_address")
  String? get pickupAddress;
  @override
  @JsonKey(name: "pickup_latitude", fromJson: _parseDouble)
  double? get pickupLatitude;
  @override
  @JsonKey(name: "pickup_longitude", fromJson: _parseDouble)
  double? get pickupLongitude;
  @override
  @JsonKey(name: "pickup_distance", fromJson: _parseDouble)
  double? get pickupDistance;
  @override
  @JsonKey(name: "is_rescheduled")
  bool? get isRescheduled;
  @override
  @JsonKey(name: "timezone")
  String? get timezone;
  @override
  @JsonKey(name: "road_test_doc_url")
  String? get roadTestDocUrl;
  @override
  @JsonKey(name: "g1_license_doc_url")
  String? get g1LicenseDocUrl;

  /// Exposed to instructors alongside the centre's coordinates (§14.2), so a
  /// centre can be joined by id rather than matched on its name.
  @override
  @JsonKey(name: "test_center_id")
  int? get testCenterId;
  @override
  @JsonKey(name: "test_center_name")
  String? get testCenterName;
  @override
  @JsonKey(name: "test_center_address")
  String? get testCenterAddress;
  @override
  @JsonKey(name: "test_center_latitude", fromJson: _parseDouble)
  double? get testCenterLatitude;
  @override
  @JsonKey(name: "test_center_longitude", fromJson: _parseDouble)
  double? get testCenterLongitude;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "total_ride_hour", fromJson: _parseDouble)
  double? get totalRideHour;
  @override
  @JsonKey(name: "ride_price")
  int? get ridePrice;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
