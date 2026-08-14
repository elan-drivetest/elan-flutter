// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_onboard_url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StripeOnboardUrlResponse _$StripeOnboardUrlResponseFromJson(
    Map<String, dynamic> json) {
  return _StripeOnboardUrlResponse.fromJson(json);
}

/// @nodoc
mixin _$StripeOnboardUrlResponse {
  @JsonKey(name: "onboarding_url")
  String? get onboardingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "stripe_account_id")
  String? get stripeAccountId => throw _privateConstructorUsedError;

  /// Serializes this StripeOnboardUrlResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StripeOnboardUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StripeOnboardUrlResponseCopyWith<StripeOnboardUrlResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeOnboardUrlResponseCopyWith<$Res> {
  factory $StripeOnboardUrlResponseCopyWith(StripeOnboardUrlResponse value,
          $Res Function(StripeOnboardUrlResponse) then) =
      _$StripeOnboardUrlResponseCopyWithImpl<$Res, StripeOnboardUrlResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "onboarding_url") String? onboardingUrl,
      @JsonKey(name: "stripe_account_id") String? stripeAccountId});
}

/// @nodoc
class _$StripeOnboardUrlResponseCopyWithImpl<$Res,
        $Val extends StripeOnboardUrlResponse>
    implements $StripeOnboardUrlResponseCopyWith<$Res> {
  _$StripeOnboardUrlResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StripeOnboardUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingUrl = freezed,
    Object? stripeAccountId = freezed,
  }) {
    return _then(_value.copyWith(
      onboardingUrl: freezed == onboardingUrl
          ? _value.onboardingUrl
          : onboardingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountId: freezed == stripeAccountId
          ? _value.stripeAccountId
          : stripeAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StripeOnboardUrlResponseImplCopyWith<$Res>
    implements $StripeOnboardUrlResponseCopyWith<$Res> {
  factory _$$StripeOnboardUrlResponseImplCopyWith(
          _$StripeOnboardUrlResponseImpl value,
          $Res Function(_$StripeOnboardUrlResponseImpl) then) =
      __$$StripeOnboardUrlResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "onboarding_url") String? onboardingUrl,
      @JsonKey(name: "stripe_account_id") String? stripeAccountId});
}

/// @nodoc
class __$$StripeOnboardUrlResponseImplCopyWithImpl<$Res>
    extends _$StripeOnboardUrlResponseCopyWithImpl<$Res,
        _$StripeOnboardUrlResponseImpl>
    implements _$$StripeOnboardUrlResponseImplCopyWith<$Res> {
  __$$StripeOnboardUrlResponseImplCopyWithImpl(
      _$StripeOnboardUrlResponseImpl _value,
      $Res Function(_$StripeOnboardUrlResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StripeOnboardUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingUrl = freezed,
    Object? stripeAccountId = freezed,
  }) {
    return _then(_$StripeOnboardUrlResponseImpl(
      onboardingUrl: freezed == onboardingUrl
          ? _value.onboardingUrl
          : onboardingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountId: freezed == stripeAccountId
          ? _value.stripeAccountId
          : stripeAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripeOnboardUrlResponseImpl implements _StripeOnboardUrlResponse {
  const _$StripeOnboardUrlResponseImpl(
      {@JsonKey(name: "onboarding_url") this.onboardingUrl,
      @JsonKey(name: "stripe_account_id") this.stripeAccountId});

  factory _$StripeOnboardUrlResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripeOnboardUrlResponseImplFromJson(json);

  @override
  @JsonKey(name: "onboarding_url")
  final String? onboardingUrl;
  @override
  @JsonKey(name: "stripe_account_id")
  final String? stripeAccountId;

  @override
  String toString() {
    return 'StripeOnboardUrlResponse(onboardingUrl: $onboardingUrl, stripeAccountId: $stripeAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripeOnboardUrlResponseImpl &&
            (identical(other.onboardingUrl, onboardingUrl) ||
                other.onboardingUrl == onboardingUrl) &&
            (identical(other.stripeAccountId, stripeAccountId) ||
                other.stripeAccountId == stripeAccountId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, onboardingUrl, stripeAccountId);

  /// Create a copy of StripeOnboardUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StripeOnboardUrlResponseImplCopyWith<_$StripeOnboardUrlResponseImpl>
      get copyWith => __$$StripeOnboardUrlResponseImplCopyWithImpl<
          _$StripeOnboardUrlResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StripeOnboardUrlResponseImplToJson(
      this,
    );
  }
}

abstract class _StripeOnboardUrlResponse implements StripeOnboardUrlResponse {
  const factory _StripeOnboardUrlResponse(
          {@JsonKey(name: "onboarding_url") final String? onboardingUrl,
          @JsonKey(name: "stripe_account_id") final String? stripeAccountId}) =
      _$StripeOnboardUrlResponseImpl;

  factory _StripeOnboardUrlResponse.fromJson(Map<String, dynamic> json) =
      _$StripeOnboardUrlResponseImpl.fromJson;

  @override
  @JsonKey(name: "onboarding_url")
  String? get onboardingUrl;
  @override
  @JsonKey(name: "stripe_account_id")
  String? get stripeAccountId;

  /// Create a copy of StripeOnboardUrlResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StripeOnboardUrlResponseImplCopyWith<_$StripeOnboardUrlResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
