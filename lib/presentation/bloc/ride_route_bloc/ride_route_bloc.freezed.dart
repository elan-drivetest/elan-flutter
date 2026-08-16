// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_route_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RideRouteEvent {
  Ride get ride => throw _privateConstructorUsedError;
  LatLng? get currentPosition => throw _privateConstructorUsedError;
  LatLng? get testCentre => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Ride ride, LatLng? currentPosition, LatLng? testCentre)
        build,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Ride ride, LatLng? currentPosition, LatLng? testCentre)?
        build,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Ride ride, LatLng? currentPosition, LatLng? testCentre)?
        build,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Build value) build,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Build value)? build,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Build value)? build,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideRouteEventCopyWith<RideRouteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideRouteEventCopyWith<$Res> {
  factory $RideRouteEventCopyWith(
          RideRouteEvent value, $Res Function(RideRouteEvent) then) =
      _$RideRouteEventCopyWithImpl<$Res, RideRouteEvent>;
  @useResult
  $Res call({Ride ride, LatLng? currentPosition, LatLng? testCentre});

  $RideCopyWith<$Res> get ride;
}

/// @nodoc
class _$RideRouteEventCopyWithImpl<$Res, $Val extends RideRouteEvent>
    implements $RideRouteEventCopyWith<$Res> {
  _$RideRouteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ride = null,
    Object? currentPosition = freezed,
    Object? testCentre = freezed,
  }) {
    return _then(_value.copyWith(
      ride: null == ride
          ? _value.ride
          : ride // ignore: cast_nullable_to_non_nullable
              as Ride,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      testCentre: freezed == testCentre
          ? _value.testCentre
          : testCentre // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideCopyWith<$Res> get ride {
    return $RideCopyWith<$Res>(_value.ride, (value) {
      return _then(_value.copyWith(ride: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BuildImplCopyWith<$Res>
    implements $RideRouteEventCopyWith<$Res> {
  factory _$$BuildImplCopyWith(
          _$BuildImpl value, $Res Function(_$BuildImpl) then) =
      __$$BuildImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ride ride, LatLng? currentPosition, LatLng? testCentre});

  @override
  $RideCopyWith<$Res> get ride;
}

/// @nodoc
class __$$BuildImplCopyWithImpl<$Res>
    extends _$RideRouteEventCopyWithImpl<$Res, _$BuildImpl>
    implements _$$BuildImplCopyWith<$Res> {
  __$$BuildImplCopyWithImpl(
      _$BuildImpl _value, $Res Function(_$BuildImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ride = null,
    Object? currentPosition = freezed,
    Object? testCentre = freezed,
  }) {
    return _then(_$BuildImpl(
      ride: null == ride
          ? _value.ride
          : ride // ignore: cast_nullable_to_non_nullable
              as Ride,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      testCentre: freezed == testCentre
          ? _value.testCentre
          : testCentre // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$BuildImpl implements _Build {
  const _$BuildImpl(
      {required this.ride, this.currentPosition, this.testCentre});

  @override
  final Ride ride;
  @override
  final LatLng? currentPosition;
  @override
  final LatLng? testCentre;

  @override
  String toString() {
    return 'RideRouteEvent.build(ride: $ride, currentPosition: $currentPosition, testCentre: $testCentre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildImpl &&
            (identical(other.ride, ride) || other.ride == ride) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.testCentre, testCentre) ||
                other.testCentre == testCentre));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ride, currentPosition, testCentre);

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildImplCopyWith<_$BuildImpl> get copyWith =>
      __$$BuildImplCopyWithImpl<_$BuildImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Ride ride, LatLng? currentPosition, LatLng? testCentre)
        build,
  }) {
    return build(ride, currentPosition, testCentre);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Ride ride, LatLng? currentPosition, LatLng? testCentre)?
        build,
  }) {
    return build?.call(ride, currentPosition, testCentre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Ride ride, LatLng? currentPosition, LatLng? testCentre)?
        build,
    required TResult orElse(),
  }) {
    if (build != null) {
      return build(ride, currentPosition, testCentre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Build value) build,
  }) {
    return build(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Build value)? build,
  }) {
    return build?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Build value)? build,
    required TResult orElse(),
  }) {
    if (build != null) {
      return build(this);
    }
    return orElse();
  }
}

abstract class _Build implements RideRouteEvent {
  const factory _Build(
      {required final Ride ride,
      final LatLng? currentPosition,
      final LatLng? testCentre}) = _$BuildImpl;

  @override
  Ride get ride;
  @override
  LatLng? get currentPosition;
  @override
  LatLng? get testCentre;

  /// Create a copy of RideRouteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuildImplCopyWith<_$BuildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RideRouteState {
  RideRouteStatus get status => throw _privateConstructorUsedError;
  List<RideLeg> get legs => throw _privateConstructorUsedError;
  ErrorResponse? get error => throw _privateConstructorUsedError;

  /// Create a copy of RideRouteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideRouteStateCopyWith<RideRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideRouteStateCopyWith<$Res> {
  factory $RideRouteStateCopyWith(
          RideRouteState value, $Res Function(RideRouteState) then) =
      _$RideRouteStateCopyWithImpl<$Res, RideRouteState>;
  @useResult
  $Res call({RideRouteStatus status, List<RideLeg> legs, ErrorResponse? error});

  $ErrorResponseCopyWith<$Res>? get error;
}

/// @nodoc
class _$RideRouteStateCopyWithImpl<$Res, $Val extends RideRouteState>
    implements $RideRouteStateCopyWith<$Res> {
  _$RideRouteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideRouteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? legs = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RideRouteStatus,
      legs: null == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<RideLeg>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ) as $Val);
  }

  /// Create a copy of RideRouteState
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
abstract class _$$RideRouteStateImplCopyWith<$Res>
    implements $RideRouteStateCopyWith<$Res> {
  factory _$$RideRouteStateImplCopyWith(_$RideRouteStateImpl value,
          $Res Function(_$RideRouteStateImpl) then) =
      __$$RideRouteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RideRouteStatus status, List<RideLeg> legs, ErrorResponse? error});

  @override
  $ErrorResponseCopyWith<$Res>? get error;
}

/// @nodoc
class __$$RideRouteStateImplCopyWithImpl<$Res>
    extends _$RideRouteStateCopyWithImpl<$Res, _$RideRouteStateImpl>
    implements _$$RideRouteStateImplCopyWith<$Res> {
  __$$RideRouteStateImplCopyWithImpl(
      _$RideRouteStateImpl _value, $Res Function(_$RideRouteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideRouteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? legs = null,
    Object? error = freezed,
  }) {
    return _then(_$RideRouteStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RideRouteStatus,
      legs: null == legs
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<RideLeg>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ));
  }
}

/// @nodoc

class _$RideRouteStateImpl extends _RideRouteState {
  const _$RideRouteStateImpl(
      {this.status = RideRouteStatus.initial,
      final List<RideLeg> legs = const <RideLeg>[],
      this.error})
      : _legs = legs,
        super._();

  @override
  @JsonKey()
  final RideRouteStatus status;
  final List<RideLeg> _legs;
  @override
  @JsonKey()
  List<RideLeg> get legs {
    if (_legs is EqualUnmodifiableListView) return _legs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legs);
  }

  @override
  final ErrorResponse? error;

  @override
  String toString() {
    return 'RideRouteState(status: $status, legs: $legs, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideRouteStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._legs, _legs) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_legs), error);

  /// Create a copy of RideRouteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideRouteStateImplCopyWith<_$RideRouteStateImpl> get copyWith =>
      __$$RideRouteStateImplCopyWithImpl<_$RideRouteStateImpl>(
          this, _$identity);
}

abstract class _RideRouteState extends RideRouteState {
  const factory _RideRouteState(
      {final RideRouteStatus status,
      final List<RideLeg> legs,
      final ErrorResponse? error}) = _$RideRouteStateImpl;
  const _RideRouteState._() : super._();

  @override
  RideRouteStatus get status;
  @override
  List<RideLeg> get legs;
  @override
  ErrorResponse? get error;

  /// Create a copy of RideRouteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideRouteStateImplCopyWith<_$RideRouteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
