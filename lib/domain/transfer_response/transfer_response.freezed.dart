// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferResponse _$TransferResponseFromJson(Map<String, dynamic> json) {
  return _TransferResponse.fromJson(json);
}

/// @nodoc
mixin _$TransferResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "transfer_reason")
  String? get transferReason => throw _privateConstructorUsedError;

  /// Serializes this TransferResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferResponseCopyWith<TransferResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferResponseCopyWith<$Res> {
  factory $TransferResponseCopyWith(
          TransferResponse value, $Res Function(TransferResponse) then) =
      _$TransferResponseCopyWithImpl<$Res, TransferResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "transfer_reason") String? transferReason});
}

/// @nodoc
class _$TransferResponseCopyWithImpl<$Res, $Val extends TransferResponse>
    implements $TransferResponseCopyWith<$Res> {
  _$TransferResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transferReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transferReason: freezed == transferReason
          ? _value.transferReason
          : transferReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferResponseImplCopyWith<$Res>
    implements $TransferResponseCopyWith<$Res> {
  factory _$$TransferResponseImplCopyWith(_$TransferResponseImpl value,
          $Res Function(_$TransferResponseImpl) then) =
      __$$TransferResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "transfer_reason") String? transferReason});
}

/// @nodoc
class __$$TransferResponseImplCopyWithImpl<$Res>
    extends _$TransferResponseCopyWithImpl<$Res, _$TransferResponseImpl>
    implements _$$TransferResponseImplCopyWith<$Res> {
  __$$TransferResponseImplCopyWithImpl(_$TransferResponseImpl _value,
      $Res Function(_$TransferResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transferReason = freezed,
  }) {
    return _then(_$TransferResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transferReason: freezed == transferReason
          ? _value.transferReason
          : transferReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferResponseImpl implements _TransferResponse {
  const _$TransferResponseImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "transfer_reason") this.transferReason});

  factory _$TransferResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "transfer_reason")
  final String? transferReason;

  @override
  String toString() {
    return 'TransferResponse(id: $id, transferReason: $transferReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transferReason, transferReason) ||
                other.transferReason == transferReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, transferReason);

  /// Create a copy of TransferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferResponseImplCopyWith<_$TransferResponseImpl> get copyWith =>
      __$$TransferResponseImplCopyWithImpl<_$TransferResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferResponseImplToJson(
      this,
    );
  }
}

abstract class _TransferResponse implements TransferResponse {
  const factory _TransferResponse(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "transfer_reason") final String? transferReason}) =
      _$TransferResponseImpl;

  factory _TransferResponse.fromJson(Map<String, dynamic> json) =
      _$TransferResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "transfer_reason")
  String? get transferReason;

  /// Create a copy of TransferResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferResponseImplCopyWith<_$TransferResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
