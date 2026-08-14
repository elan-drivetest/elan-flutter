// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmEmailEvent {
  String get hash => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) confirmEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String hash)? confirmEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? confirmEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmEmail value) confirmEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmEmail value)? confirmEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmEmail value)? confirmEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ConfirmEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmEmailEventCopyWith<ConfirmEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmEmailEventCopyWith<$Res> {
  factory $ConfirmEmailEventCopyWith(
          ConfirmEmailEvent value, $Res Function(ConfirmEmailEvent) then) =
      _$ConfirmEmailEventCopyWithImpl<$Res, ConfirmEmailEvent>;
  @useResult
  $Res call({String hash});
}

/// @nodoc
class _$ConfirmEmailEventCopyWithImpl<$Res, $Val extends ConfirmEmailEvent>
    implements $ConfirmEmailEventCopyWith<$Res> {
  _$ConfirmEmailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmEmailImplCopyWith<$Res>
    implements $ConfirmEmailEventCopyWith<$Res> {
  factory _$$ConfirmEmailImplCopyWith(
          _$ConfirmEmailImpl value, $Res Function(_$ConfirmEmailImpl) then) =
      __$$ConfirmEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash});
}

/// @nodoc
class __$$ConfirmEmailImplCopyWithImpl<$Res>
    extends _$ConfirmEmailEventCopyWithImpl<$Res, _$ConfirmEmailImpl>
    implements _$$ConfirmEmailImplCopyWith<$Res> {
  __$$ConfirmEmailImplCopyWithImpl(
      _$ConfirmEmailImpl _value, $Res Function(_$ConfirmEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_$ConfirmEmailImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmEmailImpl implements _ConfirmEmail {
  const _$ConfirmEmailImpl({required this.hash});

  @override
  final String hash;

  @override
  String toString() {
    return 'ConfirmEmailEvent.confirmEmail(hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmEmailImpl &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash);

  /// Create a copy of ConfirmEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmEmailImplCopyWith<_$ConfirmEmailImpl> get copyWith =>
      __$$ConfirmEmailImplCopyWithImpl<_$ConfirmEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) confirmEmail,
  }) {
    return confirmEmail(hash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String hash)? confirmEmail,
  }) {
    return confirmEmail?.call(hash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? confirmEmail,
    required TResult orElse(),
  }) {
    if (confirmEmail != null) {
      return confirmEmail(hash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmEmail value) confirmEmail,
  }) {
    return confirmEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmEmail value)? confirmEmail,
  }) {
    return confirmEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmEmail value)? confirmEmail,
    required TResult orElse(),
  }) {
    if (confirmEmail != null) {
      return confirmEmail(this);
    }
    return orElse();
  }
}

abstract class _ConfirmEmail implements ConfirmEmailEvent {
  const factory _ConfirmEmail({required final String hash}) =
      _$ConfirmEmailImpl;

  @override
  String get hash;

  /// Create a copy of ConfirmEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmEmailImplCopyWith<_$ConfirmEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfirmEmailState _$ConfirmEmailStateFromJson(Map<String, dynamic> json) {
  return _ConfirmEmailState.fromJson(json);
}

/// @nodoc
mixin _$ConfirmEmailState {
  ConfirmEmailStatus get status => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this ConfirmEmailState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmEmailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmEmailStateCopyWith<ConfirmEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmEmailStateCopyWith<$Res> {
  factory $ConfirmEmailStateCopyWith(
          ConfirmEmailState value, $Res Function(ConfirmEmailState) then) =
      _$ConfirmEmailStateCopyWithImpl<$Res, ConfirmEmailState>;
  @useResult
  $Res call(
      {ConfirmEmailStatus status,
      ErrorResponse? errorResponse,
      int? statusCode});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$ConfirmEmailStateCopyWithImpl<$Res, $Val extends ConfirmEmailState>
    implements $ConfirmEmailStateCopyWith<$Res> {
  _$ConfirmEmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmEmailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConfirmEmailStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ConfirmEmailState
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
abstract class _$$ConfirmEmailStateImplCopyWith<$Res>
    implements $ConfirmEmailStateCopyWith<$Res> {
  factory _$$ConfirmEmailStateImplCopyWith(_$ConfirmEmailStateImpl value,
          $Res Function(_$ConfirmEmailStateImpl) then) =
      __$$ConfirmEmailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConfirmEmailStatus status,
      ErrorResponse? errorResponse,
      int? statusCode});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$ConfirmEmailStateImplCopyWithImpl<$Res>
    extends _$ConfirmEmailStateCopyWithImpl<$Res, _$ConfirmEmailStateImpl>
    implements _$$ConfirmEmailStateImplCopyWith<$Res> {
  __$$ConfirmEmailStateImplCopyWithImpl(_$ConfirmEmailStateImpl _value,
      $Res Function(_$ConfirmEmailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmEmailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ConfirmEmailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConfirmEmailStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmEmailStateImpl implements _ConfirmEmailState {
  const _$ConfirmEmailStateImpl(
      {this.status = ConfirmEmailStatus.initial,
      this.errorResponse,
      this.statusCode});

  factory _$ConfirmEmailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmEmailStateImplFromJson(json);

  @override
  @JsonKey()
  final ConfirmEmailStatus status;
  @override
  final ErrorResponse? errorResponse;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ConfirmEmailState(status: $status, errorResponse: $errorResponse, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmEmailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorResponse, statusCode);

  /// Create a copy of ConfirmEmailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmEmailStateImplCopyWith<_$ConfirmEmailStateImpl> get copyWith =>
      __$$ConfirmEmailStateImplCopyWithImpl<_$ConfirmEmailStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmEmailStateImplToJson(
      this,
    );
  }
}

abstract class _ConfirmEmailState implements ConfirmEmailState {
  const factory _ConfirmEmailState(
      {final ConfirmEmailStatus status,
      final ErrorResponse? errorResponse,
      final int? statusCode}) = _$ConfirmEmailStateImpl;

  factory _ConfirmEmailState.fromJson(Map<String, dynamic> json) =
      _$ConfirmEmailStateImpl.fromJson;

  @override
  ConfirmEmailStatus get status;
  @override
  ErrorResponse? get errorResponse;
  @override
  int? get statusCode;

  /// Create a copy of ConfirmEmailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmEmailStateImplCopyWith<_$ConfirmEmailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
