// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_ride_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailableRideEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function() refreshData,
    required TResult Function(String query) searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
    TResult? Function(String query)? searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    TResult Function(String query)? searchData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_SearchData value) searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_SearchData value)? searchData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_SearchData value)? searchData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableRideEventCopyWith<$Res> {
  factory $AvailableRideEventCopyWith(
          AvailableRideEvent value, $Res Function(AvailableRideEvent) then) =
      _$AvailableRideEventCopyWithImpl<$Res, AvailableRideEvent>;
}

/// @nodoc
class _$AvailableRideEventCopyWithImpl<$Res, $Val extends AvailableRideEvent>
    implements $AvailableRideEventCopyWith<$Res> {
  _$AvailableRideEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableRideEvent
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
    extends _$AvailableRideEventCopyWithImpl<$Res, _$RequestDataImpl>
    implements _$$RequestDataImplCopyWith<$Res> {
  __$$RequestDataImplCopyWithImpl(
      _$RequestDataImpl _value, $Res Function(_$RequestDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestDataImpl implements _RequestData {
  const _$RequestDataImpl();

  @override
  String toString() {
    return 'AvailableRideEvent.requestData()';
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
    required TResult Function(String query) searchData,
  }) {
    return requestData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
    TResult? Function(String query)? searchData,
  }) {
    return requestData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    TResult Function(String query)? searchData,
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
    required TResult Function(_SearchData value) searchData,
  }) {
    return requestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_SearchData value)? searchData,
  }) {
    return requestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_SearchData value)? searchData,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData(this);
    }
    return orElse();
  }
}

abstract class _RequestData implements AvailableRideEvent {
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
    extends _$AvailableRideEventCopyWithImpl<$Res, _$RefreshDataImpl>
    implements _$$RefreshDataImplCopyWith<$Res> {
  __$$RefreshDataImplCopyWithImpl(
      _$RefreshDataImpl _value, $Res Function(_$RefreshDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableRideEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshDataImpl implements _RefreshData {
  const _$RefreshDataImpl();

  @override
  String toString() {
    return 'AvailableRideEvent.refreshData()';
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
    required TResult Function(String query) searchData,
  }) {
    return refreshData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
    TResult? Function(String query)? searchData,
  }) {
    return refreshData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    TResult Function(String query)? searchData,
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
    required TResult Function(_SearchData value) searchData,
  }) {
    return refreshData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_SearchData value)? searchData,
  }) {
    return refreshData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_SearchData value)? searchData,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData(this);
    }
    return orElse();
  }
}

abstract class _RefreshData implements AvailableRideEvent {
  const factory _RefreshData() = _$RefreshDataImpl;
}

/// @nodoc
abstract class _$$SearchDataImplCopyWith<$Res> {
  factory _$$SearchDataImplCopyWith(
          _$SearchDataImpl value, $Res Function(_$SearchDataImpl) then) =
      __$$SearchDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchDataImplCopyWithImpl<$Res>
    extends _$AvailableRideEventCopyWithImpl<$Res, _$SearchDataImpl>
    implements _$$SearchDataImplCopyWith<$Res> {
  __$$SearchDataImplCopyWithImpl(
      _$SearchDataImpl _value, $Res Function(_$SearchDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchDataImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchDataImpl implements _SearchData {
  const _$SearchDataImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'AvailableRideEvent.searchData(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDataImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of AvailableRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDataImplCopyWith<_$SearchDataImpl> get copyWith =>
      __$$SearchDataImplCopyWithImpl<_$SearchDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestData,
    required TResult Function() refreshData,
    required TResult Function(String query) searchData,
  }) {
    return searchData(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestData,
    TResult? Function()? refreshData,
    TResult? Function(String query)? searchData,
  }) {
    return searchData?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestData,
    TResult Function()? refreshData,
    TResult Function(String query)? searchData,
    required TResult orElse(),
  }) {
    if (searchData != null) {
      return searchData(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestData value) requestData,
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_SearchData value) searchData,
  }) {
    return searchData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestData value)? requestData,
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_SearchData value)? searchData,
  }) {
    return searchData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestData value)? requestData,
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_SearchData value)? searchData,
    required TResult orElse(),
  }) {
    if (searchData != null) {
      return searchData(this);
    }
    return orElse();
  }
}

abstract class _SearchData implements AvailableRideEvent {
  const factory _SearchData({required final String query}) = _$SearchDataImpl;

  String get query;

  /// Create a copy of AvailableRideEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchDataImplCopyWith<_$SearchDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailableRideState _$AvailableRideStateFromJson(Map<String, dynamic> json) {
  return _AvailableRideState.fromJson(json);
}

/// @nodoc
mixin _$AvailableRideState {
  AvailableRideStatus get status => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  List<Ride>? get rides => throw _privateConstructorUsedError;

  /// Serializes this AvailableRideState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableRideStateCopyWith<AvailableRideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableRideStateCopyWith<$Res> {
  factory $AvailableRideStateCopyWith(
          AvailableRideState value, $Res Function(AvailableRideState) then) =
      _$AvailableRideStateCopyWithImpl<$Res, AvailableRideState>;
  @useResult
  $Res call(
      {AvailableRideStatus status,
      bool hasReachedMax,
      ErrorResponse? errorResponse,
      List<Ride>? rides});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$AvailableRideStateCopyWithImpl<$Res, $Val extends AvailableRideState>
    implements $AvailableRideStateCopyWith<$Res> {
  _$AvailableRideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableRideState
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
              as AvailableRideStatus,
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
              as List<Ride>?,
    ) as $Val);
  }

  /// Create a copy of AvailableRideState
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
abstract class _$$AvailableRideStateImplCopyWith<$Res>
    implements $AvailableRideStateCopyWith<$Res> {
  factory _$$AvailableRideStateImplCopyWith(_$AvailableRideStateImpl value,
          $Res Function(_$AvailableRideStateImpl) then) =
      __$$AvailableRideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AvailableRideStatus status,
      bool hasReachedMax,
      ErrorResponse? errorResponse,
      List<Ride>? rides});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$AvailableRideStateImplCopyWithImpl<$Res>
    extends _$AvailableRideStateCopyWithImpl<$Res, _$AvailableRideStateImpl>
    implements _$$AvailableRideStateImplCopyWith<$Res> {
  __$$AvailableRideStateImplCopyWithImpl(_$AvailableRideStateImpl _value,
      $Res Function(_$AvailableRideStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableRideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? hasReachedMax = null,
    Object? errorResponse = freezed,
    Object? rides = freezed,
  }) {
    return _then(_$AvailableRideStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AvailableRideStatus,
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
              as List<Ride>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableRideStateImpl implements _AvailableRideState {
  const _$AvailableRideStateImpl(
      {this.status = AvailableRideStatus.initial,
      this.hasReachedMax = false,
      this.errorResponse,
      final List<Ride>? rides})
      : _rides = rides;

  factory _$AvailableRideStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableRideStateImplFromJson(json);

  @override
  @JsonKey()
  final AvailableRideStatus status;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  final ErrorResponse? errorResponse;
  final List<Ride>? _rides;
  @override
  List<Ride>? get rides {
    final value = _rides;
    if (value == null) return null;
    if (_rides is EqualUnmodifiableListView) return _rides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AvailableRideState(status: $status, hasReachedMax: $hasReachedMax, errorResponse: $errorResponse, rides: $rides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableRideStateImpl &&
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

  /// Create a copy of AvailableRideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableRideStateImplCopyWith<_$AvailableRideStateImpl> get copyWith =>
      __$$AvailableRideStateImplCopyWithImpl<_$AvailableRideStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableRideStateImplToJson(
      this,
    );
  }
}

abstract class _AvailableRideState implements AvailableRideState {
  const factory _AvailableRideState(
      {final AvailableRideStatus status,
      final bool hasReachedMax,
      final ErrorResponse? errorResponse,
      final List<Ride>? rides}) = _$AvailableRideStateImpl;

  factory _AvailableRideState.fromJson(Map<String, dynamic> json) =
      _$AvailableRideStateImpl.fromJson;

  @override
  AvailableRideStatus get status;
  @override
  bool get hasReachedMax;
  @override
  ErrorResponse? get errorResponse;
  @override
  List<Ride>? get rides;

  /// Create a copy of AvailableRideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableRideStateImplCopyWith<_$AvailableRideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
