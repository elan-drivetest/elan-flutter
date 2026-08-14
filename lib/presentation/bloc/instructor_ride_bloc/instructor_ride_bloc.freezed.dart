// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_ride_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstructorRideEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)
        start,
    required TResult Function(int? rideId, double? lat, double? lot) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult? Function(int? rideId, double? lat, double? lot)? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult Function(int? rideId, double? lat, double? lot)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorRideEventCopyWith<$Res> {
  factory $InstructorRideEventCopyWith(
          InstructorRideEvent value, $Res Function(InstructorRideEvent) then) =
      _$InstructorRideEventCopyWithImpl<$Res, InstructorRideEvent>;
}

/// @nodoc
class _$InstructorRideEventCopyWithImpl<$Res, $Val extends InstructorRideEvent>
    implements $InstructorRideEventCopyWith<$Res> {
  _$InstructorRideEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RequestDataImplCopyWith<$Res> {
  factory _$$RequestDataImplCopyWith(
          _$RequestDataImpl value, $Res Function(_$RequestDataImpl) then) =
      __$$RequestDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestDataImplCopyWithImpl<$Res>
    extends _$InstructorRideEventCopyWithImpl<$Res, _$RequestDataImpl>
    implements _$$RequestDataImplCopyWith<$Res> {
  __$$RequestDataImplCopyWithImpl(
      _$RequestDataImpl _value, $Res Function(_$RequestDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestDataImpl implements _RequestData {
  const _$RequestDataImpl();

  @override
  String toString() {
    return 'InstructorRideEvent.requestData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)
        start,
    required TResult Function(int? rideId, double? lat, double? lot) stop,
  }) {
    return requestData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult? Function(int? rideId, double? lat, double? lot)? stop,
  }) {
    return requestData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult Function(int? rideId, double? lat, double? lot)? stop,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
  }) {
    return requestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
  }) {
    return requestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData(this);
    }
    return orElse();
  }
}

abstract class _RequestData implements InstructorRideEvent {
  const factory _RequestData() = _$RequestDataImpl;
}

/// @nodoc
abstract class _$$StartImplCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? id,
      double? lat,
      double? lot,
      double? accuracy,
      double? speed,
      double? bearing,
      double? altitude,
      int? batteryLevel,
      String? timezone});
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$InstructorRideEventCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lot = freezed,
    Object? accuracy = freezed,
    Object? speed = freezed,
    Object? bearing = freezed,
    Object? altitude = freezed,
    Object? batteryLevel = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$StartImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lot: freezed == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      bearing: freezed == bearing
          ? _value.bearing
          : bearing // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StartImpl implements _Start {
  const _$StartImpl(
      {required this.id,
      required this.lat,
      required this.lot,
      required this.accuracy,
      required this.speed,
      required this.bearing,
      required this.altitude,
      required this.batteryLevel,
      required this.timezone});

  @override
  final int? id;
  @override
  final double? lat;
  @override
  final double? lot;
  @override
  final double? accuracy;
  @override
  final double? speed;
  @override
  final double? bearing;
  @override
  final double? altitude;
  @override
  final int? batteryLevel;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'InstructorRideEvent.start(id: $id, lat: $lat, lot: $lot, accuracy: $accuracy, speed: $speed, bearing: $bearing, altitude: $altitude, batteryLevel: $batteryLevel, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lot, lot) || other.lot == lot) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.bearing, bearing) || other.bearing == bearing) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, lat, lot, accuracy, speed,
      bearing, altitude, batteryLevel, timezone);

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)
        start,
    required TResult Function(int? rideId, double? lat, double? lot) stop,
  }) {
    return start(id, lat, lot, accuracy, speed, bearing, altitude, batteryLevel,
        timezone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult? Function(int? rideId, double? lat, double? lot)? stop,
  }) {
    return start?.call(id, lat, lot, accuracy, speed, bearing, altitude,
        batteryLevel, timezone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult Function(int? rideId, double? lat, double? lot)? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(id, lat, lot, accuracy, speed, bearing, altitude,
          batteryLevel, timezone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements InstructorRideEvent {
  const factory _Start(
      {required final int? id,
      required final double? lat,
      required final double? lot,
      required final double? accuracy,
      required final double? speed,
      required final double? bearing,
      required final double? altitude,
      required final int? batteryLevel,
      required final String? timezone}) = _$StartImpl;

  int? get id;
  double? get lat;
  double? get lot;
  double? get accuracy;
  double? get speed;
  double? get bearing;
  double? get altitude;
  int? get batteryLevel;
  String? get timezone;

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> {
  factory _$$StopImplCopyWith(
          _$StopImpl value, $Res Function(_$StopImpl) then) =
      __$$StopImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? rideId, double? lat, double? lot});
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$InstructorRideEventCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rideId = freezed,
    Object? lat = freezed,
    Object? lot = freezed,
  }) {
    return _then(_$StopImpl(
      rideId: freezed == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lot: freezed == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$StopImpl implements _Stop {
  const _$StopImpl(
      {required this.rideId, required this.lat, required this.lot});

  @override
  final int? rideId;
  @override
  final double? lat;
  @override
  final double? lot;

  @override
  String toString() {
    return 'InstructorRideEvent.stop(rideId: $rideId, lat: $lat, lot: $lot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopImpl &&
            (identical(other.rideId, rideId) || other.rideId == rideId) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lot, lot) || other.lot == lot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rideId, lat, lot);

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      __$$StopImplCopyWithImpl<_$StopImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)
        start,
    required TResult Function(int? rideId, double? lat, double? lot) stop,
  }) {
    return stop(rideId, lat, lot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult? Function(int? rideId, double? lat, double? lot)? stop,
  }) {
    return stop?.call(rideId, lat, lot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function(
            int? id,
            double? lat,
            double? lot,
            double? accuracy,
            double? speed,
            double? bearing,
            double? altitude,
            int? batteryLevel,
            String? timezone)?
        start,
    TResult Function(int? rideId, double? lat, double? lot)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(rideId, lat, lot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class _Stop implements InstructorRideEvent {
  const factory _Stop(
      {required final int? rideId,
      required final double? lat,
      required final double? lot}) = _$StopImpl;

  int? get rideId;
  double? get lat;
  double? get lot;

  /// Create a copy of InstructorRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InstructorRideState _$InstructorRideStateFromJson(Map<String, dynamic> json) {
  return _InstructorRideState.fromJson(json);
}

/// @nodoc
mixin _$InstructorRideState {
  InstructorRideStatus get status => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  RideSession? get currentRide => throw _privateConstructorUsedError;

  /// Serializes this InstructorRideState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorRideStateCopyWith<InstructorRideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorRideStateCopyWith<$Res> {
  factory $InstructorRideStateCopyWith(
          InstructorRideState value, $Res Function(InstructorRideState) then) =
      _$InstructorRideStateCopyWithImpl<$Res, InstructorRideState>;
  @useResult
  $Res call(
      {InstructorRideStatus status,
      ErrorResponse? errorResponse,
      RideSession? currentRide});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
  $RideSessionCopyWith<$Res>? get currentRide;
}

/// @nodoc
class _$InstructorRideStateCopyWithImpl<$Res, $Val extends InstructorRideState>
    implements $InstructorRideStateCopyWith<$Res> {
  _$InstructorRideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? currentRide = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstructorRideStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      currentRide: freezed == currentRide
          ? _value.currentRide
          : currentRide // ignore: cast_nullable_to_non_nullable
              as RideSession?,
    ) as $Val);
  }

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorResponseCopyWith<$Res>? get errorResponse {
    if (_value.errorResponse == null) {
      return null;
    }

    return $ErrorResponseCopyWith<$Res>(_value.errorResponse!, (value) {
      return _then(_value.copyWith(errorResponse: value) as $Val);
    });
  }

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideSessionCopyWith<$Res>? get currentRide {
    if (_value.currentRide == null) {
      return null;
    }

    return $RideSessionCopyWith<$Res>(_value.currentRide!, (value) {
      return _then(_value.copyWith(currentRide: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructorRideStateImplCopyWith<$Res>
    implements $InstructorRideStateCopyWith<$Res> {
  factory _$$InstructorRideStateImplCopyWith(_$InstructorRideStateImpl value,
          $Res Function(_$InstructorRideStateImpl) then) =
      __$$InstructorRideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InstructorRideStatus status,
      ErrorResponse? errorResponse,
      RideSession? currentRide});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
  @override
  $RideSessionCopyWith<$Res>? get currentRide;
}

/// @nodoc
class __$$InstructorRideStateImplCopyWithImpl<$Res>
    extends _$InstructorRideStateCopyWithImpl<$Res, _$InstructorRideStateImpl>
    implements _$$InstructorRideStateImplCopyWith<$Res> {
  __$$InstructorRideStateImplCopyWithImpl(_$InstructorRideStateImpl _value,
      $Res Function(_$InstructorRideStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? currentRide = freezed,
  }) {
    return _then(_$InstructorRideStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstructorRideStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      currentRide: freezed == currentRide
          ? _value.currentRide
          : currentRide // ignore: cast_nullable_to_non_nullable
              as RideSession?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructorRideStateImpl implements _InstructorRideState {
  const _$InstructorRideStateImpl(
      {this.status = InstructorRideStatus.initial,
      this.errorResponse,
      this.currentRide});

  factory _$InstructorRideStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorRideStateImplFromJson(json);

  @override
  @JsonKey()
  final InstructorRideStatus status;
  @override
  final ErrorResponse? errorResponse;
  @override
  final RideSession? currentRide;

  @override
  String toString() {
    return 'InstructorRideState(status: $status, errorResponse: $errorResponse, currentRide: $currentRide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorRideStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.currentRide, currentRide) ||
                other.currentRide == currentRide));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorResponse, currentRide);

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorRideStateImplCopyWith<_$InstructorRideStateImpl> get copyWith =>
      __$$InstructorRideStateImplCopyWithImpl<_$InstructorRideStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorRideStateImplToJson(
      this,
    );
  }
}

abstract class _InstructorRideState implements InstructorRideState {
  const factory _InstructorRideState(
      {final InstructorRideStatus status,
      final ErrorResponse? errorResponse,
      final RideSession? currentRide}) = _$InstructorRideStateImpl;

  factory _InstructorRideState.fromJson(Map<String, dynamic> json) =
      _$InstructorRideStateImpl.fromJson;

  @override
  InstructorRideStatus get status;
  @override
  ErrorResponse? get errorResponse;
  @override
  RideSession? get currentRide;

  /// Create a copy of InstructorRideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorRideStateImplCopyWith<_$InstructorRideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
