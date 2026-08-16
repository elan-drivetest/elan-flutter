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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPricingConfig value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPricingConfig value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPricingConfig value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingConfigEventCopyWith<$Res> {
  factory $PricingConfigEventCopyWith(
          PricingConfigEvent value, $Res Function(PricingConfigEvent) then) =
      _$PricingConfigEventCopyWithImpl<$Res, PricingConfigEvent>;
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
}

/// @nodoc
abstract class _$$FetchPricingConfigImplCopyWith<$Res> {
  factory _$$FetchPricingConfigImplCopyWith(_$FetchPricingConfigImpl value,
          $Res Function(_$FetchPricingConfigImpl) then) =
      __$$FetchPricingConfigImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$FetchPricingConfigImpl implements _FetchPricingConfig {
  const _$FetchPricingConfigImpl();

  @override
  String toString() {
    return 'PricingConfigEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchPricingConfigImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPricingConfig value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPricingConfig value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPricingConfig value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchPricingConfig implements PricingConfigEvent {
  const factory _FetchPricingConfig() = _$FetchPricingConfigImpl;
}

/// @nodoc
mixin _$PricingConfigState {
  PricingConfigStatus get status => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;

  /// Always populated — defaults before the first fetch, cached values after a
  /// cold start, live values once the fetch lands. Never null, so no call site
  /// needs a null check or a loading branch.
  PricingConfig get config => throw _privateConstructorUsedError;

  /// True while [config] is compiled-in defaults or a cached copy rather than
  /// a fresh server response. Use it to decide whether to show a stale-data
  /// hint — not to gate rendering.
  bool get isFallback => throw _privateConstructorUsedError;

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
      ErrorResponse? errorResponse,
      PricingConfig config,
      bool isFallback});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
  $PricingConfigCopyWith<$Res> get config;
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
    Object? errorResponse = freezed,
    Object? config = null,
    Object? isFallback = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PricingConfigStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PricingConfig,
      isFallback: null == isFallback
          ? _value.isFallback
          : isFallback // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PricingConfigState
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

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricingConfigCopyWith<$Res> get config {
    return $PricingConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
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
      ErrorResponse? errorResponse,
      PricingConfig config,
      bool isFallback});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
  @override
  $PricingConfigCopyWith<$Res> get config;
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
    Object? errorResponse = freezed,
    Object? config = null,
    Object? isFallback = null,
  }) {
    return _then(_$PricingConfigStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PricingConfigStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PricingConfig,
      isFallback: null == isFallback
          ? _value.isFallback
          : isFallback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PricingConfigStateImpl implements _PricingConfigState {
  const _$PricingConfigStateImpl(
      {this.status = PricingConfigStatus.initial,
      this.errorResponse,
      this.config = const PricingConfig(),
      this.isFallback = true});

  @override
  @JsonKey()
  final PricingConfigStatus status;
  @override
  final ErrorResponse? errorResponse;

  /// Always populated — defaults before the first fetch, cached values after a
  /// cold start, live values once the fetch lands. Never null, so no call site
  /// needs a null check or a loading branch.
  @override
  @JsonKey()
  final PricingConfig config;

  /// True while [config] is compiled-in defaults or a cached copy rather than
  /// a fresh server response. Use it to decide whether to show a stale-data
  /// hint — not to gate rendering.
  @override
  @JsonKey()
  final bool isFallback;

  @override
  String toString() {
    return 'PricingConfigState(status: $status, errorResponse: $errorResponse, config: $config, isFallback: $isFallback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingConfigStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isFallback, isFallback) ||
                other.isFallback == isFallback));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorResponse, config, isFallback);

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingConfigStateImplCopyWith<_$PricingConfigStateImpl> get copyWith =>
      __$$PricingConfigStateImplCopyWithImpl<_$PricingConfigStateImpl>(
          this, _$identity);
}

abstract class _PricingConfigState implements PricingConfigState {
  const factory _PricingConfigState(
      {final PricingConfigStatus status,
      final ErrorResponse? errorResponse,
      final PricingConfig config,
      final bool isFallback}) = _$PricingConfigStateImpl;

  @override
  PricingConfigStatus get status;
  @override
  ErrorResponse? get errorResponse;

  /// Always populated — defaults before the first fetch, cached values after a
  /// cold start, live values once the fetch lands. Never null, so no call site
  /// needs a null check or a loading branch.
  @override
  PricingConfig get config;

  /// True while [config] is compiled-in defaults or a cached copy rather than
  /// a fresh server response. Use it to decide whether to show a stale-data
  /// hint — not to gate rendering.
  @override
  bool get isFallback;

  /// Create a copy of PricingConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingConfigStateImplCopyWith<_$PricingConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
