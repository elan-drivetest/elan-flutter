// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstructorSummaryResponse _$InstructorSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _InstructorSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$InstructorSummaryResponse {
  @JsonKey(name: "available_balance")
  num? get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "withdrawn")
  num? get withdrawn => throw _privateConstructorUsedError;
  @JsonKey(name: "total_completed_rides")
  int? get totalCompletedRides => throw _privateConstructorUsedError;

  /// Serializes this InstructorSummaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstructorSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorSummaryResponseCopyWith<InstructorSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorSummaryResponseCopyWith<$Res> {
  factory $InstructorSummaryResponseCopyWith(InstructorSummaryResponse value,
          $Res Function(InstructorSummaryResponse) then) =
      _$InstructorSummaryResponseCopyWithImpl<$Res, InstructorSummaryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "available_balance") num? availableBalance,
      @JsonKey(name: "withdrawn") num? withdrawn,
      @JsonKey(name: "total_completed_rides") int? totalCompletedRides});
}

/// @nodoc
class _$InstructorSummaryResponseCopyWithImpl<$Res,
        $Val extends InstructorSummaryResponse>
    implements $InstructorSummaryResponseCopyWith<$Res> {
  _$InstructorSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? withdrawn = freezed,
    Object? totalCompletedRides = freezed,
  }) {
    return _then(_value.copyWith(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      withdrawn: freezed == withdrawn
          ? _value.withdrawn
          : withdrawn // ignore: cast_nullable_to_non_nullable
              as num?,
      totalCompletedRides: freezed == totalCompletedRides
          ? _value.totalCompletedRides
          : totalCompletedRides // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructorSummaryResponseImplCopyWith<$Res>
    implements $InstructorSummaryResponseCopyWith<$Res> {
  factory _$$InstructorSummaryResponseImplCopyWith(
          _$InstructorSummaryResponseImpl value,
          $Res Function(_$InstructorSummaryResponseImpl) then) =
      __$$InstructorSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "available_balance") num? availableBalance,
      @JsonKey(name: "withdrawn") num? withdrawn,
      @JsonKey(name: "total_completed_rides") int? totalCompletedRides});
}

/// @nodoc
class __$$InstructorSummaryResponseImplCopyWithImpl<$Res>
    extends _$InstructorSummaryResponseCopyWithImpl<$Res,
        _$InstructorSummaryResponseImpl>
    implements _$$InstructorSummaryResponseImplCopyWith<$Res> {
  __$$InstructorSummaryResponseImplCopyWithImpl(
      _$InstructorSummaryResponseImpl _value,
      $Res Function(_$InstructorSummaryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? withdrawn = freezed,
    Object? totalCompletedRides = freezed,
  }) {
    return _then(_$InstructorSummaryResponseImpl(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      withdrawn: freezed == withdrawn
          ? _value.withdrawn
          : withdrawn // ignore: cast_nullable_to_non_nullable
              as num?,
      totalCompletedRides: freezed == totalCompletedRides
          ? _value.totalCompletedRides
          : totalCompletedRides // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructorSummaryResponseImpl implements _InstructorSummaryResponse {
  const _$InstructorSummaryResponseImpl(
      {@JsonKey(name: "available_balance") this.availableBalance,
      @JsonKey(name: "withdrawn") this.withdrawn,
      @JsonKey(name: "total_completed_rides") this.totalCompletedRides});

  factory _$InstructorSummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorSummaryResponseImplFromJson(json);

  @override
  @JsonKey(name: "available_balance")
  final num? availableBalance;
  @override
  @JsonKey(name: "withdrawn")
  final num? withdrawn;
  @override
  @JsonKey(name: "total_completed_rides")
  final int? totalCompletedRides;

  @override
  String toString() {
    return 'InstructorSummaryResponse(availableBalance: $availableBalance, withdrawn: $withdrawn, totalCompletedRides: $totalCompletedRides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorSummaryResponseImpl &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.withdrawn, withdrawn) ||
                other.withdrawn == withdrawn) &&
            (identical(other.totalCompletedRides, totalCompletedRides) ||
                other.totalCompletedRides == totalCompletedRides));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, availableBalance, withdrawn, totalCompletedRides);

  /// Create a copy of InstructorSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorSummaryResponseImplCopyWith<_$InstructorSummaryResponseImpl>
      get copyWith => __$$InstructorSummaryResponseImplCopyWithImpl<
          _$InstructorSummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _InstructorSummaryResponse implements InstructorSummaryResponse {
  const factory _InstructorSummaryResponse(
      {@JsonKey(name: "available_balance") final num? availableBalance,
      @JsonKey(name: "withdrawn") final num? withdrawn,
      @JsonKey(name: "total_completed_rides")
      final int? totalCompletedRides}) = _$InstructorSummaryResponseImpl;

  factory _InstructorSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$InstructorSummaryResponseImpl.fromJson;

  @override
  @JsonKey(name: "available_balance")
  num? get availableBalance;
  @override
  @JsonKey(name: "withdrawn")
  num? get withdrawn;
  @override
  @JsonKey(name: "total_completed_rides")
  int? get totalCompletedRides;

  /// Create a copy of InstructorSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorSummaryResponseImplCopyWith<_$InstructorSummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
