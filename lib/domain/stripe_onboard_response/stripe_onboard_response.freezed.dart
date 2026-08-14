// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_onboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StripeOnboardResponse _$StripeOnboardResponseFromJson(
    Map<String, dynamic> json) {
  return _StripeOnboardResponse.fromJson(json);
}

/// @nodoc
mixin _$StripeOnboardResponse {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "charges_enabled")
  bool? get chargesEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: "payouts_enabled")
  bool? get payoutsEnabled => throw _privateConstructorUsedError;

  /// Serializes this StripeOnboardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StripeOnboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StripeOnboardResponseCopyWith<StripeOnboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeOnboardResponseCopyWith<$Res> {
  factory $StripeOnboardResponseCopyWith(StripeOnboardResponse value,
          $Res Function(StripeOnboardResponse) then) =
      _$StripeOnboardResponseCopyWithImpl<$Res, StripeOnboardResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "charges_enabled") bool? chargesEnabled,
      @JsonKey(name: "payouts_enabled") bool? payoutsEnabled});
}

/// @nodoc
class _$StripeOnboardResponseCopyWithImpl<$Res,
        $Val extends StripeOnboardResponse>
    implements $StripeOnboardResponseCopyWith<$Res> {
  _$StripeOnboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StripeOnboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? chargesEnabled = freezed,
    Object? payoutsEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      chargesEnabled: freezed == chargesEnabled
          ? _value.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      payoutsEnabled: freezed == payoutsEnabled
          ? _value.payoutsEnabled
          : payoutsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StripeOnboardResponseImplCopyWith<$Res>
    implements $StripeOnboardResponseCopyWith<$Res> {
  factory _$$StripeOnboardResponseImplCopyWith(
          _$StripeOnboardResponseImpl value,
          $Res Function(_$StripeOnboardResponseImpl) then) =
      __$$StripeOnboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "charges_enabled") bool? chargesEnabled,
      @JsonKey(name: "payouts_enabled") bool? payoutsEnabled});
}

/// @nodoc
class __$$StripeOnboardResponseImplCopyWithImpl<$Res>
    extends _$StripeOnboardResponseCopyWithImpl<$Res,
        _$StripeOnboardResponseImpl>
    implements _$$StripeOnboardResponseImplCopyWith<$Res> {
  __$$StripeOnboardResponseImplCopyWithImpl(_$StripeOnboardResponseImpl _value,
      $Res Function(_$StripeOnboardResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StripeOnboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? chargesEnabled = freezed,
    Object? payoutsEnabled = freezed,
  }) {
    return _then(_$StripeOnboardResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      chargesEnabled: freezed == chargesEnabled
          ? _value.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      payoutsEnabled: freezed == payoutsEnabled
          ? _value.payoutsEnabled
          : payoutsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripeOnboardResponseImpl implements _StripeOnboardResponse {
  const _$StripeOnboardResponseImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "charges_enabled") this.chargesEnabled,
      @JsonKey(name: "payouts_enabled") this.payoutsEnabled});

  factory _$StripeOnboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripeOnboardResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "charges_enabled")
  final bool? chargesEnabled;
  @override
  @JsonKey(name: "payouts_enabled")
  final bool? payoutsEnabled;

  @override
  String toString() {
    return 'StripeOnboardResponse(status: $status, chargesEnabled: $chargesEnabled, payoutsEnabled: $payoutsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripeOnboardResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.chargesEnabled, chargesEnabled) ||
                other.chargesEnabled == chargesEnabled) &&
            (identical(other.payoutsEnabled, payoutsEnabled) ||
                other.payoutsEnabled == payoutsEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, chargesEnabled, payoutsEnabled);

  /// Create a copy of StripeOnboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StripeOnboardResponseImplCopyWith<_$StripeOnboardResponseImpl>
      get copyWith => __$$StripeOnboardResponseImplCopyWithImpl<
          _$StripeOnboardResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StripeOnboardResponseImplToJson(
      this,
    );
  }
}

abstract class _StripeOnboardResponse implements StripeOnboardResponse {
  const factory _StripeOnboardResponse(
          {@JsonKey(name: "status") final String? status,
          @JsonKey(name: "charges_enabled") final bool? chargesEnabled,
          @JsonKey(name: "payouts_enabled") final bool? payoutsEnabled}) =
      _$StripeOnboardResponseImpl;

  factory _StripeOnboardResponse.fromJson(Map<String, dynamic> json) =
      _$StripeOnboardResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "charges_enabled")
  bool? get chargesEnabled;
  @override
  @JsonKey(name: "payouts_enabled")
  bool? get payoutsEnabled;

  /// Create a copy of StripeOnboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StripeOnboardResponseImplCopyWith<_$StripeOnboardResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
