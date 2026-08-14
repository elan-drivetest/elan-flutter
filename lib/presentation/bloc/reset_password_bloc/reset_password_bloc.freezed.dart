// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) reset,
    required TResult Function(String hash, String password) submitNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? reset,
    TResult? Function(String hash, String password)? submitNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? reset,
    TResult Function(String hash, String password)? submitNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_SubmitNewPassword value) submitNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_SubmitNewPassword value)? submitNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_SubmitNewPassword value)? submitNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res, ResetPasswordEvent>;
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res, $Val extends ResetPasswordEvent>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ResetImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ResetPasswordEvent.reset(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetImplCopyWith<_$ResetImpl> get copyWith =>
      __$$ResetImplCopyWithImpl<_$ResetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) reset,
    required TResult Function(String hash, String password) submitNewPassword,
  }) {
    return reset(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? reset,
    TResult? Function(String hash, String password)? submitNewPassword,
  }) {
    return reset?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? reset,
    TResult Function(String hash, String password)? submitNewPassword,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_SubmitNewPassword value) submitNewPassword,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_SubmitNewPassword value)? submitNewPassword,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_SubmitNewPassword value)? submitNewPassword,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements ResetPasswordEvent {
  const factory _Reset({required final String email}) = _$ResetImpl;

  String get email;

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetImplCopyWith<_$ResetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitNewPasswordImplCopyWith<$Res> {
  factory _$$SubmitNewPasswordImplCopyWith(_$SubmitNewPasswordImpl value,
          $Res Function(_$SubmitNewPasswordImpl) then) =
      __$$SubmitNewPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String hash, String password});
}

/// @nodoc
class __$$SubmitNewPasswordImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$SubmitNewPasswordImpl>
    implements _$$SubmitNewPasswordImplCopyWith<$Res> {
  __$$SubmitNewPasswordImplCopyWithImpl(_$SubmitNewPasswordImpl _value,
      $Res Function(_$SubmitNewPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? password = null,
  }) {
    return _then(_$SubmitNewPasswordImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitNewPasswordImpl implements _SubmitNewPassword {
  const _$SubmitNewPasswordImpl({required this.hash, required this.password});

  @override
  final String hash;
  @override
  final String password;

  @override
  String toString() {
    return 'ResetPasswordEvent.submitNewPassword(hash: $hash, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitNewPasswordImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, password);

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitNewPasswordImplCopyWith<_$SubmitNewPasswordImpl> get copyWith =>
      __$$SubmitNewPasswordImplCopyWithImpl<_$SubmitNewPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) reset,
    required TResult Function(String hash, String password) submitNewPassword,
  }) {
    return submitNewPassword(hash, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? reset,
    TResult? Function(String hash, String password)? submitNewPassword,
  }) {
    return submitNewPassword?.call(hash, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? reset,
    TResult Function(String hash, String password)? submitNewPassword,
    required TResult orElse(),
  }) {
    if (submitNewPassword != null) {
      return submitNewPassword(hash, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_SubmitNewPassword value) submitNewPassword,
  }) {
    return submitNewPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_SubmitNewPassword value)? submitNewPassword,
  }) {
    return submitNewPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_SubmitNewPassword value)? submitNewPassword,
    required TResult orElse(),
  }) {
    if (submitNewPassword != null) {
      return submitNewPassword(this);
    }
    return orElse();
  }
}

abstract class _SubmitNewPassword implements ResetPasswordEvent {
  const factory _SubmitNewPassword(
      {required final String hash,
      required final String password}) = _$SubmitNewPasswordImpl;

  String get hash;
  String get password;

  /// Create a copy of ResetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitNewPasswordImplCopyWith<_$SubmitNewPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResetPasswordState _$ResetPasswordStateFromJson(Map<String, dynamic> json) {
  return _ResetPasswordState.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordState {
  ResetPasswordStatus get status => throw _privateConstructorUsedError;
  LoginErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_hint')
  String? get phoneHint => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {ResetPasswordStatus status,
      LoginErrorResponse? errorResponse,
      int? statusCode,
      String? message,
      @JsonKey(name: 'phone_hint') String? phoneHint});

  $LoginErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? phoneHint = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as LoginErrorResponse?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneHint: freezed == phoneHint
          ? _value.phoneHint
          : phoneHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ResetPasswordState
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
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResetPasswordStatus status,
      LoginErrorResponse? errorResponse,
      int? statusCode,
      String? message,
      @JsonKey(name: 'phone_hint') String? phoneHint});

  @override
  $LoginErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? phoneHint = freezed,
  }) {
    return _then(_$ResetPasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as LoginErrorResponse?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneHint: freezed == phoneHint
          ? _value.phoneHint
          : phoneHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordStateImpl implements _ResetPasswordState {
  const _$ResetPasswordStateImpl(
      {this.status = ResetPasswordStatus.initial,
      this.errorResponse,
      this.statusCode,
      this.message,
      @JsonKey(name: 'phone_hint') this.phoneHint});

  factory _$ResetPasswordStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordStateImplFromJson(json);

  @override
  @JsonKey()
  final ResetPasswordStatus status;
  @override
  final LoginErrorResponse? errorResponse;
  @override
  final int? statusCode;
  @override
  final String? message;
  @override
  @JsonKey(name: 'phone_hint')
  final String? phoneHint;

  @override
  String toString() {
    return 'ResetPasswordState(status: $status, errorResponse: $errorResponse, statusCode: $statusCode, message: $message, phoneHint: $phoneHint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.phoneHint, phoneHint) ||
                other.phoneHint == phoneHint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, errorResponse, statusCode, message, phoneHint);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordStateImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
          {final ResetPasswordStatus status,
          final LoginErrorResponse? errorResponse,
          final int? statusCode,
          final String? message,
          @JsonKey(name: 'phone_hint') final String? phoneHint}) =
      _$ResetPasswordStateImpl;

  factory _ResetPasswordState.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordStateImpl.fromJson;

  @override
  ResetPasswordStatus get status;
  @override
  LoginErrorResponse? get errorResponse;
  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  @JsonKey(name: 'phone_hint')
  String? get phoneHint;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
