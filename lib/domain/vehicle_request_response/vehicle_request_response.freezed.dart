// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleRequestResponse _$VehicleRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _VehicleRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$VehicleRequestResponse {
  @JsonKey(name: 'brand')
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_plate')
  String? get licensePlate => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_doc_url')
  String? get registrationDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'insurance_doc_url')
  String? get insuranceDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_image_url')
  String? get vehicleImageUrl => throw _privateConstructorUsedError;

  /// Serializes this VehicleRequestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleRequestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleRequestResponseCopyWith<VehicleRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRequestResponseCopyWith<$Res> {
  factory $VehicleRequestResponseCopyWith(VehicleRequestResponse value,
          $Res Function(VehicleRequestResponse) then) =
      _$VehicleRequestResponseCopyWithImpl<$Res, VehicleRequestResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'year') int? year,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'license_plate') String? licensePlate,
      @JsonKey(name: 'registration_doc_url') String? registrationDocUrl,
      @JsonKey(name: 'insurance_doc_url') String? insuranceDocUrl,
      @JsonKey(name: 'vehicle_image_url') String? vehicleImageUrl});
}

/// @nodoc
class _$VehicleRequestResponseCopyWithImpl<$Res,
        $Val extends VehicleRequestResponse>
    implements $VehicleRequestResponseCopyWith<$Res> {
  _$VehicleRequestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleRequestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
    Object? color = freezed,
    Object? licensePlate = freezed,
    Object? registrationDocUrl = freezed,
    Object? insuranceDocUrl = freezed,
    Object? vehicleImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDocUrl: freezed == registrationDocUrl
          ? _value.registrationDocUrl
          : registrationDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      insuranceDocUrl: freezed == insuranceDocUrl
          ? _value.insuranceDocUrl
          : insuranceDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImageUrl: freezed == vehicleImageUrl
          ? _value.vehicleImageUrl
          : vehicleImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleRequestResponseImplCopyWith<$Res>
    implements $VehicleRequestResponseCopyWith<$Res> {
  factory _$$VehicleRequestResponseImplCopyWith(
          _$VehicleRequestResponseImpl value,
          $Res Function(_$VehicleRequestResponseImpl) then) =
      __$$VehicleRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'year') int? year,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'license_plate') String? licensePlate,
      @JsonKey(name: 'registration_doc_url') String? registrationDocUrl,
      @JsonKey(name: 'insurance_doc_url') String? insuranceDocUrl,
      @JsonKey(name: 'vehicle_image_url') String? vehicleImageUrl});
}

/// @nodoc
class __$$VehicleRequestResponseImplCopyWithImpl<$Res>
    extends _$VehicleRequestResponseCopyWithImpl<$Res,
        _$VehicleRequestResponseImpl>
    implements _$$VehicleRequestResponseImplCopyWith<$Res> {
  __$$VehicleRequestResponseImplCopyWithImpl(
      _$VehicleRequestResponseImpl _value,
      $Res Function(_$VehicleRequestResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRequestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
    Object? color = freezed,
    Object? licensePlate = freezed,
    Object? registrationDocUrl = freezed,
    Object? insuranceDocUrl = freezed,
    Object? vehicleImageUrl = freezed,
  }) {
    return _then(_$VehicleRequestResponseImpl(
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDocUrl: freezed == registrationDocUrl
          ? _value.registrationDocUrl
          : registrationDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      insuranceDocUrl: freezed == insuranceDocUrl
          ? _value.insuranceDocUrl
          : insuranceDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImageUrl: freezed == vehicleImageUrl
          ? _value.vehicleImageUrl
          : vehicleImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleRequestResponseImpl implements _VehicleRequestResponse {
  const _$VehicleRequestResponseImpl(
      {@JsonKey(name: 'brand') this.brand,
      @JsonKey(name: 'model') this.model,
      @JsonKey(name: 'year') this.year,
      @JsonKey(name: 'color') this.color,
      @JsonKey(name: 'license_plate') this.licensePlate,
      @JsonKey(name: 'registration_doc_url') this.registrationDocUrl,
      @JsonKey(name: 'insurance_doc_url') this.insuranceDocUrl,
      @JsonKey(name: 'vehicle_image_url') this.vehicleImageUrl});

  factory _$VehicleRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRequestResponseImplFromJson(json);

  @override
  @JsonKey(name: 'brand')
  final String? brand;
  @override
  @JsonKey(name: 'model')
  final String? model;
  @override
  @JsonKey(name: 'year')
  final int? year;
  @override
  @JsonKey(name: 'color')
  final String? color;
  @override
  @JsonKey(name: 'license_plate')
  final String? licensePlate;
  @override
  @JsonKey(name: 'registration_doc_url')
  final String? registrationDocUrl;
  @override
  @JsonKey(name: 'insurance_doc_url')
  final String? insuranceDocUrl;
  @override
  @JsonKey(name: 'vehicle_image_url')
  final String? vehicleImageUrl;

  @override
  String toString() {
    return 'VehicleRequestResponse(brand: $brand, model: $model, year: $year, color: $color, licensePlate: $licensePlate, registrationDocUrl: $registrationDocUrl, insuranceDocUrl: $insuranceDocUrl, vehicleImageUrl: $vehicleImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRequestResponseImpl &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.registrationDocUrl, registrationDocUrl) ||
                other.registrationDocUrl == registrationDocUrl) &&
            (identical(other.insuranceDocUrl, insuranceDocUrl) ||
                other.insuranceDocUrl == insuranceDocUrl) &&
            (identical(other.vehicleImageUrl, vehicleImageUrl) ||
                other.vehicleImageUrl == vehicleImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, brand, model, year, color,
      licensePlate, registrationDocUrl, insuranceDocUrl, vehicleImageUrl);

  /// Create a copy of VehicleRequestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRequestResponseImplCopyWith<_$VehicleRequestResponseImpl>
      get copyWith => __$$VehicleRequestResponseImplCopyWithImpl<
          _$VehicleRequestResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _VehicleRequestResponse implements VehicleRequestResponse {
  const factory _VehicleRequestResponse(
      {@JsonKey(name: 'brand') final String? brand,
      @JsonKey(name: 'model') final String? model,
      @JsonKey(name: 'year') final int? year,
      @JsonKey(name: 'color') final String? color,
      @JsonKey(name: 'license_plate') final String? licensePlate,
      @JsonKey(name: 'registration_doc_url') final String? registrationDocUrl,
      @JsonKey(name: 'insurance_doc_url') final String? insuranceDocUrl,
      @JsonKey(name: 'vehicle_image_url')
      final String? vehicleImageUrl}) = _$VehicleRequestResponseImpl;

  factory _VehicleRequestResponse.fromJson(Map<String, dynamic> json) =
      _$VehicleRequestResponseImpl.fromJson;

  @override
  @JsonKey(name: 'brand')
  String? get brand;
  @override
  @JsonKey(name: 'model')
  String? get model;
  @override
  @JsonKey(name: 'year')
  int? get year;
  @override
  @JsonKey(name: 'color')
  String? get color;
  @override
  @JsonKey(name: 'license_plate')
  String? get licensePlate;
  @override
  @JsonKey(name: 'registration_doc_url')
  String? get registrationDocUrl;
  @override
  @JsonKey(name: 'insurance_doc_url')
  String? get insuranceDocUrl;
  @override
  @JsonKey(name: 'vehicle_image_url')
  String? get vehicleImageUrl;

  /// Create a copy of VehicleRequestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleRequestResponseImplCopyWith<_$VehicleRequestResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
