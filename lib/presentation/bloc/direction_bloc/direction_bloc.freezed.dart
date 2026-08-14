// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DirectionEvent {
  LatLng get origin => throw _privateConstructorUsedError;
  LatLng get destination => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng origin, LatLng destination)
        fetchDirections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LatLng origin, LatLng destination)? fetchDirections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng origin, LatLng destination)? fetchDirections,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDirections value) fetchDirections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDirections value)? fetchDirections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDirections value)? fetchDirections,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DirectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectionEventCopyWith<DirectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionEventCopyWith<$Res> {
  factory $DirectionEventCopyWith(
          DirectionEvent value, $Res Function(DirectionEvent) then) =
      _$DirectionEventCopyWithImpl<$Res, DirectionEvent>;
  @useResult
  $Res call({LatLng origin, LatLng destination});
}

/// @nodoc
class _$DirectionEventCopyWithImpl<$Res, $Val extends DirectionEvent>
    implements $DirectionEventCopyWith<$Res> {
  _$DirectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchDirectionsImplCopyWith<$Res>
    implements $DirectionEventCopyWith<$Res> {
  factory _$$FetchDirectionsImplCopyWith(_$FetchDirectionsImpl value,
          $Res Function(_$FetchDirectionsImpl) then) =
      __$$FetchDirectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LatLng origin, LatLng destination});
}

/// @nodoc
class __$$FetchDirectionsImplCopyWithImpl<$Res>
    extends _$DirectionEventCopyWithImpl<$Res, _$FetchDirectionsImpl>
    implements _$$FetchDirectionsImplCopyWith<$Res> {
  __$$FetchDirectionsImplCopyWithImpl(
      _$FetchDirectionsImpl _value, $Res Function(_$FetchDirectionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_$FetchDirectionsImpl(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$FetchDirectionsImpl implements _FetchDirections {
  const _$FetchDirectionsImpl(
      {required this.origin, required this.destination});

  @override
  final LatLng origin;
  @override
  final LatLng destination;

  @override
  String toString() {
    return 'DirectionEvent.fetchDirections(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDirectionsImpl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin, destination);

  /// Create a copy of DirectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDirectionsImplCopyWith<_$FetchDirectionsImpl> get copyWith =>
      __$$FetchDirectionsImplCopyWithImpl<_$FetchDirectionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng origin, LatLng destination)
        fetchDirections,
  }) {
    return fetchDirections(origin, destination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LatLng origin, LatLng destination)? fetchDirections,
  }) {
    return fetchDirections?.call(origin, destination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng origin, LatLng destination)? fetchDirections,
    required TResult orElse(),
  }) {
    if (fetchDirections != null) {
      return fetchDirections(origin, destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDirections value) fetchDirections,
  }) {
    return fetchDirections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDirections value)? fetchDirections,
  }) {
    return fetchDirections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDirections value)? fetchDirections,
    required TResult orElse(),
  }) {
    if (fetchDirections != null) {
      return fetchDirections(this);
    }
    return orElse();
  }
}

abstract class _FetchDirections implements DirectionEvent {
  const factory _FetchDirections(
      {required final LatLng origin,
      required final LatLng destination}) = _$FetchDirectionsImpl;

  @override
  LatLng get origin;
  @override
  LatLng get destination;

  /// Create a copy of DirectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchDirectionsImplCopyWith<_$FetchDirectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DirectionState {
  DirectionStatus get status => throw _privateConstructorUsedError;
  List<LatLng> get routePoints => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  ErrorResponse? get error => throw _privateConstructorUsedError;

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectionStateCopyWith<DirectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionStateCopyWith<$Res> {
  factory $DirectionStateCopyWith(
          DirectionState value, $Res Function(DirectionState) then) =
      _$DirectionStateCopyWithImpl<$Res, DirectionState>;
  @useResult
  $Res call(
      {DirectionStatus status,
      List<LatLng> routePoints,
      String distance,
      String duration,
      ErrorResponse? error});

  $ErrorResponseCopyWith<$Res>? get error;
}

/// @nodoc
class _$DirectionStateCopyWithImpl<$Res, $Val extends DirectionState>
    implements $DirectionStateCopyWith<$Res> {
  _$DirectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? routePoints = null,
    Object? distance = null,
    Object? duration = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DirectionStatus,
      routePoints: null == routePoints
          ? _value.routePoints
          : routePoints // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ) as $Val);
  }

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorResponseCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorResponseCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DirectionStateImplCopyWith<$Res>
    implements $DirectionStateCopyWith<$Res> {
  factory _$$DirectionStateImplCopyWith(_$DirectionStateImpl value,
          $Res Function(_$DirectionStateImpl) then) =
      __$$DirectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DirectionStatus status,
      List<LatLng> routePoints,
      String distance,
      String duration,
      ErrorResponse? error});

  @override
  $ErrorResponseCopyWith<$Res>? get error;
}

/// @nodoc
class __$$DirectionStateImplCopyWithImpl<$Res>
    extends _$DirectionStateCopyWithImpl<$Res, _$DirectionStateImpl>
    implements _$$DirectionStateImplCopyWith<$Res> {
  __$$DirectionStateImplCopyWithImpl(
      _$DirectionStateImpl _value, $Res Function(_$DirectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? routePoints = null,
    Object? distance = null,
    Object? duration = null,
    Object? error = freezed,
  }) {
    return _then(_$DirectionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DirectionStatus,
      routePoints: null == routePoints
          ? _value._routePoints
          : routePoints // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ));
  }
}

/// @nodoc

class _$DirectionStateImpl implements _DirectionState {
  const _$DirectionStateImpl(
      {this.status = DirectionStatus.initial,
      final List<LatLng> routePoints = const [],
      this.distance = '',
      this.duration = '',
      this.error})
      : _routePoints = routePoints;

  @override
  @JsonKey()
  final DirectionStatus status;
  final List<LatLng> _routePoints;
  @override
  @JsonKey()
  List<LatLng> get routePoints {
    if (_routePoints is EqualUnmodifiableListView) return _routePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routePoints);
  }

  @override
  @JsonKey()
  final String distance;
  @override
  @JsonKey()
  final String duration;
  @override
  final ErrorResponse? error;

  @override
  String toString() {
    return 'DirectionState(status: $status, routePoints: $routePoints, distance: $distance, duration: $duration, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._routePoints, _routePoints) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_routePoints),
      distance,
      duration,
      error);

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectionStateImplCopyWith<_$DirectionStateImpl> get copyWith =>
      __$$DirectionStateImplCopyWithImpl<_$DirectionStateImpl>(
          this, _$identity);
}

abstract class _DirectionState implements DirectionState {
  const factory _DirectionState(
      {final DirectionStatus status,
      final List<LatLng> routePoints,
      final String distance,
      final String duration,
      final ErrorResponse? error}) = _$DirectionStateImpl;

  @override
  DirectionStatus get status;
  @override
  List<LatLng> get routePoints;
  @override
  String get distance;
  @override
  String get duration;
  @override
  ErrorResponse? get error;

  /// Create a copy of DirectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectionStateImplCopyWith<_$DirectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
