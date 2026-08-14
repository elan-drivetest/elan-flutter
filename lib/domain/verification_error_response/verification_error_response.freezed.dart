// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationErrorResponse _$VerificationErrorResponseFromJson(
    Map<String, dynamic> json) {
  return _VerificationErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$VerificationErrorResponse {
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(
      name: "errors",
      fromJson: VerificationErrors.fromJson,
      toJson: VerificationErrors.toJson)
  VerificationErrors? get errors => throw _privateConstructorUsedError;

  /// Serializes this VerificationErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationErrorResponseCopyWith<VerificationErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationErrorResponseCopyWith<$Res> {
  factory $VerificationErrorResponseCopyWith(VerificationErrorResponse value,
          $Res Function(VerificationErrorResponse) then) =
      _$VerificationErrorResponseCopyWithImpl<$Res, VerificationErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(
          name: "errors",
          fromJson: VerificationErrors.fromJson,
          toJson: VerificationErrors.toJson)
      VerificationErrors? errors});

  $VerificationErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$VerificationErrorResponseCopyWithImpl<$Res,
        $Val extends VerificationErrorResponse>
    implements $VerificationErrorResponseCopyWith<$Res> {
  _$VerificationErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationErrorResponse
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
              as VerificationErrors?,
    ) as $Val);
  }

  /// Create a copy of VerificationErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $VerificationErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerificationErrorResponseImplCopyWith<$Res>
    implements $VerificationErrorResponseCopyWith<$Res> {
  factory _$$VerificationErrorResponseImplCopyWith(
          _$VerificationErrorResponseImpl value,
          $Res Function(_$VerificationErrorResponseImpl) then) =
      __$$VerificationErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(
          name: "errors",
          fromJson: VerificationErrors.fromJson,
          toJson: VerificationErrors.toJson)
      VerificationErrors? errors});

  @override
  $VerificationErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$VerificationErrorResponseImplCopyWithImpl<$Res>
    extends _$VerificationErrorResponseCopyWithImpl<$Res,
        _$VerificationErrorResponseImpl>
    implements _$$VerificationErrorResponseImplCopyWith<$Res> {
  __$$VerificationErrorResponseImplCopyWithImpl(
      _$VerificationErrorResponseImpl _value,
      $Res Function(_$VerificationErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$VerificationErrorResponseImpl(
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
              as VerificationErrors?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationErrorResponseImpl implements _VerificationErrorResponse {
  const _$VerificationErrorResponseImpl(
      {@JsonKey(name: "status_code") this.statusCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(
          name: "errors",
          fromJson: VerificationErrors.fromJson,
          toJson: VerificationErrors.toJson)
      this.errors});

  factory _$VerificationErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationErrorResponseImplFromJson(json);

  @override
  @JsonKey(name: "status_code")
  final int? statusCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(
      name: "errors",
      fromJson: VerificationErrors.fromJson,
      toJson: VerificationErrors.toJson)
  final VerificationErrors? errors;

  @override
  String toString() {
    return 'VerificationErrorResponse(statusCode: $statusCode, message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationErrorResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, errors);

  /// Create a copy of VerificationErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationErrorResponseImplCopyWith<_$VerificationErrorResponseImpl>
      get copyWith => __$$VerificationErrorResponseImplCopyWithImpl<
          _$VerificationErrorResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _VerificationErrorResponse implements VerificationErrorResponse {
  const factory _VerificationErrorResponse(
      {@JsonKey(name: "status_code") final int? statusCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(
          name: "errors",
          fromJson: VerificationErrors.fromJson,
          toJson: VerificationErrors.toJson)
      final VerificationErrors? errors}) = _$VerificationErrorResponseImpl;

  factory _VerificationErrorResponse.fromJson(Map<String, dynamic> json) =
      _$VerificationErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: "status_code")
  int? get statusCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(
      name: "errors",
      fromJson: VerificationErrors.fromJson,
      toJson: VerificationErrors.toJson)
  VerificationErrors? get errors;

  /// Create a copy of VerificationErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationErrorResponseImplCopyWith<_$VerificationErrorResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerificationErrors {
  @JsonKey(name: "otp")
  List<String>? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  List<String>? get email => throw _privateConstructorUsedError;

  /// Create a copy of VerificationErrors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationErrorsCopyWith<VerificationErrors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationErrorsCopyWith<$Res> {
  factory $VerificationErrorsCopyWith(
          VerificationErrors value, $Res Function(VerificationErrors) then) =
      _$VerificationErrorsCopyWithImpl<$Res, VerificationErrors>;
  @useResult
  $Res call(
      {@JsonKey(name: "otp") List<String>? otp,
      @JsonKey(name: "email") List<String>? email});
}

/// @nodoc
class _$VerificationErrorsCopyWithImpl<$Res, $Val extends VerificationErrors>
    implements $VerificationErrorsCopyWith<$Res> {
  _$VerificationErrorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationErrors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationErrorsImplCopyWith<$Res>
    implements $VerificationErrorsCopyWith<$Res> {
  factory _$$VerificationErrorsImplCopyWith(_$VerificationErrorsImpl value,
          $Res Function(_$VerificationErrorsImpl) then) =
      __$$VerificationErrorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "otp") List<String>? otp,
      @JsonKey(name: "email") List<String>? email});
}

/// @nodoc
class __$$VerificationErrorsImplCopyWithImpl<$Res>
    extends _$VerificationErrorsCopyWithImpl<$Res, _$VerificationErrorsImpl>
    implements _$$VerificationErrorsImplCopyWith<$Res> {
  __$$VerificationErrorsImplCopyWithImpl(_$VerificationErrorsImpl _value,
      $Res Function(_$VerificationErrorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationErrors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
  }) {
    return _then(_$VerificationErrorsImpl(
      otp: freezed == otp
          ? _value._otp
          : otp // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$VerificationErrorsImpl implements _VerificationErrors {
  const _$VerificationErrorsImpl(
      {@JsonKey(name: "otp") final List<String>? otp,
      @JsonKey(name: "email") final List<String>? email})
      : _otp = otp,
        _email = email;

  final List<String>? _otp;
  @override
  @JsonKey(name: "otp")
  List<String>? get otp {
    final value = _otp;
    if (value == null) return null;
    if (_otp is EqualUnmodifiableListView) return _otp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  @override
  String toString() {
    return 'VerificationErrors(otp: $otp, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationErrorsImpl &&
            const DeepCollectionEquality().equals(other._otp, _otp) &&
            const DeepCollectionEquality().equals(other._email, _email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_otp),
      const DeepCollectionEquality().hash(_email));

  /// Create a copy of VerificationErrors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationErrorsImplCopyWith<_$VerificationErrorsImpl> get copyWith =>
      __$$VerificationErrorsImplCopyWithImpl<_$VerificationErrorsImpl>(
          this, _$identity);
}

abstract class _VerificationErrors implements VerificationErrors {
  const factory _VerificationErrors(
          {@JsonKey(name: "otp") final List<String>? otp,
          @JsonKey(name: "email") final List<String>? email}) =
      _$VerificationErrorsImpl;

  @override
  @JsonKey(name: "otp")
  List<String>? get otp;
  @override
  @JsonKey(name: "email")
  List<String>? get email;

  /// Create a copy of VerificationErrors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationErrorsImplCopyWith<_$VerificationErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
