// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileUploadEvent {
  PlatformFile get file => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformFile file) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PlatformFile file)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformFile file)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FileUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadEventCopyWith<FileUploadEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadEventCopyWith<$Res> {
  factory $FileUploadEventCopyWith(
          FileUploadEvent value, $Res Function(FileUploadEvent) then) =
      _$FileUploadEventCopyWithImpl<$Res, FileUploadEvent>;
  @useResult
  $Res call({PlatformFile file});
}

/// @nodoc
class _$FileUploadEventCopyWithImpl<$Res, $Val extends FileUploadEvent>
    implements $FileUploadEventCopyWith<$Res> {
  _$FileUploadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res>
    implements $FileUploadEventCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlatformFile file});
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$FileUploadEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$SendImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl({required this.file});

  @override
  final PlatformFile file;

  @override
  String toString() {
    return 'FileUploadEvent.send(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of FileUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      __$$SendImplCopyWithImpl<_$SendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformFile file) send,
  }) {
    return send(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PlatformFile file)? send,
  }) {
    return send?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformFile file)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements FileUploadEvent {
  const factory _Send({required final PlatformFile file}) = _$SendImpl;

  @override
  PlatformFile get file;

  /// Create a copy of FileUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileUploadState _$FileUploadStateFromJson(Map<String, dynamic> json) {
  return _FileUploadState.fromJson(json);
}

/// @nodoc
mixin _$FileUploadState {
  FileUploadStatus get status => throw _privateConstructorUsedError;
  ErrorResponse? get errorResponse => throw _privateConstructorUsedError;
  FileResponse? get response => throw _privateConstructorUsedError;

  /// Serializes this FileUploadState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadStateCopyWith<FileUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadStateCopyWith<$Res> {
  factory $FileUploadStateCopyWith(
          FileUploadState value, $Res Function(FileUploadState) then) =
      _$FileUploadStateCopyWithImpl<$Res, FileUploadState>;
  @useResult
  $Res call(
      {FileUploadStatus status,
      ErrorResponse? errorResponse,
      FileResponse? response});

  $ErrorResponseCopyWith<$Res>? get errorResponse;
  $FileResponseCopyWith<$Res>? get response;
}

/// @nodoc
class _$FileUploadStateCopyWithImpl<$Res, $Val extends FileUploadState>
    implements $FileUploadStateCopyWith<$Res> {
  _$FileUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FileUploadStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as FileResponse?,
    ) as $Val);
  }

  /// Create a copy of FileUploadState
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

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $FileResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FileUploadStateImplCopyWith<$Res>
    implements $FileUploadStateCopyWith<$Res> {
  factory _$$FileUploadStateImplCopyWith(_$FileUploadStateImpl value,
          $Res Function(_$FileUploadStateImpl) then) =
      __$$FileUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FileUploadStatus status,
      ErrorResponse? errorResponse,
      FileResponse? response});

  @override
  $ErrorResponseCopyWith<$Res>? get errorResponse;
  @override
  $FileResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$FileUploadStateImplCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$FileUploadStateImpl>
    implements _$$FileUploadStateImplCopyWith<$Res> {
  __$$FileUploadStateImplCopyWithImpl(
      _$FileUploadStateImpl _value, $Res Function(_$FileUploadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorResponse = freezed,
    Object? response = freezed,
  }) {
    return _then(_$FileUploadStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FileUploadStatus,
      errorResponse: freezed == errorResponse
          ? _value.errorResponse
          : errorResponse // ignore: cast_nullable_to_non_nullable
              as ErrorResponse?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as FileResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileUploadStateImpl implements _FileUploadState {
  const _$FileUploadStateImpl(
      {this.status = FileUploadStatus.initial,
      this.errorResponse,
      this.response});

  factory _$FileUploadStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadStateImplFromJson(json);

  @override
  @JsonKey()
  final FileUploadStatus status;
  @override
  final ErrorResponse? errorResponse;
  @override
  final FileResponse? response;

  @override
  String toString() {
    return 'FileUploadState(status: $status, errorResponse: $errorResponse, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, errorResponse, response);

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadStateImplCopyWith<_$FileUploadStateImpl> get copyWith =>
      __$$FileUploadStateImplCopyWithImpl<_$FileUploadStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadStateImplToJson(
      this,
    );
  }
}

abstract class _FileUploadState implements FileUploadState {
  const factory _FileUploadState(
      {final FileUploadStatus status,
      final ErrorResponse? errorResponse,
      final FileResponse? response}) = _$FileUploadStateImpl;

  factory _FileUploadState.fromJson(Map<String, dynamic> json) =
      _$FileUploadStateImpl.fromJson;

  @override
  FileUploadStatus get status;
  @override
  ErrorResponse? get errorResponse;
  @override
  FileResponse? get response;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadStateImplCopyWith<_$FileUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
