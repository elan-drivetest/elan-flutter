// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileResponse _$FileResponseFromJson(Map<String, dynamic> json) {
  return _FileResponse.fromJson(json);
}

/// @nodoc
mixin _$FileResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "filename")
  String? get filename => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "original_name")
  String? get originalName => throw _privateConstructorUsedError;

  /// Serializes this FileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileResponseCopyWith<FileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileResponseCopyWith<$Res> {
  factory $FileResponseCopyWith(
          FileResponse value, $Res Function(FileResponse) then) =
      _$FileResponseCopyWithImpl<$Res, FileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "filename") String? filename,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "original_name") String? originalName});
}

/// @nodoc
class _$FileResponseCopyWithImpl<$Res, $Val extends FileResponse>
    implements $FileResponseCopyWith<$Res> {
  _$FileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? filename = freezed,
    Object? url = freezed,
    Object? originalName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileResponseImplCopyWith<$Res>
    implements $FileResponseCopyWith<$Res> {
  factory _$$FileResponseImplCopyWith(
          _$FileResponseImpl value, $Res Function(_$FileResponseImpl) then) =
      __$$FileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "filename") String? filename,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "original_name") String? originalName});
}

/// @nodoc
class __$$FileResponseImplCopyWithImpl<$Res>
    extends _$FileResponseCopyWithImpl<$Res, _$FileResponseImpl>
    implements _$$FileResponseImplCopyWith<$Res> {
  __$$FileResponseImplCopyWithImpl(
      _$FileResponseImpl _value, $Res Function(_$FileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? filename = freezed,
    Object? url = freezed,
    Object? originalName = freezed,
  }) {
    return _then(_$FileResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileResponseImpl implements _FileResponse {
  const _$FileResponseImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "filename") this.filename,
      @JsonKey(name: "url") this.url,
      @JsonKey(name: "original_name") this.originalName});

  factory _$FileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "filename")
  final String? filename;
  @override
  @JsonKey(name: "url")
  final String? url;
  @override
  @JsonKey(name: "original_name")
  final String? originalName;

  @override
  String toString() {
    return 'FileResponse(id: $id, filename: $filename, url: $url, originalName: $originalName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, filename, url, originalName);

  /// Create a copy of FileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileResponseImplCopyWith<_$FileResponseImpl> get copyWith =>
      __$$FileResponseImplCopyWithImpl<_$FileResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileResponseImplToJson(
      this,
    );
  }
}

abstract class _FileResponse implements FileResponse {
  const factory _FileResponse(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "filename") final String? filename,
          @JsonKey(name: "url") final String? url,
          @JsonKey(name: "original_name") final String? originalName}) =
      _$FileResponseImpl;

  factory _FileResponse.fromJson(Map<String, dynamic> json) =
      _$FileResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "filename")
  String? get filename;
  @override
  @JsonKey(name: "url")
  String? get url;
  @override
  @JsonKey(name: "original_name")
  String? get originalName;

  /// Create a copy of FileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileResponseImplCopyWith<_$FileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
