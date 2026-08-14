// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_refer_code_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateReferCodeResponse _$GenerateReferCodeResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateReferCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateReferCodeResponse {
  @JsonKey(name: "instructor_id")
  int? get instructorId => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "min_rides_required")
  int? get minRidesRequired => throw _privateConstructorUsedError;
  @JsonKey(name: "referral_type")
  String? get referralType => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "used_at")
  String? get usedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "rides_completed_count")
  int? get ridesCompletedCount => throw _privateConstructorUsedError;
  @JsonKey(name: "referrer_paid")
  int? get referrerPaid => throw _privateConstructorUsedError;
  @JsonKey(name: "referee_paid")
  int? get refereePaid => throw _privateConstructorUsedError;
  @JsonKey(name: "referrer_payment_date")
  String? get referrerPaymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: "referee_payment_date")
  String? get refereePaymentDate => throw _privateConstructorUsedError;

  /// Serializes this GenerateReferCodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateReferCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateReferCodeResponseCopyWith<GenerateReferCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateReferCodeResponseCopyWith<$Res> {
  factory $GenerateReferCodeResponseCopyWith(GenerateReferCodeResponse value,
          $Res Function(GenerateReferCodeResponse) then) =
      _$GenerateReferCodeResponseCopyWithImpl<$Res, GenerateReferCodeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "instructor_id") int? instructorId,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "min_rides_required") int? minRidesRequired,
      @JsonKey(name: "referral_type") String? referralType,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "used_at") String? usedAt,
      @JsonKey(name: "rides_completed_count") int? ridesCompletedCount,
      @JsonKey(name: "referrer_paid") int? referrerPaid,
      @JsonKey(name: "referee_paid") int? refereePaid,
      @JsonKey(name: "referrer_payment_date") String? referrerPaymentDate,
      @JsonKey(name: "referee_payment_date") String? refereePaymentDate});
}

/// @nodoc
class _$GenerateReferCodeResponseCopyWithImpl<$Res,
        $Val extends GenerateReferCodeResponse>
    implements $GenerateReferCodeResponseCopyWith<$Res> {
  _$GenerateReferCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateReferCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructorId = freezed,
    Object? code = freezed,
    Object? amount = freezed,
    Object? minRidesRequired = freezed,
    Object? referralType = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? ridesCompletedCount = freezed,
    Object? referrerPaid = freezed,
    Object? refereePaid = freezed,
    Object? referrerPaymentDate = freezed,
    Object? refereePaymentDate = freezed,
  }) {
    return _then(_value.copyWith(
      instructorId: freezed == instructorId
          ? _value.instructorId
          : instructorId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      minRidesRequired: freezed == minRidesRequired
          ? _value.minRidesRequired
          : minRidesRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      referralType: freezed == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      ridesCompletedCount: freezed == ridesCompletedCount
          ? _value.ridesCompletedCount
          : ridesCompletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      referrerPaid: freezed == referrerPaid
          ? _value.referrerPaid
          : referrerPaid // ignore: cast_nullable_to_non_nullable
              as int?,
      refereePaid: freezed == refereePaid
          ? _value.refereePaid
          : refereePaid // ignore: cast_nullable_to_non_nullable
              as int?,
      referrerPaymentDate: freezed == referrerPaymentDate
          ? _value.referrerPaymentDate
          : referrerPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      refereePaymentDate: freezed == refereePaymentDate
          ? _value.refereePaymentDate
          : refereePaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateReferCodeResponseImplCopyWith<$Res>
    implements $GenerateReferCodeResponseCopyWith<$Res> {
  factory _$$GenerateReferCodeResponseImplCopyWith(
          _$GenerateReferCodeResponseImpl value,
          $Res Function(_$GenerateReferCodeResponseImpl) then) =
      __$$GenerateReferCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "instructor_id") int? instructorId,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "min_rides_required") int? minRidesRequired,
      @JsonKey(name: "referral_type") String? referralType,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "used_at") String? usedAt,
      @JsonKey(name: "rides_completed_count") int? ridesCompletedCount,
      @JsonKey(name: "referrer_paid") int? referrerPaid,
      @JsonKey(name: "referee_paid") int? refereePaid,
      @JsonKey(name: "referrer_payment_date") String? referrerPaymentDate,
      @JsonKey(name: "referee_payment_date") String? refereePaymentDate});
}

/// @nodoc
class __$$GenerateReferCodeResponseImplCopyWithImpl<$Res>
    extends _$GenerateReferCodeResponseCopyWithImpl<$Res,
        _$GenerateReferCodeResponseImpl>
    implements _$$GenerateReferCodeResponseImplCopyWith<$Res> {
  __$$GenerateReferCodeResponseImplCopyWithImpl(
      _$GenerateReferCodeResponseImpl _value,
      $Res Function(_$GenerateReferCodeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateReferCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructorId = freezed,
    Object? code = freezed,
    Object? amount = freezed,
    Object? minRidesRequired = freezed,
    Object? referralType = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? ridesCompletedCount = freezed,
    Object? referrerPaid = freezed,
    Object? refereePaid = freezed,
    Object? referrerPaymentDate = freezed,
    Object? refereePaymentDate = freezed,
  }) {
    return _then(_$GenerateReferCodeResponseImpl(
      instructorId: freezed == instructorId
          ? _value.instructorId
          : instructorId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      minRidesRequired: freezed == minRidesRequired
          ? _value.minRidesRequired
          : minRidesRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      referralType: freezed == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      ridesCompletedCount: freezed == ridesCompletedCount
          ? _value.ridesCompletedCount
          : ridesCompletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      referrerPaid: freezed == referrerPaid
          ? _value.referrerPaid
          : referrerPaid // ignore: cast_nullable_to_non_nullable
              as int?,
      refereePaid: freezed == refereePaid
          ? _value.refereePaid
          : refereePaid // ignore: cast_nullable_to_non_nullable
              as int?,
      referrerPaymentDate: freezed == referrerPaymentDate
          ? _value.referrerPaymentDate
          : referrerPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      refereePaymentDate: freezed == refereePaymentDate
          ? _value.refereePaymentDate
          : refereePaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateReferCodeResponseImpl implements _GenerateReferCodeResponse {
  const _$GenerateReferCodeResponseImpl(
      {@JsonKey(name: "instructor_id") this.instructorId,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "min_rides_required") this.minRidesRequired,
      @JsonKey(name: "referral_type") this.referralType,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "used_at") this.usedAt,
      @JsonKey(name: "rides_completed_count") this.ridesCompletedCount,
      @JsonKey(name: "referrer_paid") this.referrerPaid,
      @JsonKey(name: "referee_paid") this.refereePaid,
      @JsonKey(name: "referrer_payment_date") this.referrerPaymentDate,
      @JsonKey(name: "referee_payment_date") this.refereePaymentDate});

  factory _$GenerateReferCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateReferCodeResponseImplFromJson(json);

  @override
  @JsonKey(name: "instructor_id")
  final int? instructorId;
  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "min_rides_required")
  final int? minRidesRequired;
  @override
  @JsonKey(name: "referral_type")
  final String? referralType;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "used_at")
  final String? usedAt;
  @override
  @JsonKey(name: "rides_completed_count")
  final int? ridesCompletedCount;
  @override
  @JsonKey(name: "referrer_paid")
  final int? referrerPaid;
  @override
  @JsonKey(name: "referee_paid")
  final int? refereePaid;
  @override
  @JsonKey(name: "referrer_payment_date")
  final String? referrerPaymentDate;
  @override
  @JsonKey(name: "referee_payment_date")
  final String? refereePaymentDate;

  @override
  String toString() {
    return 'GenerateReferCodeResponse(instructorId: $instructorId, code: $code, amount: $amount, minRidesRequired: $minRidesRequired, referralType: $referralType, status: $status, usedAt: $usedAt, ridesCompletedCount: $ridesCompletedCount, referrerPaid: $referrerPaid, refereePaid: $refereePaid, referrerPaymentDate: $referrerPaymentDate, refereePaymentDate: $refereePaymentDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateReferCodeResponseImpl &&
            (identical(other.instructorId, instructorId) ||
                other.instructorId == instructorId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.minRidesRequired, minRidesRequired) ||
                other.minRidesRequired == minRidesRequired) &&
            (identical(other.referralType, referralType) ||
                other.referralType == referralType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.ridesCompletedCount, ridesCompletedCount) ||
                other.ridesCompletedCount == ridesCompletedCount) &&
            (identical(other.referrerPaid, referrerPaid) ||
                other.referrerPaid == referrerPaid) &&
            (identical(other.refereePaid, refereePaid) ||
                other.refereePaid == refereePaid) &&
            (identical(other.referrerPaymentDate, referrerPaymentDate) ||
                other.referrerPaymentDate == referrerPaymentDate) &&
            (identical(other.refereePaymentDate, refereePaymentDate) ||
                other.refereePaymentDate == refereePaymentDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      instructorId,
      code,
      amount,
      minRidesRequired,
      referralType,
      status,
      usedAt,
      ridesCompletedCount,
      referrerPaid,
      refereePaid,
      referrerPaymentDate,
      refereePaymentDate);

  /// Create a copy of GenerateReferCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateReferCodeResponseImplCopyWith<_$GenerateReferCodeResponseImpl>
      get copyWith => __$$GenerateReferCodeResponseImplCopyWithImpl<
          _$GenerateReferCodeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateReferCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateReferCodeResponse implements GenerateReferCodeResponse {
  const factory _GenerateReferCodeResponse(
      {@JsonKey(name: "instructor_id") final int? instructorId,
      @JsonKey(name: "code") final String? code,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "min_rides_required") final int? minRidesRequired,
      @JsonKey(name: "referral_type") final String? referralType,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "used_at") final String? usedAt,
      @JsonKey(name: "rides_completed_count") final int? ridesCompletedCount,
      @JsonKey(name: "referrer_paid") final int? referrerPaid,
      @JsonKey(name: "referee_paid") final int? refereePaid,
      @JsonKey(name: "referrer_payment_date") final String? referrerPaymentDate,
      @JsonKey(name: "referee_payment_date")
      final String? refereePaymentDate}) = _$GenerateReferCodeResponseImpl;

  factory _GenerateReferCodeResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateReferCodeResponseImpl.fromJson;

  @override
  @JsonKey(name: "instructor_id")
  int? get instructorId;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "min_rides_required")
  int? get minRidesRequired;
  @override
  @JsonKey(name: "referral_type")
  String? get referralType;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "used_at")
  String? get usedAt;
  @override
  @JsonKey(name: "rides_completed_count")
  int? get ridesCompletedCount;
  @override
  @JsonKey(name: "referrer_paid")
  int? get referrerPaid;
  @override
  @JsonKey(name: "referee_paid")
  int? get refereePaid;
  @override
  @JsonKey(name: "referrer_payment_date")
  String? get referrerPaymentDate;
  @override
  @JsonKey(name: "referee_payment_date")
  String? get refereePaymentDate;

  /// Create a copy of GenerateReferCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateReferCodeResponseImplCopyWith<_$GenerateReferCodeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
