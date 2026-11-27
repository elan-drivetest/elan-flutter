// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LegalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() accept,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? accept,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? accept,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Accept value) accept,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Accept value)? accept,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Accept value)? accept,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegalEventCopyWith<$Res> {
  factory $LegalEventCopyWith(
          LegalEvent value, $Res Function(LegalEvent) then) =
      _$LegalEventCopyWithImpl<$Res, LegalEvent>;
}

/// @nodoc
class _$LegalEventCopyWithImpl<$Res, $Val extends LegalEvent>
    implements $LegalEventCopyWith<$Res> {
  _$LegalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LegalEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$LegalEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegalEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'LegalEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() accept,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? accept,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? accept,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Accept value) accept,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Accept value)? accept,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Accept value)? accept,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements LegalEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$AcceptImplCopyWith<$Res> {
  factory _$$AcceptImplCopyWith(
          _$AcceptImpl value, $Res Function(_$AcceptImpl) then) =
      __$$AcceptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AcceptImplCopyWithImpl<$Res>
    extends _$LegalEventCopyWithImpl<$Res, _$AcceptImpl>
    implements _$$AcceptImplCopyWith<$Res> {
  __$$AcceptImplCopyWithImpl(
      _$AcceptImpl _value, $Res Function(_$AcceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegalEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AcceptImpl implements _Accept {
  const _$AcceptImpl();

  @override
  String toString() {
    return 'LegalEvent.accept()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AcceptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() accept,
  }) {
    return accept();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? accept,
  }) {
    return accept?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? accept,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Accept value) accept,
  }) {
    return accept(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Accept value)? accept,
  }) {
    return accept?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Accept value)? accept,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(this);
    }
    return orElse();
  }
}

abstract class _Accept implements LegalEvent {
  const factory _Accept() = _$AcceptImpl;
}

/// @nodoc
mixin _$LegalState {
  LegalStatusCode get status => throw _privateConstructorUsedError;
  LegalStatus? get legal => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LegalStateCopyWith<LegalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegalStateCopyWith<$Res> {
  factory $LegalStateCopyWith(
          LegalState value, $Res Function(LegalState) then) =
      _$LegalStateCopyWithImpl<$Res, LegalState>;
  @useResult
  $Res call({LegalStatusCode status, LegalStatus? legal, String? errorMessage});

  $LegalStatusCopyWith<$Res>? get legal;
}

/// @nodoc
class _$LegalStateCopyWithImpl<$Res, $Val extends LegalState>
    implements $LegalStateCopyWith<$Res> {
  _$LegalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? legal = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LegalStatusCode,
      legal: freezed == legal
          ? _value.legal
          : legal // ignore: cast_nullable_to_non_nullable
              as LegalStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LegalStatusCopyWith<$Res>? get legal {
    if (_value.legal == null) {
      return null;
    }

    return $LegalStatusCopyWith<$Res>(_value.legal!, (value) {
      return _then(_value.copyWith(legal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LegalStateImplCopyWith<$Res>
    implements $LegalStateCopyWith<$Res> {
  factory _$$LegalStateImplCopyWith(
          _$LegalStateImpl value, $Res Function(_$LegalStateImpl) then) =
      __$$LegalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LegalStatusCode status, LegalStatus? legal, String? errorMessage});

  @override
  $LegalStatusCopyWith<$Res>? get legal;
}

/// @nodoc
class __$$LegalStateImplCopyWithImpl<$Res>
    extends _$LegalStateCopyWithImpl<$Res, _$LegalStateImpl>
    implements _$$LegalStateImplCopyWith<$Res> {
  __$$LegalStateImplCopyWithImpl(
      _$LegalStateImpl _value, $Res Function(_$LegalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? legal = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$LegalStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LegalStatusCode,
      legal: freezed == legal
          ? _value.legal
          : legal // ignore: cast_nullable_to_non_nullable
              as LegalStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LegalStateImpl extends _LegalState {
  const _$LegalStateImpl(
      {this.status = LegalStatusCode.initial, this.legal, this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final LegalStatusCode status;
  @override
  final LegalStatus? legal;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LegalState(status: $status, legal: $legal, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegalStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.legal, legal) || other.legal == legal) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, legal, errorMessage);

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LegalStateImplCopyWith<_$LegalStateImpl> get copyWith =>
      __$$LegalStateImplCopyWithImpl<_$LegalStateImpl>(this, _$identity);
}

abstract class _LegalState extends LegalState {
  const factory _LegalState(
      {final LegalStatusCode status,
      final LegalStatus? legal,
      final String? errorMessage}) = _$LegalStateImpl;
  const _LegalState._() : super._();

  @override
  LegalStatusCode get status;
  @override
  LegalStatus? get legal;
  @override
  String? get errorMessage;

  /// Create a copy of LegalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LegalStateImplCopyWith<_$LegalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
