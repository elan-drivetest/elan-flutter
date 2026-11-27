// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_deletion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountDeletionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDeletionEventCopyWith<$Res> {
  factory $AccountDeletionEventCopyWith(AccountDeletionEvent value,
          $Res Function(AccountDeletionEvent) then) =
      _$AccountDeletionEventCopyWithImpl<$Res, AccountDeletionEvent>;
}

/// @nodoc
class _$AccountDeletionEventCopyWithImpl<$Res,
        $Val extends AccountDeletionEvent>
    implements $AccountDeletionEventCopyWith<$Res> {
  _$AccountDeletionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDeletionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$AccountDeletionEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDeletionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl();

  @override
  String toString() {
    return 'AccountDeletionEvent.delete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements AccountDeletionEvent {
  const factory _Delete() = _$DeleteImpl;
}

/// @nodoc
mixin _$AccountDeletionState {
  AccountDeletionStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AccountDeletionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDeletionStateCopyWith<AccountDeletionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDeletionStateCopyWith<$Res> {
  factory $AccountDeletionStateCopyWith(AccountDeletionState value,
          $Res Function(AccountDeletionState) then) =
      _$AccountDeletionStateCopyWithImpl<$Res, AccountDeletionState>;
  @useResult
  $Res call({AccountDeletionStatus status, String? errorMessage});
}

/// @nodoc
class _$AccountDeletionStateCopyWithImpl<$Res,
        $Val extends AccountDeletionState>
    implements $AccountDeletionStateCopyWith<$Res> {
  _$AccountDeletionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDeletionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccountDeletionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountDeletionStateImplCopyWith<$Res>
    implements $AccountDeletionStateCopyWith<$Res> {
  factory _$$AccountDeletionStateImplCopyWith(_$AccountDeletionStateImpl value,
          $Res Function(_$AccountDeletionStateImpl) then) =
      __$$AccountDeletionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccountDeletionStatus status, String? errorMessage});
}

/// @nodoc
class __$$AccountDeletionStateImplCopyWithImpl<$Res>
    extends _$AccountDeletionStateCopyWithImpl<$Res, _$AccountDeletionStateImpl>
    implements _$$AccountDeletionStateImplCopyWith<$Res> {
  __$$AccountDeletionStateImplCopyWithImpl(_$AccountDeletionStateImpl _value,
      $Res Function(_$AccountDeletionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDeletionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AccountDeletionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccountDeletionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AccountDeletionStateImpl implements _AccountDeletionState {
  const _$AccountDeletionStateImpl(
      {this.status = AccountDeletionStatus.initial, this.errorMessage});

  @override
  @JsonKey()
  final AccountDeletionStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AccountDeletionState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDeletionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  /// Create a copy of AccountDeletionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDeletionStateImplCopyWith<_$AccountDeletionStateImpl>
      get copyWith =>
          __$$AccountDeletionStateImplCopyWithImpl<_$AccountDeletionStateImpl>(
              this, _$identity);
}

abstract class _AccountDeletionState implements AccountDeletionState {
  const factory _AccountDeletionState(
      {final AccountDeletionStatus status,
      final String? errorMessage}) = _$AccountDeletionStateImpl;

  @override
  AccountDeletionStatus get status;
  @override
  String? get errorMessage;

  /// Create a copy of AccountDeletionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDeletionStateImplCopyWith<_$AccountDeletionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
