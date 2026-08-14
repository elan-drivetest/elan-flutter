// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRideRequest, int? rideId, bool fromBackground)
        checkLocationAccess,
    required TResult Function() checkBackgroundPermissions,
    required TResult Function() checkAllPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult? Function()? checkBackgroundPermissions,
    TResult? Function()? checkAllPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult Function()? checkBackgroundPermissions,
    TResult Function()? checkAllPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckLocationAccess value) checkLocationAccess,
    required TResult Function(CheckBackgroundPermissions value)
        checkBackgroundPermissions,
    required TResult Function(CheckAllPermissions value) checkAllPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckLocationAccess value)? checkLocationAccess,
    TResult? Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult? Function(CheckAllPermissions value)? checkAllPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckLocationAccess value)? checkLocationAccess,
    TResult Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult Function(CheckAllPermissions value)? checkAllPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res, LocationEvent>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res, $Val extends LocationEvent>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckLocationAccessImplCopyWith<$Res> {
  factory _$$CheckLocationAccessImplCopyWith(_$CheckLocationAccessImpl value,
          $Res Function(_$CheckLocationAccessImpl) then) =
      __$$CheckLocationAccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRideRequest, int? rideId, bool fromBackground});
}

/// @nodoc
class __$$CheckLocationAccessImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$CheckLocationAccessImpl>
    implements _$$CheckLocationAccessImplCopyWith<$Res> {
  __$$CheckLocationAccessImplCopyWithImpl(_$CheckLocationAccessImpl _value,
      $Res Function(_$CheckLocationAccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRideRequest = null,
    Object? rideId = freezed,
    Object? fromBackground = null,
  }) {
    return _then(_$CheckLocationAccessImpl(
      isRideRequest: null == isRideRequest
          ? _value.isRideRequest
          : isRideRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      rideId: freezed == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromBackground: null == fromBackground
          ? _value.fromBackground
          : fromBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckLocationAccessImpl implements CheckLocationAccess {
  const _$CheckLocationAccessImpl(
      {this.isRideRequest = false, this.rideId, this.fromBackground = false});

  @override
  @JsonKey()
  final bool isRideRequest;
  @override
  final int? rideId;
  @override
  @JsonKey()
  final bool fromBackground;

  @override
  String toString() {
    return 'LocationEvent.checkLocationAccess(isRideRequest: $isRideRequest, rideId: $rideId, fromBackground: $fromBackground)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckLocationAccessImpl &&
            (identical(other.isRideRequest, isRideRequest) ||
                other.isRideRequest == isRideRequest) &&
            (identical(other.rideId, rideId) || other.rideId == rideId) &&
            (identical(other.fromBackground, fromBackground) ||
                other.fromBackground == fromBackground));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isRideRequest, rideId, fromBackground);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckLocationAccessImplCopyWith<_$CheckLocationAccessImpl> get copyWith =>
      __$$CheckLocationAccessImplCopyWithImpl<_$CheckLocationAccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRideRequest, int? rideId, bool fromBackground)
        checkLocationAccess,
    required TResult Function() checkBackgroundPermissions,
    required TResult Function() checkAllPermissions,
  }) {
    return checkLocationAccess(isRideRequest, rideId, fromBackground);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult? Function()? checkBackgroundPermissions,
    TResult? Function()? checkAllPermissions,
  }) {
    return checkLocationAccess?.call(isRideRequest, rideId, fromBackground);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult Function()? checkBackgroundPermissions,
    TResult Function()? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkLocationAccess != null) {
      return checkLocationAccess(isRideRequest, rideId, fromBackground);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckLocationAccess value) checkLocationAccess,
    required TResult Function(CheckBackgroundPermissions value)
        checkBackgroundPermissions,
    required TResult Function(CheckAllPermissions value) checkAllPermissions,
  }) {
    return checkLocationAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckLocationAccess value)? checkLocationAccess,
    TResult? Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult? Function(CheckAllPermissions value)? checkAllPermissions,
  }) {
    return checkLocationAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckLocationAccess value)? checkLocationAccess,
    TResult Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult Function(CheckAllPermissions value)? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkLocationAccess != null) {
      return checkLocationAccess(this);
    }
    return orElse();
  }
}

abstract class CheckLocationAccess implements LocationEvent {
  const factory CheckLocationAccess(
      {final bool isRideRequest,
      final int? rideId,
      final bool fromBackground}) = _$CheckLocationAccessImpl;

  bool get isRideRequest;
  int? get rideId;
  bool get fromBackground;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckLocationAccessImplCopyWith<_$CheckLocationAccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckBackgroundPermissionsImplCopyWith<$Res> {
  factory _$$CheckBackgroundPermissionsImplCopyWith(
          _$CheckBackgroundPermissionsImpl value,
          $Res Function(_$CheckBackgroundPermissionsImpl) then) =
      __$$CheckBackgroundPermissionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckBackgroundPermissionsImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$CheckBackgroundPermissionsImpl>
    implements _$$CheckBackgroundPermissionsImplCopyWith<$Res> {
  __$$CheckBackgroundPermissionsImplCopyWithImpl(
      _$CheckBackgroundPermissionsImpl _value,
      $Res Function(_$CheckBackgroundPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckBackgroundPermissionsImpl implements CheckBackgroundPermissions {
  const _$CheckBackgroundPermissionsImpl();

  @override
  String toString() {
    return 'LocationEvent.checkBackgroundPermissions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckBackgroundPermissionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRideRequest, int? rideId, bool fromBackground)
        checkLocationAccess,
    required TResult Function() checkBackgroundPermissions,
    required TResult Function() checkAllPermissions,
  }) {
    return checkBackgroundPermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult? Function()? checkBackgroundPermissions,
    TResult? Function()? checkAllPermissions,
  }) {
    return checkBackgroundPermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult Function()? checkBackgroundPermissions,
    TResult Function()? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkBackgroundPermissions != null) {
      return checkBackgroundPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckLocationAccess value) checkLocationAccess,
    required TResult Function(CheckBackgroundPermissions value)
        checkBackgroundPermissions,
    required TResult Function(CheckAllPermissions value) checkAllPermissions,
  }) {
    return checkBackgroundPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckLocationAccess value)? checkLocationAccess,
    TResult? Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult? Function(CheckAllPermissions value)? checkAllPermissions,
  }) {
    return checkBackgroundPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckLocationAccess value)? checkLocationAccess,
    TResult Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult Function(CheckAllPermissions value)? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkBackgroundPermissions != null) {
      return checkBackgroundPermissions(this);
    }
    return orElse();
  }
}

abstract class CheckBackgroundPermissions implements LocationEvent {
  const factory CheckBackgroundPermissions() = _$CheckBackgroundPermissionsImpl;
}

/// @nodoc
abstract class _$$CheckAllPermissionsImplCopyWith<$Res> {
  factory _$$CheckAllPermissionsImplCopyWith(_$CheckAllPermissionsImpl value,
          $Res Function(_$CheckAllPermissionsImpl) then) =
      __$$CheckAllPermissionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAllPermissionsImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$CheckAllPermissionsImpl>
    implements _$$CheckAllPermissionsImplCopyWith<$Res> {
  __$$CheckAllPermissionsImplCopyWithImpl(_$CheckAllPermissionsImpl _value,
      $Res Function(_$CheckAllPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAllPermissionsImpl implements CheckAllPermissions {
  const _$CheckAllPermissionsImpl();

  @override
  String toString() {
    return 'LocationEvent.checkAllPermissions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAllPermissionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRideRequest, int? rideId, bool fromBackground)
        checkLocationAccess,
    required TResult Function() checkBackgroundPermissions,
    required TResult Function() checkAllPermissions,
  }) {
    return checkAllPermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult? Function()? checkBackgroundPermissions,
    TResult? Function()? checkAllPermissions,
  }) {
    return checkAllPermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRideRequest, int? rideId, bool fromBackground)?
        checkLocationAccess,
    TResult Function()? checkBackgroundPermissions,
    TResult Function()? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkAllPermissions != null) {
      return checkAllPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckLocationAccess value) checkLocationAccess,
    required TResult Function(CheckBackgroundPermissions value)
        checkBackgroundPermissions,
    required TResult Function(CheckAllPermissions value) checkAllPermissions,
  }) {
    return checkAllPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckLocationAccess value)? checkLocationAccess,
    TResult? Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult? Function(CheckAllPermissions value)? checkAllPermissions,
  }) {
    return checkAllPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckLocationAccess value)? checkLocationAccess,
    TResult Function(CheckBackgroundPermissions value)?
        checkBackgroundPermissions,
    TResult Function(CheckAllPermissions value)? checkAllPermissions,
    required TResult orElse(),
  }) {
    if (checkAllPermissions != null) {
      return checkAllPermissions(this);
    }
    return orElse();
  }
}

abstract class CheckAllPermissions implements LocationEvent {
  const factory CheckAllPermissions() = _$CheckAllPermissionsImpl;
}

/// @nodoc
mixin _$LocationState {
  LocationStatus get status => throw _privateConstructorUsedError;
  Position? get location => throw _privateConstructorUsedError;
  int? get rideId => throw _privateConstructorUsedError;
  bool get shouldStart => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call(
      {LocationStatus status,
      Position? location,
      int? rideId,
      bool shouldStart,
      String? errorMessage});
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? location = freezed,
    Object? rideId = freezed,
    Object? shouldStart = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LocationStatus,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Position?,
      rideId: freezed == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as int?,
      shouldStart: null == shouldStart
          ? _value.shouldStart
          : shouldStart // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
          _$LocationStateImpl value, $Res Function(_$LocationStateImpl) then) =
      __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationStatus status,
      Position? location,
      int? rideId,
      bool shouldStart,
      String? errorMessage});
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
      _$LocationStateImpl _value, $Res Function(_$LocationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? location = freezed,
    Object? rideId = freezed,
    Object? shouldStart = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$LocationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LocationStatus,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Position?,
      rideId: freezed == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as int?,
      shouldStart: null == shouldStart
          ? _value.shouldStart
          : shouldStart // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationStateImpl implements _LocationState {
  const _$LocationStateImpl(
      {required this.status,
      this.location,
      this.rideId,
      this.shouldStart = false,
      this.errorMessage});

  @override
  final LocationStatus status;
  @override
  final Position? location;
  @override
  final int? rideId;
  @override
  @JsonKey()
  final bool shouldStart;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LocationState(status: $status, location: $location, rideId: $rideId, shouldStart: $shouldStart, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rideId, rideId) || other.rideId == rideId) &&
            (identical(other.shouldStart, shouldStart) ||
                other.shouldStart == shouldStart) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, location, rideId, shouldStart, errorMessage);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState implements LocationState {
  const factory _LocationState(
      {required final LocationStatus status,
      final Position? location,
      final int? rideId,
      final bool shouldStart,
      final String? errorMessage}) = _$LocationStateImpl;

  @override
  LocationStatus get status;
  @override
  Position? get location;
  @override
  int? get rideId;
  @override
  bool get shouldStart;
  @override
  String? get errorMessage;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
