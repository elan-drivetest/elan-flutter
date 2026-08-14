// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstructorResponse _$InstructorResponseFromJson(Map<String, dynamic> json) {
  return _InstructorResponse.fromJson(json);
}

/// @nodoc
mixin _$InstructorResponse {
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor")
  Instructor? get instructor => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle => throw _privateConstructorUsedError;

  /// Serializes this InstructorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorResponseCopyWith<InstructorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorResponseCopyWith<$Res> {
  factory $InstructorResponseCopyWith(
          InstructorResponse value, $Res Function(InstructorResponse) then) =
      _$InstructorResponseCopyWithImpl<$Res, InstructorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "user") User? user,
      @JsonKey(name: "instructor") Instructor? instructor,
      @JsonKey(name: "vehicle") Vehicle? vehicle});

  $UserCopyWith<$Res>? get user;
  $InstructorCopyWith<$Res>? get instructor;
  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$InstructorResponseCopyWithImpl<$Res, $Val extends InstructorResponse>
    implements $InstructorResponseCopyWith<$Res> {
  _$InstructorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? instructor = freezed,
    Object? vehicle = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      instructor: freezed == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as Instructor?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
    ) as $Val);
  }

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InstructorCopyWith<$Res>? get instructor {
    if (_value.instructor == null) {
      return null;
    }

    return $InstructorCopyWith<$Res>(_value.instructor!, (value) {
      return _then(_value.copyWith(instructor: value) as $Val);
    });
  }

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $VehicleCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructorResponseImplCopyWith<$Res>
    implements $InstructorResponseCopyWith<$Res> {
  factory _$$InstructorResponseImplCopyWith(_$InstructorResponseImpl value,
          $Res Function(_$InstructorResponseImpl) then) =
      __$$InstructorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user") User? user,
      @JsonKey(name: "instructor") Instructor? instructor,
      @JsonKey(name: "vehicle") Vehicle? vehicle});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $InstructorCopyWith<$Res>? get instructor;
  @override
  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$InstructorResponseImplCopyWithImpl<$Res>
    extends _$InstructorResponseCopyWithImpl<$Res, _$InstructorResponseImpl>
    implements _$$InstructorResponseImplCopyWith<$Res> {
  __$$InstructorResponseImplCopyWithImpl(_$InstructorResponseImpl _value,
      $Res Function(_$InstructorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? instructor = freezed,
    Object? vehicle = freezed,
  }) {
    return _then(_$InstructorResponseImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      instructor: freezed == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as Instructor?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructorResponseImpl implements _InstructorResponse {
  const _$InstructorResponseImpl(
      {@JsonKey(name: "user") this.user,
      @JsonKey(name: "instructor") this.instructor,
      @JsonKey(name: "vehicle") this.vehicle});

  factory _$InstructorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorResponseImplFromJson(json);

  @override
  @JsonKey(name: "user")
  final User? user;
  @override
  @JsonKey(name: "instructor")
  final Instructor? instructor;
  @override
  @JsonKey(name: "vehicle")
  final Vehicle? vehicle;

  @override
  String toString() {
    return 'InstructorResponse(user: $user, instructor: $instructor, vehicle: $vehicle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.instructor, instructor) ||
                other.instructor == instructor) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, instructor, vehicle);

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorResponseImplCopyWith<_$InstructorResponseImpl> get copyWith =>
      __$$InstructorResponseImplCopyWithImpl<_$InstructorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorResponseImplToJson(
      this,
    );
  }
}

abstract class _InstructorResponse implements InstructorResponse {
  const factory _InstructorResponse(
          {@JsonKey(name: "user") final User? user,
          @JsonKey(name: "instructor") final Instructor? instructor,
          @JsonKey(name: "vehicle") final Vehicle? vehicle}) =
      _$InstructorResponseImpl;

  factory _InstructorResponse.fromJson(Map<String, dynamic> json) =
      _$InstructorResponseImpl.fromJson;

  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(name: "instructor")
  Instructor? get instructor;
  @override
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle;

  /// Create a copy of InstructorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorResponseImplCopyWith<_$InstructorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Instructor _$InstructorFromJson(Map<String, dynamic> json) {
  return _Instructor.fromJson(json);
}

/// @nodoc
mixin _$Instructor {
  @JsonKey(name: "driving_school_name")
  String? get drivingSchoolName => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "license_validity_date")
  DateTime? get licenseValidityDate => throw _privateConstructorUsedError;
  @JsonKey(name: "driving_license_url")
  String? get drivingLicenseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "instructor_license_url")
  String? get instructorLicenseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "work_eligibility_doc_url")
  String? get workEligibilityDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_info_doc_url")
  String? get taxInfoDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_completion_percentage")
  int? get profileCompletionPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "transfer_count")
  int? get transferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_balance")
  int? get walletBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "stripe_account_id")
  String? get stripeAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: "stripe_account_status")
  String? get stripeAccountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "stripe_account_type")
  String? get stripeAccountType => throw _privateConstructorUsedError;
  @JsonKey(name: "stripe_country")
  String? get stripeCountry => throw _privateConstructorUsedError;

  /// Serializes this Instructor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Instructor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorCopyWith<Instructor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorCopyWith<$Res> {
  factory $InstructorCopyWith(
          Instructor value, $Res Function(Instructor) then) =
      _$InstructorCopyWithImpl<$Res, Instructor>;
  @useResult
  $Res call(
      {@JsonKey(name: "driving_school_name") String? drivingSchoolName,
      @JsonKey(name: "license_number") String? licenseNumber,
      @JsonKey(name: "license_validity_date") DateTime? licenseValidityDate,
      @JsonKey(name: "driving_license_url") String? drivingLicenseUrl,
      @JsonKey(name: "instructor_license_url") String? instructorLicenseUrl,
      @JsonKey(name: "work_eligibility_doc_url") String? workEligibilityDocUrl,
      @JsonKey(name: "tax_info_doc_url") String? taxInfoDocUrl,
      @JsonKey(name: "profile_completion_percentage")
      int? profileCompletionPercentage,
      @JsonKey(name: "transfer_count") int? transferCount,
      @JsonKey(name: "wallet_balance") int? walletBalance,
      @JsonKey(name: "stripe_account_id") String? stripeAccountId,
      @JsonKey(name: "stripe_account_status") String? stripeAccountStatus,
      @JsonKey(name: "stripe_account_type") String? stripeAccountType,
      @JsonKey(name: "stripe_country") String? stripeCountry});
}

/// @nodoc
class _$InstructorCopyWithImpl<$Res, $Val extends Instructor>
    implements $InstructorCopyWith<$Res> {
  _$InstructorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Instructor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drivingSchoolName = freezed,
    Object? licenseNumber = freezed,
    Object? licenseValidityDate = freezed,
    Object? drivingLicenseUrl = freezed,
    Object? instructorLicenseUrl = freezed,
    Object? workEligibilityDocUrl = freezed,
    Object? taxInfoDocUrl = freezed,
    Object? profileCompletionPercentage = freezed,
    Object? transferCount = freezed,
    Object? walletBalance = freezed,
    Object? stripeAccountId = freezed,
    Object? stripeAccountStatus = freezed,
    Object? stripeAccountType = freezed,
    Object? stripeCountry = freezed,
  }) {
    return _then(_value.copyWith(
      drivingSchoolName: freezed == drivingSchoolName
          ? _value.drivingSchoolName
          : drivingSchoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseValidityDate: freezed == licenseValidityDate
          ? _value.licenseValidityDate
          : licenseValidityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      drivingLicenseUrl: freezed == drivingLicenseUrl
          ? _value.drivingLicenseUrl
          : drivingLicenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorLicenseUrl: freezed == instructorLicenseUrl
          ? _value.instructorLicenseUrl
          : instructorLicenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      workEligibilityDocUrl: freezed == workEligibilityDocUrl
          ? _value.workEligibilityDocUrl
          : workEligibilityDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taxInfoDocUrl: freezed == taxInfoDocUrl
          ? _value.taxInfoDocUrl
          : taxInfoDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileCompletionPercentage: freezed == profileCompletionPercentage
          ? _value.profileCompletionPercentage
          : profileCompletionPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      transferCount: freezed == transferCount
          ? _value.transferCount
          : transferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      stripeAccountId: freezed == stripeAccountId
          ? _value.stripeAccountId
          : stripeAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountStatus: freezed == stripeAccountStatus
          ? _value.stripeAccountStatus
          : stripeAccountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountType: freezed == stripeAccountType
          ? _value.stripeAccountType
          : stripeAccountType // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCountry: freezed == stripeCountry
          ? _value.stripeCountry
          : stripeCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructorImplCopyWith<$Res>
    implements $InstructorCopyWith<$Res> {
  factory _$$InstructorImplCopyWith(
          _$InstructorImpl value, $Res Function(_$InstructorImpl) then) =
      __$$InstructorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "driving_school_name") String? drivingSchoolName,
      @JsonKey(name: "license_number") String? licenseNumber,
      @JsonKey(name: "license_validity_date") DateTime? licenseValidityDate,
      @JsonKey(name: "driving_license_url") String? drivingLicenseUrl,
      @JsonKey(name: "instructor_license_url") String? instructorLicenseUrl,
      @JsonKey(name: "work_eligibility_doc_url") String? workEligibilityDocUrl,
      @JsonKey(name: "tax_info_doc_url") String? taxInfoDocUrl,
      @JsonKey(name: "profile_completion_percentage")
      int? profileCompletionPercentage,
      @JsonKey(name: "transfer_count") int? transferCount,
      @JsonKey(name: "wallet_balance") int? walletBalance,
      @JsonKey(name: "stripe_account_id") String? stripeAccountId,
      @JsonKey(name: "stripe_account_status") String? stripeAccountStatus,
      @JsonKey(name: "stripe_account_type") String? stripeAccountType,
      @JsonKey(name: "stripe_country") String? stripeCountry});
}

/// @nodoc
class __$$InstructorImplCopyWithImpl<$Res>
    extends _$InstructorCopyWithImpl<$Res, _$InstructorImpl>
    implements _$$InstructorImplCopyWith<$Res> {
  __$$InstructorImplCopyWithImpl(
      _$InstructorImpl _value, $Res Function(_$InstructorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Instructor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drivingSchoolName = freezed,
    Object? licenseNumber = freezed,
    Object? licenseValidityDate = freezed,
    Object? drivingLicenseUrl = freezed,
    Object? instructorLicenseUrl = freezed,
    Object? workEligibilityDocUrl = freezed,
    Object? taxInfoDocUrl = freezed,
    Object? profileCompletionPercentage = freezed,
    Object? transferCount = freezed,
    Object? walletBalance = freezed,
    Object? stripeAccountId = freezed,
    Object? stripeAccountStatus = freezed,
    Object? stripeAccountType = freezed,
    Object? stripeCountry = freezed,
  }) {
    return _then(_$InstructorImpl(
      drivingSchoolName: freezed == drivingSchoolName
          ? _value.drivingSchoolName
          : drivingSchoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseValidityDate: freezed == licenseValidityDate
          ? _value.licenseValidityDate
          : licenseValidityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      drivingLicenseUrl: freezed == drivingLicenseUrl
          ? _value.drivingLicenseUrl
          : drivingLicenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorLicenseUrl: freezed == instructorLicenseUrl
          ? _value.instructorLicenseUrl
          : instructorLicenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      workEligibilityDocUrl: freezed == workEligibilityDocUrl
          ? _value.workEligibilityDocUrl
          : workEligibilityDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taxInfoDocUrl: freezed == taxInfoDocUrl
          ? _value.taxInfoDocUrl
          : taxInfoDocUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileCompletionPercentage: freezed == profileCompletionPercentage
          ? _value.profileCompletionPercentage
          : profileCompletionPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      transferCount: freezed == transferCount
          ? _value.transferCount
          : transferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      stripeAccountId: freezed == stripeAccountId
          ? _value.stripeAccountId
          : stripeAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountStatus: freezed == stripeAccountStatus
          ? _value.stripeAccountStatus
          : stripeAccountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeAccountType: freezed == stripeAccountType
          ? _value.stripeAccountType
          : stripeAccountType // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCountry: freezed == stripeCountry
          ? _value.stripeCountry
          : stripeCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructorImpl implements _Instructor {
  const _$InstructorImpl(
      {@JsonKey(name: "driving_school_name") this.drivingSchoolName,
      @JsonKey(name: "license_number") this.licenseNumber,
      @JsonKey(name: "license_validity_date") this.licenseValidityDate,
      @JsonKey(name: "driving_license_url") this.drivingLicenseUrl,
      @JsonKey(name: "instructor_license_url") this.instructorLicenseUrl,
      @JsonKey(name: "work_eligibility_doc_url") this.workEligibilityDocUrl,
      @JsonKey(name: "tax_info_doc_url") this.taxInfoDocUrl,
      @JsonKey(name: "profile_completion_percentage")
      this.profileCompletionPercentage,
      @JsonKey(name: "transfer_count") this.transferCount,
      @JsonKey(name: "wallet_balance") this.walletBalance,
      @JsonKey(name: "stripe_account_id") this.stripeAccountId,
      @JsonKey(name: "stripe_account_status") this.stripeAccountStatus,
      @JsonKey(name: "stripe_account_type") this.stripeAccountType,
      @JsonKey(name: "stripe_country") this.stripeCountry});

  factory _$InstructorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorImplFromJson(json);

  @override
  @JsonKey(name: "driving_school_name")
  final String? drivingSchoolName;
  @override
  @JsonKey(name: "license_number")
  final String? licenseNumber;
  @override
  @JsonKey(name: "license_validity_date")
  final DateTime? licenseValidityDate;
  @override
  @JsonKey(name: "driving_license_url")
  final String? drivingLicenseUrl;
  @override
  @JsonKey(name: "instructor_license_url")
  final String? instructorLicenseUrl;
  @override
  @JsonKey(name: "work_eligibility_doc_url")
  final String? workEligibilityDocUrl;
  @override
  @JsonKey(name: "tax_info_doc_url")
  final String? taxInfoDocUrl;
  @override
  @JsonKey(name: "profile_completion_percentage")
  final int? profileCompletionPercentage;
  @override
  @JsonKey(name: "transfer_count")
  final int? transferCount;
  @override
  @JsonKey(name: "wallet_balance")
  final int? walletBalance;
  @override
  @JsonKey(name: "stripe_account_id")
  final String? stripeAccountId;
  @override
  @JsonKey(name: "stripe_account_status")
  final String? stripeAccountStatus;
  @override
  @JsonKey(name: "stripe_account_type")
  final String? stripeAccountType;
  @override
  @JsonKey(name: "stripe_country")
  final String? stripeCountry;

  @override
  String toString() {
    return 'Instructor(drivingSchoolName: $drivingSchoolName, licenseNumber: $licenseNumber, licenseValidityDate: $licenseValidityDate, drivingLicenseUrl: $drivingLicenseUrl, instructorLicenseUrl: $instructorLicenseUrl, workEligibilityDocUrl: $workEligibilityDocUrl, taxInfoDocUrl: $taxInfoDocUrl, profileCompletionPercentage: $profileCompletionPercentage, transferCount: $transferCount, walletBalance: $walletBalance, stripeAccountId: $stripeAccountId, stripeAccountStatus: $stripeAccountStatus, stripeAccountType: $stripeAccountType, stripeCountry: $stripeCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorImpl &&
            (identical(other.drivingSchoolName, drivingSchoolName) ||
                other.drivingSchoolName == drivingSchoolName) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseValidityDate, licenseValidityDate) ||
                other.licenseValidityDate == licenseValidityDate) &&
            (identical(other.drivingLicenseUrl, drivingLicenseUrl) ||
                other.drivingLicenseUrl == drivingLicenseUrl) &&
            (identical(other.instructorLicenseUrl, instructorLicenseUrl) ||
                other.instructorLicenseUrl == instructorLicenseUrl) &&
            (identical(other.workEligibilityDocUrl, workEligibilityDocUrl) ||
                other.workEligibilityDocUrl == workEligibilityDocUrl) &&
            (identical(other.taxInfoDocUrl, taxInfoDocUrl) ||
                other.taxInfoDocUrl == taxInfoDocUrl) &&
            (identical(other.profileCompletionPercentage,
                    profileCompletionPercentage) ||
                other.profileCompletionPercentage ==
                    profileCompletionPercentage) &&
            (identical(other.transferCount, transferCount) ||
                other.transferCount == transferCount) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.stripeAccountId, stripeAccountId) ||
                other.stripeAccountId == stripeAccountId) &&
            (identical(other.stripeAccountStatus, stripeAccountStatus) ||
                other.stripeAccountStatus == stripeAccountStatus) &&
            (identical(other.stripeAccountType, stripeAccountType) ||
                other.stripeAccountType == stripeAccountType) &&
            (identical(other.stripeCountry, stripeCountry) ||
                other.stripeCountry == stripeCountry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      drivingSchoolName,
      licenseNumber,
      licenseValidityDate,
      drivingLicenseUrl,
      instructorLicenseUrl,
      workEligibilityDocUrl,
      taxInfoDocUrl,
      profileCompletionPercentage,
      transferCount,
      walletBalance,
      stripeAccountId,
      stripeAccountStatus,
      stripeAccountType,
      stripeCountry);

  /// Create a copy of Instructor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorImplCopyWith<_$InstructorImpl> get copyWith =>
      __$$InstructorImplCopyWithImpl<_$InstructorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorImplToJson(
      this,
    );
  }
}

abstract class _Instructor implements Instructor {
  const factory _Instructor(
      {@JsonKey(name: "driving_school_name") final String? drivingSchoolName,
      @JsonKey(name: "license_number") final String? licenseNumber,
      @JsonKey(name: "license_validity_date")
      final DateTime? licenseValidityDate,
      @JsonKey(name: "driving_license_url") final String? drivingLicenseUrl,
      @JsonKey(name: "instructor_license_url")
      final String? instructorLicenseUrl,
      @JsonKey(name: "work_eligibility_doc_url")
      final String? workEligibilityDocUrl,
      @JsonKey(name: "tax_info_doc_url") final String? taxInfoDocUrl,
      @JsonKey(name: "profile_completion_percentage")
      final int? profileCompletionPercentage,
      @JsonKey(name: "transfer_count") final int? transferCount,
      @JsonKey(name: "wallet_balance") final int? walletBalance,
      @JsonKey(name: "stripe_account_id") final String? stripeAccountId,
      @JsonKey(name: "stripe_account_status") final String? stripeAccountStatus,
      @JsonKey(name: "stripe_account_type") final String? stripeAccountType,
      @JsonKey(name: "stripe_country")
      final String? stripeCountry}) = _$InstructorImpl;

  factory _Instructor.fromJson(Map<String, dynamic> json) =
      _$InstructorImpl.fromJson;

  @override
  @JsonKey(name: "driving_school_name")
  String? get drivingSchoolName;
  @override
  @JsonKey(name: "license_number")
  String? get licenseNumber;
  @override
  @JsonKey(name: "license_validity_date")
  DateTime? get licenseValidityDate;
  @override
  @JsonKey(name: "driving_license_url")
  String? get drivingLicenseUrl;
  @override
  @JsonKey(name: "instructor_license_url")
  String? get instructorLicenseUrl;
  @override
  @JsonKey(name: "work_eligibility_doc_url")
  String? get workEligibilityDocUrl;
  @override
  @JsonKey(name: "tax_info_doc_url")
  String? get taxInfoDocUrl;
  @override
  @JsonKey(name: "profile_completion_percentage")
  int? get profileCompletionPercentage;
  @override
  @JsonKey(name: "transfer_count")
  int? get transferCount;
  @override
  @JsonKey(name: "wallet_balance")
  int? get walletBalance;
  @override
  @JsonKey(name: "stripe_account_id")
  String? get stripeAccountId;
  @override
  @JsonKey(name: "stripe_account_status")
  String? get stripeAccountStatus;
  @override
  @JsonKey(name: "stripe_account_type")
  String? get stripeAccountType;
  @override
  @JsonKey(name: "stripe_country")
  String? get stripeCountry;

  /// Create a copy of Instructor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorImplCopyWith<_$InstructorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "photo_url")
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "photo_url") String? photoUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "photo_url") String? photoUrl});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "photo_url") this.photoUrl});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "photo_url")
  final String? photoUrl;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, address: $address, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, email, phoneNumber, address, photoUrl);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "photo_url") final String? photoUrl}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "photo_url")
  String? get photoUrl;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  @JsonKey(name: "brand")
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: "model")
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: "year")
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "license_plate")
  String? get licensePlate => throw _privateConstructorUsedError;
  @JsonKey(name: "registration_doc_url")
  String? get registrationDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "insurance_doc_url")
  String? get insuranceDocUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_image_url")
  String? get vehicleImageUrl => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {@JsonKey(name: "brand") String? brand,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "year") int? year,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "license_plate") String? licensePlate,
      @JsonKey(name: "registration_doc_url") String? registrationDocUrl,
      @JsonKey(name: "insurance_doc_url") String? insuranceDocUrl,
      @JsonKey(name: "vehicle_image_url") String? vehicleImageUrl});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
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
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "brand") String? brand,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "year") int? year,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "license_plate") String? licensePlate,
      @JsonKey(name: "registration_doc_url") String? registrationDocUrl,
      @JsonKey(name: "insurance_doc_url") String? insuranceDocUrl,
      @JsonKey(name: "vehicle_image_url") String? vehicleImageUrl});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vehicle
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
    return _then(_$VehicleImpl(
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
class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl(
      {@JsonKey(name: "brand") this.brand,
      @JsonKey(name: "model") this.model,
      @JsonKey(name: "year") this.year,
      @JsonKey(name: "color") this.color,
      @JsonKey(name: "license_plate") this.licensePlate,
      @JsonKey(name: "registration_doc_url") this.registrationDocUrl,
      @JsonKey(name: "insurance_doc_url") this.insuranceDocUrl,
      @JsonKey(name: "vehicle_image_url") this.vehicleImageUrl});

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  @JsonKey(name: "brand")
  final String? brand;
  @override
  @JsonKey(name: "model")
  final String? model;
  @override
  @JsonKey(name: "year")
  final int? year;
  @override
  @JsonKey(name: "color")
  final String? color;
  @override
  @JsonKey(name: "license_plate")
  final String? licensePlate;
  @override
  @JsonKey(name: "registration_doc_url")
  final String? registrationDocUrl;
  @override
  @JsonKey(name: "insurance_doc_url")
  final String? insuranceDocUrl;
  @override
  @JsonKey(name: "vehicle_image_url")
  final String? vehicleImageUrl;

  @override
  String toString() {
    return 'Vehicle(brand: $brand, model: $model, year: $year, color: $color, licensePlate: $licensePlate, registrationDocUrl: $registrationDocUrl, insuranceDocUrl: $insuranceDocUrl, vehicleImageUrl: $vehicleImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
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

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
      {@JsonKey(name: "brand") final String? brand,
      @JsonKey(name: "model") final String? model,
      @JsonKey(name: "year") final int? year,
      @JsonKey(name: "color") final String? color,
      @JsonKey(name: "license_plate") final String? licensePlate,
      @JsonKey(name: "registration_doc_url") final String? registrationDocUrl,
      @JsonKey(name: "insurance_doc_url") final String? insuranceDocUrl,
      @JsonKey(name: "vehicle_image_url")
      final String? vehicleImageUrl}) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  @JsonKey(name: "brand")
  String? get brand;
  @override
  @JsonKey(name: "model")
  String? get model;
  @override
  @JsonKey(name: "year")
  int? get year;
  @override
  @JsonKey(name: "color")
  String? get color;
  @override
  @JsonKey(name: "license_plate")
  String? get licensePlate;
  @override
  @JsonKey(name: "registration_doc_url")
  String? get registrationDocUrl;
  @override
  @JsonKey(name: "insurance_doc_url")
  String? get insuranceDocUrl;
  @override
  @JsonKey(name: "vehicle_image_url")
  String? get vehicleImageUrl;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
