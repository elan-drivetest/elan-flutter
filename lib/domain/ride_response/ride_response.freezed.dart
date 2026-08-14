// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RideResponse _$RideResponseFromJson(Map<String, dynamic> json) {
  return _RideResponse.fromJson(json);
}

/// @nodoc
mixin _$RideResponse {
  @JsonKey(name: "data")
  List<Ride>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this RideResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideResponseCopyWith<RideResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideResponseCopyWith<$Res> {
  factory $RideResponseCopyWith(
          RideResponse value, $Res Function(RideResponse) then) =
      _$RideResponseCopyWithImpl<$Res, RideResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "data") List<Ride>? data,
      @JsonKey(name: "meta") Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$RideResponseCopyWithImpl<$Res, $Val extends RideResponse>
    implements $RideResponseCopyWith<$Res> {
  _$RideResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Ride>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RideResponseImplCopyWith<$Res>
    implements $RideResponseCopyWith<$Res> {
  factory _$$RideResponseImplCopyWith(
          _$RideResponseImpl value, $Res Function(_$RideResponseImpl) then) =
      __$$RideResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "data") List<Ride>? data,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$RideResponseImplCopyWithImpl<$Res>
    extends _$RideResponseCopyWithImpl<$Res, _$RideResponseImpl>
    implements _$$RideResponseImplCopyWith<$Res> {
  __$$RideResponseImplCopyWithImpl(
      _$RideResponseImpl _value, $Res Function(_$RideResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$RideResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Ride>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideResponseImpl implements _RideResponse {
  const _$RideResponseImpl(
      {@JsonKey(name: "data") final List<Ride>? data,
      @JsonKey(name: "meta") this.meta})
      : _data = data;

  factory _$RideResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideResponseImplFromJson(json);

  final List<Ride>? _data;
  @override
  @JsonKey(name: "data")
  List<Ride>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'RideResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideResponseImplCopyWith<_$RideResponseImpl> get copyWith =>
      __$$RideResponseImplCopyWithImpl<_$RideResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideResponseImplToJson(
      this,
    );
  }
}

abstract class _RideResponse implements RideResponse {
  const factory _RideResponse(
      {@JsonKey(name: "data") final List<Ride>? data,
      @JsonKey(name: "meta") final Meta? meta}) = _$RideResponseImpl;

  factory _RideResponse.fromJson(Map<String, dynamic> json) =
      _$RideResponseImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<Ride>? get data;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;

  /// Create a copy of RideResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideResponseImplCopyWith<_$RideResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
