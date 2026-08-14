// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EarningsSummary _$EarningsSummaryFromJson(Map<String, dynamic> json) {
  return _EarningsSummary.fromJson(json);
}

/// @nodoc
mixin _$EarningsSummary {
  @JsonKey(name: "available_balance")
  int? get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "withdrawn")
  int? get withdrawn => throw _privateConstructorUsedError;
  @JsonKey(name: "total_completed_rides")
  int? get totalCompletedRides => throw _privateConstructorUsedError;
  @JsonKey(name: "hourly_rate")
  int? get hourlyRate => throw _privateConstructorUsedError;

  /// Serializes this EarningsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsSummaryCopyWith<EarningsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsSummaryCopyWith<$Res> {
  factory $EarningsSummaryCopyWith(
          EarningsSummary value, $Res Function(EarningsSummary) then) =
      _$EarningsSummaryCopyWithImpl<$Res, EarningsSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: "available_balance") int? availableBalance,
      @JsonKey(name: "withdrawn") int? withdrawn,
      @JsonKey(name: "total_completed_rides") int? totalCompletedRides,
      @JsonKey(name: "hourly_rate") int? hourlyRate});
}

/// @nodoc
class _$EarningsSummaryCopyWithImpl<$Res, $Val extends EarningsSummary>
    implements $EarningsSummaryCopyWith<$Res> {
  _$EarningsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? withdrawn = freezed,
    Object? totalCompletedRides = freezed,
    Object? hourlyRate = freezed,
  }) {
    return _then(_value.copyWith(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      withdrawn: freezed == withdrawn
          ? _value.withdrawn
          : withdrawn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCompletedRides: freezed == totalCompletedRides
          ? _value.totalCompletedRides
          : totalCompletedRides // ignore: cast_nullable_to_non_nullable
              as int?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarningsSummaryImplCopyWith<$Res>
    implements $EarningsSummaryCopyWith<$Res> {
  factory _$$EarningsSummaryImplCopyWith(_$EarningsSummaryImpl value,
          $Res Function(_$EarningsSummaryImpl) then) =
      __$$EarningsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "available_balance") int? availableBalance,
      @JsonKey(name: "withdrawn") int? withdrawn,
      @JsonKey(name: "total_completed_rides") int? totalCompletedRides,
      @JsonKey(name: "hourly_rate") int? hourlyRate});
}

/// @nodoc
class __$$EarningsSummaryImplCopyWithImpl<$Res>
    extends _$EarningsSummaryCopyWithImpl<$Res, _$EarningsSummaryImpl>
    implements _$$EarningsSummaryImplCopyWith<$Res> {
  __$$EarningsSummaryImplCopyWithImpl(
      _$EarningsSummaryImpl _value, $Res Function(_$EarningsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? withdrawn = freezed,
    Object? totalCompletedRides = freezed,
    Object? hourlyRate = freezed,
  }) {
    return _then(_$EarningsSummaryImpl(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      withdrawn: freezed == withdrawn
          ? _value.withdrawn
          : withdrawn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCompletedRides: freezed == totalCompletedRides
          ? _value.totalCompletedRides
          : totalCompletedRides // ignore: cast_nullable_to_non_nullable
              as int?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsSummaryImpl implements _EarningsSummary {
  const _$EarningsSummaryImpl(
      {@JsonKey(name: "available_balance") this.availableBalance,
      @JsonKey(name: "withdrawn") this.withdrawn,
      @JsonKey(name: "total_completed_rides") this.totalCompletedRides,
      @JsonKey(name: "hourly_rate") this.hourlyRate});

  factory _$EarningsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsSummaryImplFromJson(json);

  @override
  @JsonKey(name: "available_balance")
  final int? availableBalance;
  @override
  @JsonKey(name: "withdrawn")
  final int? withdrawn;
  @override
  @JsonKey(name: "total_completed_rides")
  final int? totalCompletedRides;
  @override
  @JsonKey(name: "hourly_rate")
  final int? hourlyRate;

  @override
  String toString() {
    return 'EarningsSummary(availableBalance: $availableBalance, withdrawn: $withdrawn, totalCompletedRides: $totalCompletedRides, hourlyRate: $hourlyRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsSummaryImpl &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.withdrawn, withdrawn) ||
                other.withdrawn == withdrawn) &&
            (identical(other.totalCompletedRides, totalCompletedRides) ||
                other.totalCompletedRides == totalCompletedRides) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, availableBalance, withdrawn,
      totalCompletedRides, hourlyRate);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      __$$EarningsSummaryImplCopyWithImpl<_$EarningsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsSummaryImplToJson(
      this,
    );
  }
}

abstract class _EarningsSummary implements EarningsSummary {
  const factory _EarningsSummary(
      {@JsonKey(name: "available_balance") final int? availableBalance,
      @JsonKey(name: "withdrawn") final int? withdrawn,
      @JsonKey(name: "total_completed_rides") final int? totalCompletedRides,
      @JsonKey(name: "hourly_rate")
      final int? hourlyRate}) = _$EarningsSummaryImpl;

  factory _EarningsSummary.fromJson(Map<String, dynamic> json) =
      _$EarningsSummaryImpl.fromJson;

  @override
  @JsonKey(name: "available_balance")
  int? get availableBalance;
  @override
  @JsonKey(name: "withdrawn")
  int? get withdrawn;
  @override
  @JsonKey(name: "total_completed_rides")
  int? get totalCompletedRides;
  @override
  @JsonKey(name: "hourly_rate")
  int? get hourlyRate;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
