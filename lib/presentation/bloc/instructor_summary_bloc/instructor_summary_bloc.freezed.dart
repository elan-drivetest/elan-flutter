// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstructorSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSummary value) getSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSummary value)? getSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSummary value)? getSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorSummaryEventCopyWith<$Res> {
  factory $InstructorSummaryEventCopyWith(InstructorSummaryEvent value,
          $Res Function(InstructorSummaryEvent) then) =
      _$InstructorSummaryEventCopyWithImpl<$Res, InstructorSummaryEvent>;
}

/// @nodoc
class _$InstructorSummaryEventCopyWithImpl<$Res,
        $Val extends InstructorSummaryEvent>
    implements $InstructorSummaryEventCopyWith<$Res> {
  _$InstructorSummaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSummaryImplCopyWith<$Res> {
  factory _$$GetSummaryImplCopyWith(
          _$GetSummaryImpl value, $Res Function(_$GetSummaryImpl) then) =
      __$$GetSummaryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSummaryImplCopyWithImpl<$Res>
    extends _$InstructorSummaryEventCopyWithImpl<$Res, _$GetSummaryImpl>
    implements _$$GetSummaryImplCopyWith<$Res> {
  __$$GetSummaryImplCopyWithImpl(
      _$GetSummaryImpl _value, $Res Function(_$GetSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorSummaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSummaryImpl implements _GetSummary {
  const _$GetSummaryImpl();

  @override
  String toString() {
    return 'InstructorSummaryEvent.getSummary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSummaryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSummary,
  }) {
    return getSummary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSummary,
  }) {
    return getSummary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSummary,
    required TResult orElse(),
  }) {
    if (getSummary != null) {
      return getSummary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSummary value) getSummary,
  }) {
    return getSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSummary value)? getSummary,
  }) {
    return getSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSummary value)? getSummary,
    required TResult orElse(),
  }) {
    if (getSummary != null) {
      return getSummary(this);
    }
    return orElse();
  }
}

abstract class _GetSummary implements InstructorSummaryEvent {
  const factory _GetSummary() = _$GetSummaryImpl;
}

/// @nodoc
mixin _$InstructorSummaryState {
  InstructorSummaryStatus get status => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  InstructorSummaryResponse? get summaryInfo =>
      throw _privateConstructorUsedError;

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorSummaryStateCopyWith<InstructorSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorSummaryStateCopyWith<$Res> {
  factory $InstructorSummaryStateCopyWith(InstructorSummaryState value,
          $Res Function(InstructorSummaryState) then) =
      _$InstructorSummaryStateCopyWithImpl<$Res, InstructorSummaryState>;
  @useResult
  $Res call(
      {InstructorSummaryStatus status,
      ErrorResponse? errorResponse,
      InstructorSummaryResponse? summaryInfo});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
  $InstructorSummaryResponseCopyWith<$Res>? get summaryInfo;
}

/// @nodoc
class _$InstructorSummaryStateCopyWithImpl<$Res,
        $Val extends InstructorSummaryState>
    implements $InstructorSummaryStateCopyWith<$Res> {
  _$InstructorSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? summaryInfo = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstructorSummaryStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      summaryInfo: freezed == summaryInfo
          ? _value.summaryInfo
          : summaryInfo // ignore: cast_nullable_to_non_nullable
              as InstructorSummaryResponse?,
    ) as $Val);
  }

  /// Create a copy of InstructorSummaryState
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

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InstructorSummaryResponseCopyWith<$Res>? get summaryInfo {
    if (_value.summaryInfo == null) {
      return null;
    }

    return $InstructorSummaryResponseCopyWith<$Res>(_value.summaryInfo!,
        (value) {
      return _then(_value.copyWith(summaryInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructorSummaryStateImplCopyWith<$Res>
    implements $InstructorSummaryStateCopyWith<$Res> {
  factory _$$InstructorSummaryStateImplCopyWith(
          _$InstructorSummaryStateImpl value,
          $Res Function(_$InstructorSummaryStateImpl) then) =
      __$$InstructorSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InstructorSummaryStatus status,
      ErrorResponse? errorResponse,
      InstructorSummaryResponse? summaryInfo});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
  @override
  $InstructorSummaryResponseCopyWith<$Res>? get summaryInfo;
}

/// @nodoc
class __$$InstructorSummaryStateImplCopyWithImpl<$Res>
    extends _$InstructorSummaryStateCopyWithImpl<$Res,
        _$InstructorSummaryStateImpl>
    implements _$$InstructorSummaryStateImplCopyWith<$Res> {
  __$$InstructorSummaryStateImplCopyWithImpl(
      _$InstructorSummaryStateImpl _value,
      $Res Function(_$InstructorSummaryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? summaryInfo = freezed,
  }) {
    return _then(_$InstructorSummaryStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstructorSummaryStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      summaryInfo: freezed == summaryInfo
          ? _value.summaryInfo
          : summaryInfo // ignore: cast_nullable_to_non_nullable
              as InstructorSummaryResponse?,
    ));
  }
}

/// @nodoc

class _$InstructorSummaryStateImpl implements _InstructorSummaryState {
  const _$InstructorSummaryStateImpl(
      {this.status = InstructorSummaryStatus.initial,
      this.errorResponse,
      this.summaryInfo});

  @override
  @JsonKey()
  final InstructorSummaryStatus status;
  @override
  final ErrorResponse? errorResponse;
  @override
  final InstructorSummaryResponse? summaryInfo;

  @override
  String toString() {
    return 'InstructorSummaryState(status: $status, errorResponse: $errorResponse, summaryInfo: $summaryInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorSummaryStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.summaryInfo, summaryInfo) ||
                other.summaryInfo == summaryInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorResponse, summaryInfo);

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorSummaryStateImplCopyWith<_$InstructorSummaryStateImpl>
      get copyWith => __$$InstructorSummaryStateImplCopyWithImpl<
          _$InstructorSummaryStateImpl>(this, _$identity);
}

abstract class _InstructorSummaryState implements InstructorSummaryState {
  const factory _InstructorSummaryState(
          {final InstructorSummaryStatus status,
          final ErrorResponse? errorResponse,
          final InstructorSummaryResponse? summaryInfo}) =
      _$InstructorSummaryStateImpl;

  @override
  InstructorSummaryStatus get status;
  @override
  ErrorResponse? get errorResponse;
  @override
  InstructorSummaryResponse? get summaryInfo;

  /// Create a copy of InstructorSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorSummaryStateImplCopyWith<_$InstructorSummaryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
