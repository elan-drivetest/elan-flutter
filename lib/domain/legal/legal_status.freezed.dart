// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legal_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LegalStatus _$LegalStatusFromJson(Map<String, dynamic> json) {
  return _LegalStatus.fromJson(json);
}

/// @nodoc
mixin _$LegalStatus {
  @JsonKey(name: "all_accepted")
  bool get allAccepted => throw _privateConstructorUsedError;

  /// Wire name `required`, which collides with Dart's `@required`.
  @JsonKey(name: "required")
  List<LegalDocument> get documents => throw _privateConstructorUsedError;

  /// Serializes this LegalStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LegalStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LegalStatusCopyWith<LegalStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegalStatusCopyWith<$Res> {
  factory $LegalStatusCopyWith(
          LegalStatus value, $Res Function(LegalStatus) then) =
      _$LegalStatusCopyWithImpl<$Res, LegalStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: "all_accepted") bool allAccepted,
      @JsonKey(name: "required") List<LegalDocument> documents});
}

/// @nodoc
class _$LegalStatusCopyWithImpl<$Res, $Val extends LegalStatus>
    implements $LegalStatusCopyWith<$Res> {
  _$LegalStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LegalStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAccepted = null,
    Object? documents = null,
  }) {
    return _then(_value.copyWith(
      allAccepted: null == allAccepted
          ? _value.allAccepted
          : allAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<LegalDocument>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LegalStatusImplCopyWith<$Res>
    implements $LegalStatusCopyWith<$Res> {
  factory _$$LegalStatusImplCopyWith(
          _$LegalStatusImpl value, $Res Function(_$LegalStatusImpl) then) =
      __$$LegalStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "all_accepted") bool allAccepted,
      @JsonKey(name: "required") List<LegalDocument> documents});
}

/// @nodoc
class __$$LegalStatusImplCopyWithImpl<$Res>
    extends _$LegalStatusCopyWithImpl<$Res, _$LegalStatusImpl>
    implements _$$LegalStatusImplCopyWith<$Res> {
  __$$LegalStatusImplCopyWithImpl(
      _$LegalStatusImpl _value, $Res Function(_$LegalStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegalStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAccepted = null,
    Object? documents = null,
  }) {
    return _then(_$LegalStatusImpl(
      allAccepted: null == allAccepted
          ? _value.allAccepted
          : allAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<LegalDocument>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LegalStatusImpl extends _LegalStatus {
  const _$LegalStatusImpl(
      {@JsonKey(name: "all_accepted") this.allAccepted = false,
      @JsonKey(name: "required")
      final List<LegalDocument> documents = const <LegalDocument>[]})
      : _documents = documents,
        super._();

  factory _$LegalStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$LegalStatusImplFromJson(json);

  @override
  @JsonKey(name: "all_accepted")
  final bool allAccepted;

  /// Wire name `required`, which collides with Dart's `@required`.
  final List<LegalDocument> _documents;

  /// Wire name `required`, which collides with Dart's `@required`.
  @override
  @JsonKey(name: "required")
  List<LegalDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'LegalStatus(allAccepted: $allAccepted, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegalStatusImpl &&
            (identical(other.allAccepted, allAccepted) ||
                other.allAccepted == allAccepted) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allAccepted,
      const DeepCollectionEquality().hash(_documents));

  /// Create a copy of LegalStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LegalStatusImplCopyWith<_$LegalStatusImpl> get copyWith =>
      __$$LegalStatusImplCopyWithImpl<_$LegalStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LegalStatusImplToJson(
      this,
    );
  }
}

abstract class _LegalStatus extends LegalStatus {
  const factory _LegalStatus(
          {@JsonKey(name: "all_accepted") final bool allAccepted,
          @JsonKey(name: "required") final List<LegalDocument> documents}) =
      _$LegalStatusImpl;
  const _LegalStatus._() : super._();

  factory _LegalStatus.fromJson(Map<String, dynamic> json) =
      _$LegalStatusImpl.fromJson;

  @override
  @JsonKey(name: "all_accepted")
  bool get allAccepted;

  /// Wire name `required`, which collides with Dart's `@required`.
  @override
  @JsonKey(name: "required")
  List<LegalDocument> get documents;

  /// Create a copy of LegalStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LegalStatusImplCopyWith<_$LegalStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LegalDocument _$LegalDocumentFromJson(Map<String, dynamic> json) {
  return _LegalDocument.fromJson(json);
}

/// @nodoc
mixin _$LegalDocument {
  /// `privacy_policy` | `terms_of_service` | `provider_agreement`
  String get document => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  bool get accepted => throw _privateConstructorUsedError;

  /// Serializes this LegalDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LegalDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LegalDocumentCopyWith<LegalDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegalDocumentCopyWith<$Res> {
  factory $LegalDocumentCopyWith(
          LegalDocument value, $Res Function(LegalDocument) then) =
      _$LegalDocumentCopyWithImpl<$Res, LegalDocument>;
  @useResult
  $Res call({String document, String version, String? url, bool accepted});
}

/// @nodoc
class _$LegalDocumentCopyWithImpl<$Res, $Val extends LegalDocument>
    implements $LegalDocumentCopyWith<$Res> {
  _$LegalDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LegalDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? version = null,
    Object? url = freezed,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LegalDocumentImplCopyWith<$Res>
    implements $LegalDocumentCopyWith<$Res> {
  factory _$$LegalDocumentImplCopyWith(
          _$LegalDocumentImpl value, $Res Function(_$LegalDocumentImpl) then) =
      __$$LegalDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String document, String version, String? url, bool accepted});
}

/// @nodoc
class __$$LegalDocumentImplCopyWithImpl<$Res>
    extends _$LegalDocumentCopyWithImpl<$Res, _$LegalDocumentImpl>
    implements _$$LegalDocumentImplCopyWith<$Res> {
  __$$LegalDocumentImplCopyWithImpl(
      _$LegalDocumentImpl _value, $Res Function(_$LegalDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegalDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? version = null,
    Object? url = freezed,
    Object? accepted = null,
  }) {
    return _then(_$LegalDocumentImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LegalDocumentImpl extends _LegalDocument {
  const _$LegalDocumentImpl(
      {required this.document,
      required this.version,
      this.url,
      this.accepted = false})
      : super._();

  factory _$LegalDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LegalDocumentImplFromJson(json);

  /// `privacy_policy` | `terms_of_service` | `provider_agreement`
  @override
  final String document;
  @override
  final String version;
  @override
  final String? url;
  @override
  @JsonKey()
  final bool accepted;

  @override
  String toString() {
    return 'LegalDocument(document: $document, version: $version, url: $url, accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegalDocumentImpl &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, document, version, url, accepted);

  /// Create a copy of LegalDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LegalDocumentImplCopyWith<_$LegalDocumentImpl> get copyWith =>
      __$$LegalDocumentImplCopyWithImpl<_$LegalDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LegalDocumentImplToJson(
      this,
    );
  }
}

abstract class _LegalDocument extends LegalDocument {
  const factory _LegalDocument(
      {required final String document,
      required final String version,
      final String? url,
      final bool accepted}) = _$LegalDocumentImpl;
  const _LegalDocument._() : super._();

  factory _LegalDocument.fromJson(Map<String, dynamic> json) =
      _$LegalDocumentImpl.fromJson;

  /// `privacy_policy` | `terms_of_service` | `provider_agreement`
  @override
  String get document;
  @override
  String get version;
  @override
  String? get url;
  @override
  bool get accepted;

  /// Create a copy of LegalDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LegalDocumentImplCopyWith<_$LegalDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
