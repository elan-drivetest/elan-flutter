// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReferralSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSummary,
    required TResult Function(String code) claimReferralCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSummary,
    TResult? Function(String code)? claimReferralCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSummary,
    TResult Function(String code)? claimReferralCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_ClaimReferralCode value) claimReferralCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_ClaimReferralCode value)? claimReferralCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_ClaimReferralCode value)? claimReferralCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralSummaryEventCopyWith<$Res> {
  factory $ReferralSummaryEventCopyWith(ReferralSummaryEvent value,
          $Res Function(ReferralSummaryEvent) then) =
      _$ReferralSummaryEventCopyWithImpl<$Res, ReferralSummaryEvent>;
}

/// @nodoc
class _$ReferralSummaryEventCopyWithImpl<$Res,
        $Val extends ReferralSummaryEvent>
    implements $ReferralSummaryEventCopyWith<$Res> {
  _$ReferralSummaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchSummaryImplCopyWith<$Res> {
  factory _$$FetchSummaryImplCopyWith(
          _$FetchSummaryImpl value, $Res Function(_$FetchSummaryImpl) then) =
      __$$FetchSummaryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSummaryImplCopyWithImpl<$Res>
    extends _$ReferralSummaryEventCopyWithImpl<$Res, _$FetchSummaryImpl>
    implements _$$FetchSummaryImplCopyWith<$Res> {
  __$$FetchSummaryImplCopyWithImpl(
      _$FetchSummaryImpl _value, $Res Function(_$FetchSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchSummaryImpl implements _FetchSummary {
  const _$FetchSummaryImpl();

  @override
  String toString() {
    return 'ReferralSummaryEvent.fetchSummary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSummaryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSummary,
    required TResult Function(String code) claimReferralCode,
  }) {
    return fetchSummary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSummary,
    TResult? Function(String code)? claimReferralCode,
  }) {
    return fetchSummary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSummary,
    TResult Function(String code)? claimReferralCode,
    required TResult orElse(),
  }) {
    if (fetchSummary != null) {
      return fetchSummary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_ClaimReferralCode value) claimReferralCode,
  }) {
    return fetchSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_ClaimReferralCode value)? claimReferralCode,
  }) {
    return fetchSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_ClaimReferralCode value)? claimReferralCode,
    required TResult orElse(),
  }) {
    if (fetchSummary != null) {
      return fetchSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchSummary implements ReferralSummaryEvent {
  const factory _FetchSummary() = _$FetchSummaryImpl;
}

/// @nodoc
abstract class _$$ClaimReferralCodeImplCopyWith<$Res> {
  factory _$$ClaimReferralCodeImplCopyWith(_$ClaimReferralCodeImpl value,
          $Res Function(_$ClaimReferralCodeImpl) then) =
      __$$ClaimReferralCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$ClaimReferralCodeImplCopyWithImpl<$Res>
    extends _$ReferralSummaryEventCopyWithImpl<$Res, _$ClaimReferralCodeImpl>
    implements _$$ClaimReferralCodeImplCopyWith<$Res> {
  __$$ClaimReferralCodeImplCopyWithImpl(_$ClaimReferralCodeImpl _value,
      $Res Function(_$ClaimReferralCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$ClaimReferralCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClaimReferralCodeImpl implements _ClaimReferralCode {
  const _$ClaimReferralCodeImpl({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'ReferralSummaryEvent.claimReferralCode(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimReferralCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of ReferralSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimReferralCodeImplCopyWith<_$ClaimReferralCodeImpl> get copyWith =>
      __$$ClaimReferralCodeImplCopyWithImpl<_$ClaimReferralCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSummary,
    required TResult Function(String code) claimReferralCode,
  }) {
    return claimReferralCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSummary,
    TResult? Function(String code)? claimReferralCode,
  }) {
    return claimReferralCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSummary,
    TResult Function(String code)? claimReferralCode,
    required TResult orElse(),
  }) {
    if (claimReferralCode != null) {
      return claimReferralCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_ClaimReferralCode value) claimReferralCode,
  }) {
    return claimReferralCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_ClaimReferralCode value)? claimReferralCode,
  }) {
    return claimReferralCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_ClaimReferralCode value)? claimReferralCode,
    required TResult orElse(),
  }) {
    if (claimReferralCode != null) {
      return claimReferralCode(this);
    }
    return orElse();
  }
}

abstract class _ClaimReferralCode implements ReferralSummaryEvent {
  const factory _ClaimReferralCode({required final String code}) =
      _$ClaimReferralCodeImpl;

  String get code;

  /// Create a copy of ReferralSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimReferralCodeImplCopyWith<_$ClaimReferralCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralSummaryState _$ReferralSummaryStateFromJson(Map<String, dynamic> json) {
  return _ReferralSummaryState.fromJson(json);
}

/// @nodoc
mixin _$ReferralSummaryState {
  ReferralSummaryStatus get status => throw _privateConstructorUsedError;
  ReferralCodeSummaryResponse? get summaryResponse =>
      throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;

  /// Serializes this ReferralSummaryState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralSummaryStateCopyWith<ReferralSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralSummaryStateCopyWith<$Res> {
  factory $ReferralSummaryStateCopyWith(ReferralSummaryState value,
          $Res Function(ReferralSummaryState) then) =
      _$ReferralSummaryStateCopyWithImpl<$Res, ReferralSummaryState>;
  @useResult
  $Res call(
      {ReferralSummaryStatus status,
      ReferralCodeSummaryResponse? summaryResponse,
      ErrorResponse? errorResponse});

  $ReferralCodeSummaryResponseCopyWith<$Res>? get summaryResponse;
  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class _$ReferralSummaryStateCopyWithImpl<$Res,
        $Val extends ReferralSummaryState>
    implements $ReferralSummaryStateCopyWith<$Res> {
  _$ReferralSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? summaryResponse = freezed,
    Object? errorResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferralSummaryStatus,
      summaryResponse: freezed == summaryResponse
          ? _value.summaryResponse
          : summaryResponse // ignore: cast_nullable_to_non_nullable
              as ReferralCodeSummaryResponse?,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ) as $Val);
  }

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReferralCodeSummaryResponseCopyWith<$Res>? get summaryResponse {
    if (_value.summaryResponse == null) {
      return null;
    }

    return $ReferralCodeSummaryResponseCopyWith<$Res>(_value.summaryResponse!,
        (value) {
      return _then(_value.copyWith(summaryResponse: value) as $Val);
    });
  }

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorResponseCopyWith<$Res>? get errorResponse {
    if (_value.errorResponse == null) {
      return null;
    }

    return $ErrorResponseCopyWith<$Res>(_value.errorResponse!, (value) {
      return _then(_value.copyWith(errorResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralSummaryStateImplCopyWith<$Res>
    implements $ReferralSummaryStateCopyWith<$Res> {
  factory _$$ReferralSummaryStateImplCopyWith(_$ReferralSummaryStateImpl value,
          $Res Function(_$ReferralSummaryStateImpl) then) =
      __$$ReferralSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReferralSummaryStatus status,
      ReferralCodeSummaryResponse? summaryResponse,
      ErrorResponse? errorResponse});

  @override
  $ReferralCodeSummaryResponseCopyWith<$Res>? get summaryResponse;
  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
}

/// @nodoc
class __$$ReferralSummaryStateImplCopyWithImpl<$Res>
    extends _$ReferralSummaryStateCopyWithImpl<$Res, _$ReferralSummaryStateImpl>
    implements _$$ReferralSummaryStateImplCopyWith<$Res> {
  __$$ReferralSummaryStateImplCopyWithImpl(_$ReferralSummaryStateImpl _value,
      $Res Function(_$ReferralSummaryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? summaryResponse = freezed,
    Object? errorResponse = freezed,
  }) {
    return _then(_$ReferralSummaryStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferralSummaryStatus,
      summaryResponse: freezed == summaryResponse
          ? _value.summaryResponse
          : summaryResponse // ignore: cast_nullable_to_non_nullable
              as ReferralCodeSummaryResponse?,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralSummaryStateImpl implements _ReferralSummaryState {
  const _$ReferralSummaryStateImpl(
      {this.status = ReferralSummaryStatus.initial,
      this.summaryResponse,
      this.errorResponse});

  factory _$ReferralSummaryStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralSummaryStateImplFromJson(json);

  @override
  @JsonKey()
  final ReferralSummaryStatus status;
  @override
  final ReferralCodeSummaryResponse? summaryResponse;
  @override
  final ErrorResponse? errorResponse;

  @override
  String toString() {
    return 'ReferralSummaryState(status: $status, summaryResponse: $summaryResponse, errorResponse: $errorResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralSummaryStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.summaryResponse, summaryResponse) ||
                other.summaryResponse == summaryResponse) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, summaryResponse, errorResponse);

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralSummaryStateImplCopyWith<_$ReferralSummaryStateImpl>
      get copyWith =>
          __$$ReferralSummaryStateImplCopyWithImpl<_$ReferralSummaryStateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralSummaryStateImplToJson(
      this,
    );
  }
}

abstract class _ReferralSummaryState implements ReferralSummaryState {
  const factory _ReferralSummaryState(
      {final ReferralSummaryStatus status,
      final ReferralCodeSummaryResponse? summaryResponse,
      final ErrorResponse? errorResponse}) = _$ReferralSummaryStateImpl;

  factory _ReferralSummaryState.fromJson(Map<String, dynamic> json) =
      _$ReferralSummaryStateImpl.fromJson;

  @override
  ReferralSummaryStatus get status;
  @override
  ReferralCodeSummaryResponse? get summaryResponse;
  @override
  ErrorResponse? get errorResponse;

  /// Create a copy of ReferralSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralSummaryStateImplCopyWith<_$ReferralSummaryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
