// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterErrorResponse _$RegisterErrorResponseFromJson(
    Map<String, dynamic> json) {
  return _RegisterErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterErrorResponse {
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "errors")
  Errors? get errors => throw _privateConstructorUsedError;

  /// Serializes this RegisterErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterErrorResponseCopyWith<RegisterErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterErrorResponseCopyWith<$Res> {
  factory $RegisterErrorResponseCopyWith(RegisterErrorResponse value,
          $Res Function(RegisterErrorResponse) then) =
      _$RegisterErrorResponseCopyWithImpl<$Res, RegisterErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "errors") Errors? errors});

  $ErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$RegisterErrorResponseCopyWithImpl<$Res,
        $Val extends RegisterErrorResponse>
    implements $RegisterErrorResponseCopyWith<$Res> {
  _$RegisterErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterErrorResponse
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

  /// Create a copy of RegisterErrorResponse
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
abstract class _$$RegisterErrorResponseImplCopyWith<$Res>
    implements $RegisterErrorResponseCopyWith<$Res> {
  factory _$$RegisterErrorResponseImplCopyWith(
          _$RegisterErrorResponseImpl value,
          $Res Function(_$RegisterErrorResponseImpl) then) =
      __$$RegisterErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "errors") Errors? errors});

  @override
  $ErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$RegisterErrorResponseImplCopyWithImpl<$Res>
    extends _$RegisterErrorResponseCopyWithImpl<$Res,
        _$RegisterErrorResponseImpl>
    implements _$$RegisterErrorResponseImplCopyWith<$Res> {
  __$$RegisterErrorResponseImplCopyWithImpl(_$RegisterErrorResponseImpl _value,
      $Res Function(_$RegisterErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$RegisterErrorResponseImpl(
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
class _$RegisterErrorResponseImpl implements _RegisterErrorResponse {
  const _$RegisterErrorResponseImpl(
      {@JsonKey(name: "status_code") this.statusCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "errors") this.errors});

  factory _$RegisterErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterErrorResponseImplFromJson(json);

  @override
  @JsonKey(name: "status_code")
  final int? statusCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "errors")
  final Errors? errors;

  @override
  String toString() {
    return 'RegisterErrorResponse(statusCode: $statusCode, message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, errors);

  /// Create a copy of RegisterErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorResponseImplCopyWith<_$RegisterErrorResponseImpl>
      get copyWith => __$$RegisterErrorResponseImplCopyWithImpl<
          _$RegisterErrorResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _RegisterErrorResponse implements RegisterErrorResponse {
  const factory _RegisterErrorResponse(
          {@JsonKey(name: "status_code") final int? statusCode,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "errors") final Errors? errors}) =
      _$RegisterErrorResponseImpl;

  factory _RegisterErrorResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: "status_code")
  int? get statusCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "errors")
  Errors? get errors;

  /// Create a copy of RegisterErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterErrorResponseImplCopyWith<_$RegisterErrorResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Errors _$ErrorsFromJson(Map<String, dynamic> json) {
  return _Errors.fromJson(json);
}

/// @nodoc
mixin _$Errors {
  @JsonKey(name: "full_name")
  @StringListConverter()
  List<String>? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  @StringListConverter()
  List<String>? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  @StringListConverter()
  List<String>? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  @StringListConverter()
  List<String>? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  @StringListConverter()
  List<String>? get address => throw _privateConstructorUsedError;

  /// Serializes this Errors to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "full_name")
      @StringListConverter()
      List<String>? fullName,
      @JsonKey(name: "email") @StringListConverter() List<String>? email,
      @JsonKey(name: "password") @StringListConverter() List<String>? password,
      @JsonKey(name: "phone_number")
      @StringListConverter()
      List<String>? phoneNumber,
      @JsonKey(name: "address") @StringListConverter() List<String>? address});
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
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "full_name")
      @StringListConverter()
      List<String>? fullName,
      @JsonKey(name: "email") @StringListConverter() List<String>? email,
      @JsonKey(name: "password") @StringListConverter() List<String>? password,
      @JsonKey(name: "phone_number")
      @StringListConverter()
      List<String>? phoneNumber,
      @JsonKey(name: "address") @StringListConverter() List<String>? address});
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
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
  }) {
    return _then(_$ErrorsImpl(
      fullName: freezed == fullName
          ? _value._fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value._password
          : password // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      phoneNumber: freezed == phoneNumber
          ? _value._phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      address: freezed == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorsImpl implements _Errors {
  const _$ErrorsImpl(
      {@JsonKey(name: "full_name")
      @StringListConverter()
      final List<String>? fullName,
      @JsonKey(name: "email") @StringListConverter() final List<String>? email,
      @JsonKey(name: "password")
      @StringListConverter()
      final List<String>? password,
      @JsonKey(name: "phone_number")
      @StringListConverter()
      final List<String>? phoneNumber,
      @JsonKey(name: "address")
      @StringListConverter()
      final List<String>? address})
      : _fullName = fullName,
        _email = email,
        _password = password,
        _phoneNumber = phoneNumber,
        _address = address;

  factory _$ErrorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorsImplFromJson(json);

  final List<String>? _fullName;
  @override
  @JsonKey(name: "full_name")
  @StringListConverter()
  List<String>? get fullName {
    final value = _fullName;
    if (value == null) return null;
    if (_fullName is EqualUnmodifiableListView) return _fullName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _email;
  @override
  @JsonKey(name: "email")
  @StringListConverter()
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
  @StringListConverter()
  List<String>? get password {
    final value = _password;
    if (value == null) return null;
    if (_password is EqualUnmodifiableListView) return _password;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _phoneNumber;
  @override
  @JsonKey(name: "phone_number")
  @StringListConverter()
  List<String>? get phoneNumber {
    final value = _phoneNumber;
    if (value == null) return null;
    if (_phoneNumber is EqualUnmodifiableListView) return _phoneNumber;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _address;
  @override
  @JsonKey(name: "address")
  @StringListConverter()
  List<String>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Errors(fullName: $fullName, email: $email, password: $password, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorsImpl &&
            const DeepCollectionEquality().equals(other._fullName, _fullName) &&
            const DeepCollectionEquality().equals(other._email, _email) &&
            const DeepCollectionEquality().equals(other._password, _password) &&
            const DeepCollectionEquality()
                .equals(other._phoneNumber, _phoneNumber) &&
            const DeepCollectionEquality().equals(other._address, _address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_fullName),
      const DeepCollectionEquality().hash(_email),
      const DeepCollectionEquality().hash(_password),
      const DeepCollectionEquality().hash(_phoneNumber),
      const DeepCollectionEquality().hash(_address));

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
      __$$ErrorsImplCopyWithImpl<_$ErrorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorsImplToJson(
      this,
    );
  }
}

abstract class _Errors implements Errors {
  const factory _Errors(
      {@JsonKey(name: "full_name")
      @StringListConverter()
      final List<String>? fullName,
      @JsonKey(name: "email") @StringListConverter() final List<String>? email,
      @JsonKey(name: "password")
      @StringListConverter()
      final List<String>? password,
      @JsonKey(name: "phone_number")
      @StringListConverter()
      final List<String>? phoneNumber,
      @JsonKey(name: "address")
      @StringListConverter()
      final List<String>? address}) = _$ErrorsImpl;

  factory _Errors.fromJson(Map<String, dynamic> json) = _$ErrorsImpl.fromJson;

  @override
  @JsonKey(name: "full_name")
  @StringListConverter()
  List<String>? get fullName;
  @override
  @JsonKey(name: "email")
  @StringListConverter()
  List<String>? get email;
  @override
  @JsonKey(name: "password")
  @StringListConverter()
  List<String>? get password;
  @override
  @JsonKey(name: "phone_number")
  @StringListConverter()
  List<String>? get phoneNumber;
  @override
  @JsonKey(name: "address")
  @StringListConverter()
  List<String>? get address;

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
