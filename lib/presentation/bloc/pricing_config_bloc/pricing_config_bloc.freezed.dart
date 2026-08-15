// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_config_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PricingConfigEvent {
  bool get forceRefresh => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) fetchPricingConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? fetchPricingConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? fetchPricingConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPricingConfig value) fetchPricingConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPricingConfig value)? fetchPricingConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPricingConfig value)? fetchPricingConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PricingConfigEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingConfigEventCopyWith<PricingConfigEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingConfigEventCopyWith<$Res> {
  factory $PricingConfigEventCopyWith(
          PricingConfigEvent value, $Res Function(PricingConfigEvent) then) =
      _$PricingConfigEventCopyWithImpl<$Res, PricingConfigEvent>;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class _$PricingConfigEventCopyWithImpl<$Res, $Val extends PricingConfigEvent>
    implements $PricingConfigEventCopyWith<$Res> {
  _$PricingConfigEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingConfigEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(_value.copyWith(
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchPricingConfigImplCopyWith<$Res>
    implements $PricingConfigEventCopyWith<$Res> {
  factory _$$FetchPricingConfigImplCopyWith(_$FetchPricingConfigImpl value,
          $Res Function(_$FetchPricingConfigImpl) then) =
      __$$FetchPricingConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class __$$FetchPricingConfigImplCopyWithImpl<$Res>
    extends _$PricingConfigEventCopyWithImpl<$Res, _$FetchPricingConfigImpl>
    implements _$$FetchPricingConfigImplCopyWith<$Res> {
  __$$FetchPricingConfigImplCopyWithImpl(_$FetchPricingConfigImpl _value,
      $Res Function(_$FetchPricingConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingConfigEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(_$FetchPricingConfigImpl(
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchPricingConfigImpl implements _FetchPricingConfig {
  const _$FetchPricingConfigImpl({this.forceRefresh = false});

  @override
  @JsonKey()
  final bool forceRefresh;

  @override
  String toString() {
    return 'PricingConfigEvent.fetchPricingConfig(forceRefresh: $forceRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPricingConfigImpl &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  /// Create a copy of PricingConfigEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPricingConfigImplCopyWith<_$FetchPricingConfigImpl> get copyWith =>
      __$$FetchPricingConfigImplCopyWithImpl<_$FetchPricingConfigImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) fetchPricingConfig,
  }) {
    return fetchPricingConfig(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? fetchPricingConfig,
  }) {
    return fetchPricingConfig?.call(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? fetchPricingConfig,
    required TResult orElse(),
  }) {
    if (fetchPricingConfig != null) {
      return fetchPricingConfig(forceRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPricingConfig value) fetchPricingConfig,
  }) {
    return fetchPricingConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPricingConfig value)? fetchPricingConfig,
  }) {
    return fetchPricingConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPricingConfig value)? fetchPricingConfig,
    required TResult orElse(),
  }) {
    if (fetchPricingConfig != null) {
      return fetchPricingConfig(this);
    }
    return orElse();
  }
}

abstract class _FetchPricingConfig implements PricingConfigEvent {
  const factory _FetchPricingConfig({final bool forceRefresh}) =
      _$FetchPricingConfigImpl;

  @override
  bool get forceRefresh;

  /// Create a copy of PricingConfigEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchPricingConfigImplCopyWith<_$FetchPricingConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PricingConfigState _$PricingConfigStateFromJson(Map<String, dynamic> json) {
  return _PricingConfigState.fromJson(json);
}

/// @nodoc
mixin _$PricingConfigState {
  PricingConfigStatus get status => throw _privateConstructorUsedError;
  PricingConfigResponse? get config => throw _privateConstructorUsedError;
  LoginErrorResponse? get errorResponse => throw _privateConstructorUsedError;

  /// Serializes this PricingConfigState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingConfigStateCopyWith<PricingConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingConfigStateCopyWith<$Res> {
  factory $PricingConfigStateCopyWith(
          PricingConfigState value, $Res Function(PricingConfigState) then) =
      _$PricingConfigStateCopyWithImpl<$Res, PricingConfigState>;
  @useResult
  $Res call(
      {PricingConfigStatus status,
      PricingConfigResponse? config,
      LoginErrorResponse? errorResponse});

  $PricingConfigResponseCopyWith<$Res>? get config;
  $LoginErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$PricingConfigStateCopyWithImpl<$Res, $Val extends PricingConfigState>
    implements $PricingConfigStateCopyWith<$Res> {
  _$PricingConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? config = freezed,
    Object? errorResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PricingConfigStatus,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PricingConfigResponse?,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as LoginErrorResponse?,
    ) as $Val);
  }

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricingConfigResponseCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $PricingConfigResponseCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginErrorResponseCopyWith<$Res>? get errorResponse {
    if (_value.errorResponse == null) {
      return null;
    }

    return $LoginErrorResponseCopyWith<$Res>(_value.errorResponse!, (value) {
      return _then(_value.copyWith(errorResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PricingConfigStateImplCopyWith<$Res>
    implements $PricingConfigStateCopyWith<$Res> {
  factory _$$PricingConfigStateImplCopyWith(_$PricingConfigStateImpl value,
          $Res Function(_$PricingConfigStateImpl) then) =
      __$$PricingConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PricingConfigStatus status,
      PricingConfigResponse? config,
      LoginErrorResponse? errorResponse});

  @override
  $PricingConfigResponseCopyWith<$Res>? get config;
  @override
  $LoginErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$PricingConfigStateImplCopyWithImpl<$Res>
    extends _$PricingConfigStateCopyWithImpl<$Res, _$PricingConfigStateImpl>
    implements _$$PricingConfigStateImplCopyWith<$Res> {
  __$$PricingConfigStateImplCopyWithImpl(_$PricingConfigStateImpl _value,
      $Res Function(_$PricingConfigStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? config = freezed,
    Object? errorResponse = freezed,
  }) {
    return _then(_$PricingConfigStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PricingConfigStatus,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PricingConfigResponse?,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as LoginErrorResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingConfigStateImpl implements _PricingConfigState {
  const _$PricingConfigStateImpl(
      {this.status = PricingConfigStatus.initial,
      this.config,
      this.errorResponse});

  factory _$PricingConfigStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingConfigStateImplFromJson(json);

  @override
  @JsonKey()
  final PricingConfigStatus status;
  @override
  final PricingConfigResponse? config;
  @override
  final LoginErrorResponse? errorResponse;

  @override
  String toString() {
    return 'PricingConfigState(status: $status, config: $config, errorResponse: $errorResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingConfigStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, config, errorResponse);

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingConfigStateImplCopyWith<_$PricingConfigStateImpl> get copyWith =>
      __$$PricingConfigStateImplCopyWithImpl<_$PricingConfigStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingConfigStateImplToJson(
      this,
    );
  }
}

abstract class _PricingConfigState implements PricingConfigState {
  const factory _PricingConfigState(
      {final PricingConfigStatus status,
      final PricingConfigResponse? config,
      final LoginErrorResponse? errorResponse}) = _$PricingConfigStateImpl;

  factory _PricingConfigState.fromJson(Map<String, dynamic> json) =
      _$PricingConfigStateImpl.fromJson;

  @override
  PricingConfigStatus get status;
  @override
  PricingConfigResponse? get config;
  @override
  LoginErrorResponse? get errorResponse;

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingConfigStateImplCopyWith<_$PricingConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
