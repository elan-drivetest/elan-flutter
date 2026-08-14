// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_ride_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompleteRideEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function() refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_RefreshData value) refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRideEventCopyWith<$Res> {
  factory $CompleteRideEventCopyWith(
          CompleteRideEvent value, $Res Function(CompleteRideEvent) then) =
      _$CompleteRideEventCopyWithImpl<$Res, CompleteRideEvent>;
}

/// @nodoc
class _$CompleteRideEventCopyWithImpl<$Res, $Val extends CompleteRideEvent>
    implements $CompleteRideEventCopyWith<$Res> {
  _$CompleteRideEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRideEvent
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
    extends _$CompleteRideEventCopyWithImpl<$Res, _$RequestDataImpl>
    implements _$$RequestDataImplCopyWith<$Res> {
  __$$RequestDataImplCopyWithImpl(
      _$RequestDataImpl _value, $Res Function(_$RequestDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestDataImpl implements _RequestData {
  const _$RequestDataImpl();

  @override
  String toString() {
    return 'CompleteRideEvent.requestData()';
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
    required TResult Function() refreshData,
  }) {
    return requestData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
  }) {
    return requestData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
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
    required TResult Function(_RefreshData value) refreshData,
  }) {
    return requestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
  }) {
    return requestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData(this);
    }
    return orElse();
  }
}

abstract class _RequestData implements CompleteRideEvent {
  const factory _RequestData() = _$RequestDataImpl;
}

/// @nodoc
abstract class _$$RefreshDataImplCopyWith<$Res> {
  factory _$$RefreshDataImplCopyWith(
          _$RefreshDataImpl value, $Res Function(_$RefreshDataImpl) then) =
      __$$RefreshDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshDataImplCopyWithImpl<$Res>
    extends _$CompleteRideEventCopyWithImpl<$Res, _$RefreshDataImpl>
    implements _$$RefreshDataImplCopyWith<$Res> {
  __$$RefreshDataImplCopyWithImpl(
      _$RefreshDataImpl _value, $Res Function(_$RefreshDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshDataImpl implements _RefreshData {
  const _$RefreshDataImpl();

  @override
  String toString() {
    return 'CompleteRideEvent.refreshData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function() refreshData,
  }) {
    return refreshData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
  }) {
    return refreshData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_RefreshData value) refreshData,
  }) {
    return refreshData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
  }) {
    return refreshData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData(this);
    }
    return orElse();
  }
}

abstract class _RefreshData implements CompleteRideEvent {
  const factory _RefreshData() = _$RefreshDataImpl;
}

CompleteRideState _$CompleteRideStateFromJson(Map<String, dynamic> json) {
  return _CompleteRideState.fromJson(json);
}

/// @nodoc
mixin _$CompleteRideState {
  CompleteRideStatus get status => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  List<CompleteRide>? get rides => throw _privateConstructorUsedError;

  /// Serializes this CompleteRideState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteRideStateCopyWith<CompleteRideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRideStateCopyWith<$Res> {
  factory $CompleteRideStateCopyWith(
          CompleteRideState value, $Res Function(CompleteRideState) then) =
      _$CompleteRideStateCopyWithImpl<$Res, CompleteRideState>;
  @useResult
  $Res call(
      {CompleteRideStatus status,
      bool hasReachedMax,
      ErrorResponse? errorResponse,
      List<CompleteRide>? rides});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$CompleteRideStateCopyWithImpl<$Res, $Val extends CompleteRideState>
    implements $CompleteRideStateCopyWith<$Res> {
  _$CompleteRideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? hasReachedMax = null,
    Object? errorResponse = freezed,
    Object? rides = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompleteRideStatus,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      rides: freezed == rides
          ? _value.rides
          : rides // ignore: cast_nullable_to_non_nullable
              as List<CompleteRide>?,
    ) as $Val);
  }

  /// Create a copy of CompleteRideState
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
}

/// @nodoc
abstract class _$$CompleteRideStateImplCopyWith<$Res>
    implements $CompleteRideStateCopyWith<$Res> {
  factory _$$CompleteRideStateImplCopyWith(_$CompleteRideStateImpl value,
          $Res Function(_$CompleteRideStateImpl) then) =
      __$$CompleteRideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CompleteRideStatus status,
      bool hasReachedMax,
      ErrorResponse? errorResponse,
      List<CompleteRide>? rides});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$CompleteRideStateImplCopyWithImpl<$Res>
    extends _$CompleteRideStateCopyWithImpl<$Res, _$CompleteRideStateImpl>
    implements _$$CompleteRideStateImplCopyWith<$Res> {
  __$$CompleteRideStateImplCopyWithImpl(_$CompleteRideStateImpl _value,
      $Res Function(_$CompleteRideStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? hasReachedMax = null,
    Object? errorResponse = freezed,
    Object? rides = freezed,
  }) {
    return _then(_$CompleteRideStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CompleteRideStatus,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      rides: freezed == rides
          ? _value._rides
          : rides // ignore: cast_nullable_to_non_nullable
              as List<CompleteRide>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteRideStateImpl implements _CompleteRideState {
  const _$CompleteRideStateImpl(
      {this.status = CompleteRideStatus.initial,
      this.hasReachedMax = false,
      this.errorResponse,
      final List<CompleteRide>? rides})
      : _rides = rides;

  factory _$CompleteRideStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteRideStateImplFromJson(json);

  @override
  @JsonKey()
  final CompleteRideStatus status;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  final ErrorResponse? errorResponse;
  final List<CompleteRide>? _rides;
  @override
  List<CompleteRide>? get rides {
    final value = _rides;
    if (value == null) return null;
    if (_rides is EqualUnmodifiableListView) return _rides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CompleteRideState(status: $status, hasReachedMax: $hasReachedMax, errorResponse: $errorResponse, rides: $rides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRideStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            const DeepCollectionEquality().equals(other._rides, _rides));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, hasReachedMax,
      errorResponse, const DeepCollectionEquality().hash(_rides));

  /// Create a copy of CompleteRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRideStateImplCopyWith<_$CompleteRideStateImpl> get copyWith =>
      __$$CompleteRideStateImplCopyWithImpl<_$CompleteRideStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteRideStateImplToJson(
      this,
    );
  }
}

abstract class _CompleteRideState implements CompleteRideState {
  const factory _CompleteRideState(
      {final CompleteRideStatus status,
      final bool hasReachedMax,
      final ErrorResponse? errorResponse,
      final List<CompleteRide>? rides}) = _$CompleteRideStateImpl;

  factory _CompleteRideState.fromJson(Map<String, dynamic> json) =
      _$CompleteRideStateImpl.fromJson;

  @override
  CompleteRideStatus get status;
  @override
  bool get hasReachedMax;
  @override
  ErrorResponse? get errorResponse;
  @override
  List<CompleteRide>? get rides;

  /// Create a copy of CompleteRideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRideStateImplCopyWith<_$CompleteRideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
