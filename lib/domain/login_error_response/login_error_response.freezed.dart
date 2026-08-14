// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginErrorResponse _$LoginErrorResponseFromJson(Map<String, dynamic> json) {
  return _LoginErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginErrorResponse {
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
  Errors? get errors => throw _privateConstructorUsedError;

  /// Serializes this LoginErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginErrorResponseCopyWith<LoginErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginErrorResponseCopyWith<$Res> {
  factory $LoginErrorResponseCopyWith(
          LoginErrorResponse value, $Res Function(LoginErrorResponse) then) =
      _$LoginErrorResponseCopyWithImpl<$Res, LoginErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      Errors? errors});

  $ErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$LoginErrorResponseCopyWithImpl<$Res, $Val extends LoginErrorResponse>
    implements $LoginErrorResponseCopyWith<$Res> {
  _$LoginErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Errors?,
    ) as $Val);
  }

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $ErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginErrorResponseImplCopyWith<$Res>
    implements $LoginErrorResponseCopyWith<$Res> {
  factory _$$LoginErrorResponseImplCopyWith(_$LoginErrorResponseImpl value,
          $Res Function(_$LoginErrorResponseImpl) then) =
      __$$LoginErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      Errors? errors});

  @override
  $ErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$LoginErrorResponseImplCopyWithImpl<$Res>
    extends _$LoginErrorResponseCopyWithImpl<$Res, _$LoginErrorResponseImpl>
    implements _$$LoginErrorResponseImplCopyWith<$Res> {
  __$$LoginErrorResponseImplCopyWithImpl(_$LoginErrorResponseImpl _value,
      $Res Function(_$LoginErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$LoginErrorResponseImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Errors?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginErrorResponseImpl implements _LoginErrorResponse {
  const _$LoginErrorResponseImpl(
      {@JsonKey(name: "status_code") this.statusCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      this.errors});

  factory _$LoginErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginErrorResponseImplFromJson(json);

  @override
  @JsonKey(name: "status_code")
  final int? statusCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
  final Errors? errors;

  @override
  String toString() {
    return 'LoginErrorResponse(statusCode: $statusCode, message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, errors);

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorResponseImplCopyWith<_$LoginErrorResponseImpl> get copyWith =>
      __$$LoginErrorResponseImplCopyWithImpl<_$LoginErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginErrorResponse implements LoginErrorResponse {
  const factory _LoginErrorResponse(
      {@JsonKey(name: "status_code") final int? statusCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      final Errors? errors}) = _$LoginErrorResponseImpl;

  factory _LoginErrorResponse.fromJson(Map<String, dynamic> json) =
      _$LoginErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: "status_code")
  int? get statusCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
  Errors? get errors;

  /// Create a copy of LoginErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorResponseImplCopyWith<_$LoginErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Errors {
  @JsonKey(name: "email")
  List<String>? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  List<String>? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  List<String>? get active => throw _privateConstructorUsedError;

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorsCopyWith<Errors> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorsCopyWith<$Res> {
  factory $ErrorsCopyWith(Errors value, $Res Function(Errors) then) =
      _$ErrorsCopyWithImpl<$Res, Errors>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") List<String>? email,
      @JsonKey(name: "password") List<String>? password,
      @JsonKey(name: "active") List<String>? active});
}

/// @nodoc
class _$ErrorsCopyWithImpl<$Res, $Val extends Errors>
    implements $ErrorsCopyWith<$Res> {
  _$ErrorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorsImplCopyWith<$Res> implements $ErrorsCopyWith<$Res> {
  factory _$$ErrorsImplCopyWith(
          _$ErrorsImpl value, $Res Function(_$ErrorsImpl) then) =
      __$$ErrorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") List<String>? email,
      @JsonKey(name: "password") List<String>? password,
      @JsonKey(name: "active") List<String>? active});
}

/// @nodoc
class __$$ErrorsImplCopyWithImpl<$Res>
    extends _$ErrorsCopyWithImpl<$Res, _$ErrorsImpl>
    implements _$$ErrorsImplCopyWith<$Res> {
  __$$ErrorsImplCopyWithImpl(
      _$ErrorsImpl _value, $Res Function(_$ErrorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? active = freezed,
  }) {
    return _then(_$ErrorsImpl(
      email: freezed == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value._password
          : password // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      active: freezed == active
          ? _value._active
          : active // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ErrorsImpl implements _Errors {
  const _$ErrorsImpl(
      {@JsonKey(name: "email") final List<String>? email,
      @JsonKey(name: "password") final List<String>? password,
      @JsonKey(name: "active") final List<String>? active})
      : _email = email,
        _password = password,
        _active = active;

  final List<String>? _email;
  @override
  @JsonKey(name: "email")
  List<String>? get email {
    final value = _email;
    if (value == null) return null;
    if (_email is EqualUnmodifiableListView) return _email;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _password;
  @override
  @JsonKey(name: "password")
  List<String>? get password {
    final value = _password;
    if (value == null) return null;
    if (_password is EqualUnmodifiableListView) return _password;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _active;
  @override
  @JsonKey(name: "active")
  List<String>? get active {
    final value = _active;
    if (value == null) return null;
    if (_active is EqualUnmodifiableListView) return _active;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Errors(email: $email, password: $password, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorsImpl &&
            const DeepCollectionEquality().equals(other._email, _email) &&
            const DeepCollectionEquality().equals(other._password, _password) &&
            const DeepCollectionEquality().equals(other._active, _active));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_email),
      const DeepCollectionEquality().hash(_password),
      const DeepCollectionEquality().hash(_active));

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
      __$$ErrorsImplCopyWithImpl<_$ErrorsImpl>(this, _$identity);
}

abstract class _Errors implements Errors {
  const factory _Errors(
      {@JsonKey(name: "email") final List<String>? email,
      @JsonKey(name: "password") final List<String>? password,
      @JsonKey(name: "active") final List<String>? active}) = _$ErrorsImpl;

  @override
  @JsonKey(name: "email")
  List<String>? get email;
  @override
  @JsonKey(name: "password")
  List<String>? get password;
  @override
  @JsonKey(name: "active")
  List<String>? get active;

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
