// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshErrorResponse _$RefreshErrorResponseFromJson(Map<String, dynamic> json) {
  return _RefreshErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshErrorResponse {
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
  Errors? get errors => throw _privateConstructorUsedError;

  /// Serializes this RefreshErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshErrorResponseCopyWith<RefreshErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshErrorResponseCopyWith<$Res> {
  factory $RefreshErrorResponseCopyWith(RefreshErrorResponse value,
          $Res Function(RefreshErrorResponse) then) =
      _$RefreshErrorResponseCopyWithImpl<$Res, RefreshErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int? statusCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      Errors? errors});

  $ErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$RefreshErrorResponseCopyWithImpl<$Res,
        $Val extends RefreshErrorResponse>
    implements $RefreshErrorResponseCopyWith<$Res> {
  _$RefreshErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshErrorResponse
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

  /// Create a copy of RefreshErrorResponse
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
abstract class _$$RefreshErrorResponseImplCopyWith<$Res>
    implements $RefreshErrorResponseCopyWith<$Res> {
  factory _$$RefreshErrorResponseImplCopyWith(_$RefreshErrorResponseImpl value,
          $Res Function(_$RefreshErrorResponseImpl) then) =
      __$$RefreshErrorResponseImplCopyWithImpl<$Res>;
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
class __$$RefreshErrorResponseImplCopyWithImpl<$Res>
    extends _$RefreshErrorResponseCopyWithImpl<$Res, _$RefreshErrorResponseImpl>
    implements _$$RefreshErrorResponseImplCopyWith<$Res> {
  __$$RefreshErrorResponseImplCopyWithImpl(_$RefreshErrorResponseImpl _value,
      $Res Function(_$RefreshErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$RefreshErrorResponseImpl(
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
class _$RefreshErrorResponseImpl implements _RefreshErrorResponse {
  const _$RefreshErrorResponseImpl(
      {@JsonKey(name: "status_code") this.statusCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      this.errors});

  factory _$RefreshErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshErrorResponseImplFromJson(json);

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
    return 'RefreshErrorResponse(statusCode: $statusCode, message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshErrorResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, errors);

  /// Create a copy of RefreshErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshErrorResponseImplCopyWith<_$RefreshErrorResponseImpl>
      get copyWith =>
          __$$RefreshErrorResponseImplCopyWithImpl<_$RefreshErrorResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _RefreshErrorResponse implements RefreshErrorResponse {
  const factory _RefreshErrorResponse(
      {@JsonKey(name: "status_code") final int? statusCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
      final Errors? errors}) = _$RefreshErrorResponseImpl;

  factory _RefreshErrorResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: "status_code")
  int? get statusCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "errors", fromJson: Errors.fromJson, toJson: Errors.toJson)
  Errors? get errors;

  /// Create a copy of RefreshErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshErrorResponseImplCopyWith<_$RefreshErrorResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Errors {
  @JsonKey(name: "message")
  List<String>? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "statusCode")
  List<String>? get statusCode => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "message") List<String>? message,
      @JsonKey(name: "statusCode") List<String>? statusCode});
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
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "message") List<String>? message,
      @JsonKey(name: "statusCode") List<String>? statusCode});
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
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ErrorsImpl(
      message: freezed == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      statusCode: freezed == statusCode
          ? _value._statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ErrorsImpl implements _Errors {
  const _$ErrorsImpl(
      {@JsonKey(name: "message") final List<String>? message,
      @JsonKey(name: "statusCode") final List<String>? statusCode})
      : _message = message,
        _statusCode = statusCode;

  final List<String>? _message;
  @override
  @JsonKey(name: "message")
  List<String>? get message {
    final value = _message;
    if (value == null) return null;
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _statusCode;
  @override
  @JsonKey(name: "statusCode")
  List<String>? get statusCode {
    final value = _statusCode;
    if (value == null) return null;
    if (_statusCode is EqualUnmodifiableListView) return _statusCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Errors(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorsImpl &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            const DeepCollectionEquality()
                .equals(other._statusCode, _statusCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_message),
      const DeepCollectionEquality().hash(_statusCode));

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
          {@JsonKey(name: "message") final List<String>? message,
          @JsonKey(name: "statusCode") final List<String>? statusCode}) =
      _$ErrorsImpl;

  @override
  @JsonKey(name: "message")
  List<String>? get message;
  @override
  @JsonKey(name: "statusCode")
  List<String>? get statusCode;

  /// Create a copy of Errors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
