// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_code_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralCodeSummaryResponse _$ReferralCodeSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _ReferralCodeSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralCodeSummaryResponse {
  @JsonKey(name: "my_code")
  MyCode? get myCode => throw _privateConstructorUsedError;
  @JsonKey(name: "referrer")
  Referrer? get referrer => throw _privateConstructorUsedError;
  @JsonKey(name: "peer_claim")
  PeerClaim? get peerClaim => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_promos")
  AdminPromos? get adminPromos => throw _privateConstructorUsedError;
  @JsonKey(name: "totals")
  Totals? get totals => throw _privateConstructorUsedError;

  /// Serializes this ReferralCodeSummaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralCodeSummaryResponseCopyWith<ReferralCodeSummaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeSummaryResponseCopyWith<$Res> {
  factory $ReferralCodeSummaryResponseCopyWith(
          ReferralCodeSummaryResponse value,
          $Res Function(ReferralCodeSummaryResponse) then) =
      _$ReferralCodeSummaryResponseCopyWithImpl<$Res,
          ReferralCodeSummaryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "my_code") MyCode? myCode,
      @JsonKey(name: "referrer") Referrer? referrer,
      @JsonKey(name: "peer_claim") PeerClaim? peerClaim,
      @JsonKey(name: "admin_promos") AdminPromos? adminPromos,
      @JsonKey(name: "totals") Totals? totals});

  $MyCodeCopyWith<$Res>? get myCode;
  $ReferrerCopyWith<$Res>? get referrer;
  $PeerClaimCopyWith<$Res>? get peerClaim;
  $AdminPromosCopyWith<$Res>? get adminPromos;
  $TotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class _$ReferralCodeSummaryResponseCopyWithImpl<$Res,
        $Val extends ReferralCodeSummaryResponse>
    implements $ReferralCodeSummaryResponseCopyWith<$Res> {
  _$ReferralCodeSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myCode = freezed,
    Object? referrer = freezed,
    Object? peerClaim = freezed,
    Object? adminPromos = freezed,
    Object? totals = freezed,
  }) {
    return _then(_value.copyWith(
      myCode: freezed == myCode
          ? _value.myCode
          : myCode // ignore: cast_nullable_to_non_nullable
              as MyCode?,
      referrer: freezed == referrer
          ? _value.referrer
          : referrer // ignore: cast_nullable_to_non_nullable
              as Referrer?,
      peerClaim: freezed == peerClaim
          ? _value.peerClaim
          : peerClaim // ignore: cast_nullable_to_non_nullable
              as PeerClaim?,
      adminPromos: freezed == adminPromos
          ? _value.adminPromos
          : adminPromos // ignore: cast_nullable_to_non_nullable
              as AdminPromos?,
      totals: freezed == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Totals?,
    ) as $Val);
  }

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyCodeCopyWith<$Res>? get myCode {
    if (_value.myCode == null) {
      return null;
    }

    return $MyCodeCopyWith<$Res>(_value.myCode!, (value) {
      return _then(_value.copyWith(myCode: value) as $Val);
    });
  }

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReferrerCopyWith<$Res>? get referrer {
    if (_value.referrer == null) {
      return null;
    }

    return $ReferrerCopyWith<$Res>(_value.referrer!, (value) {
      return _then(_value.copyWith(referrer: value) as $Val);
    });
  }

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PeerClaimCopyWith<$Res>? get peerClaim {
    if (_value.peerClaim == null) {
      return null;
    }

    return $PeerClaimCopyWith<$Res>(_value.peerClaim!, (value) {
      return _then(_value.copyWith(peerClaim: value) as $Val);
    });
  }

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminPromosCopyWith<$Res>? get adminPromos {
    if (_value.adminPromos == null) {
      return null;
    }

    return $AdminPromosCopyWith<$Res>(_value.adminPromos!, (value) {
      return _then(_value.copyWith(adminPromos: value) as $Val);
    });
  }

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalsCopyWith<$Res>? get totals {
    if (_value.totals == null) {
      return null;
    }

    return $TotalsCopyWith<$Res>(_value.totals!, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralCodeSummaryResponseImplCopyWith<$Res>
    implements $ReferralCodeSummaryResponseCopyWith<$Res> {
  factory _$$ReferralCodeSummaryResponseImplCopyWith(
          _$ReferralCodeSummaryResponseImpl value,
          $Res Function(_$ReferralCodeSummaryResponseImpl) then) =
      __$$ReferralCodeSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "my_code") MyCode? myCode,
      @JsonKey(name: "referrer") Referrer? referrer,
      @JsonKey(name: "peer_claim") PeerClaim? peerClaim,
      @JsonKey(name: "admin_promos") AdminPromos? adminPromos,
      @JsonKey(name: "totals") Totals? totals});

  @override
  $MyCodeCopyWith<$Res>? get myCode;
  @override
  $ReferrerCopyWith<$Res>? get referrer;
  @override
  $PeerClaimCopyWith<$Res>? get peerClaim;
  @override
  $AdminPromosCopyWith<$Res>? get adminPromos;
  @override
  $TotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class __$$ReferralCodeSummaryResponseImplCopyWithImpl<$Res>
    extends _$ReferralCodeSummaryResponseCopyWithImpl<$Res,
        _$ReferralCodeSummaryResponseImpl>
    implements _$$ReferralCodeSummaryResponseImplCopyWith<$Res> {
  __$$ReferralCodeSummaryResponseImplCopyWithImpl(
      _$ReferralCodeSummaryResponseImpl _value,
      $Res Function(_$ReferralCodeSummaryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myCode = freezed,
    Object? referrer = freezed,
    Object? peerClaim = freezed,
    Object? adminPromos = freezed,
    Object? totals = freezed,
  }) {
    return _then(_$ReferralCodeSummaryResponseImpl(
      myCode: freezed == myCode
          ? _value.myCode
          : myCode // ignore: cast_nullable_to_non_nullable
              as MyCode?,
      referrer: freezed == referrer
          ? _value.referrer
          : referrer // ignore: cast_nullable_to_non_nullable
              as Referrer?,
      peerClaim: freezed == peerClaim
          ? _value.peerClaim
          : peerClaim // ignore: cast_nullable_to_non_nullable
              as PeerClaim?,
      adminPromos: freezed == adminPromos
          ? _value.adminPromos
          : adminPromos // ignore: cast_nullable_to_non_nullable
              as AdminPromos?,
      totals: freezed == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Totals?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralCodeSummaryResponseImpl
    implements _ReferralCodeSummaryResponse {
  const _$ReferralCodeSummaryResponseImpl(
      {@JsonKey(name: "my_code") this.myCode,
      @JsonKey(name: "referrer") this.referrer,
      @JsonKey(name: "peer_claim") this.peerClaim,
      @JsonKey(name: "admin_promos") this.adminPromos,
      @JsonKey(name: "totals") this.totals});

  factory _$ReferralCodeSummaryResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReferralCodeSummaryResponseImplFromJson(json);

  @override
  @JsonKey(name: "my_code")
  final MyCode? myCode;
  @override
  @JsonKey(name: "referrer")
  final Referrer? referrer;
  @override
  @JsonKey(name: "peer_claim")
  final PeerClaim? peerClaim;
  @override
  @JsonKey(name: "admin_promos")
  final AdminPromos? adminPromos;
  @override
  @JsonKey(name: "totals")
  final Totals? totals;

  @override
  String toString() {
    return 'ReferralCodeSummaryResponse(myCode: $myCode, referrer: $referrer, peerClaim: $peerClaim, adminPromos: $adminPromos, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeSummaryResponseImpl &&
            (identical(other.myCode, myCode) || other.myCode == myCode) &&
            (identical(other.referrer, referrer) ||
                other.referrer == referrer) &&
            (identical(other.peerClaim, peerClaim) ||
                other.peerClaim == peerClaim) &&
            (identical(other.adminPromos, adminPromos) ||
                other.adminPromos == adminPromos) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, myCode, referrer, peerClaim, adminPromos, totals);

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeSummaryResponseImplCopyWith<_$ReferralCodeSummaryResponseImpl>
      get copyWith => __$$ReferralCodeSummaryResponseImplCopyWithImpl<
          _$ReferralCodeSummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralCodeSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _ReferralCodeSummaryResponse
    implements ReferralCodeSummaryResponse {
  const factory _ReferralCodeSummaryResponse(
          {@JsonKey(name: "my_code") final MyCode? myCode,
          @JsonKey(name: "referrer") final Referrer? referrer,
          @JsonKey(name: "peer_claim") final PeerClaim? peerClaim,
          @JsonKey(name: "admin_promos") final AdminPromos? adminPromos,
          @JsonKey(name: "totals") final Totals? totals}) =
      _$ReferralCodeSummaryResponseImpl;

  factory _ReferralCodeSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralCodeSummaryResponseImpl.fromJson;

  @override
  @JsonKey(name: "my_code")
  MyCode? get myCode;
  @override
  @JsonKey(name: "referrer")
  Referrer? get referrer;
  @override
  @JsonKey(name: "peer_claim")
  PeerClaim? get peerClaim;
  @override
  @JsonKey(name: "admin_promos")
  AdminPromos? get adminPromos;
  @override
  @JsonKey(name: "totals")
  Totals? get totals;

  /// Create a copy of ReferralCodeSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralCodeSummaryResponseImplCopyWith<_$ReferralCodeSummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MyCode _$MyCodeFromJson(Map<String, dynamic> json) {
  return _MyCode.fromJson(json);
}

/// @nodoc
mixin _$MyCode {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "total_claims")
  int? get totalClaims => throw _privateConstructorUsedError;

  /// Serializes this MyCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyCodeCopyWith<MyCode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCodeCopyWith<$Res> {
  factory $MyCodeCopyWith(MyCode value, $Res Function(MyCode) then) =
      _$MyCodeCopyWithImpl<$Res, MyCode>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "total_claims") int? totalClaims});
}

/// @nodoc
class _$MyCodeCopyWithImpl<$Res, $Val extends MyCode>
    implements $MyCodeCopyWith<$Res> {
  _$MyCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? status = freezed,
    Object? totalClaims = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalClaims: freezed == totalClaims
          ? _value.totalClaims
          : totalClaims // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyCodeImplCopyWith<$Res> implements $MyCodeCopyWith<$Res> {
  factory _$$MyCodeImplCopyWith(
          _$MyCodeImpl value, $Res Function(_$MyCodeImpl) then) =
      __$$MyCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "total_claims") int? totalClaims});
}

/// @nodoc
class __$$MyCodeImplCopyWithImpl<$Res>
    extends _$MyCodeCopyWithImpl<$Res, _$MyCodeImpl>
    implements _$$MyCodeImplCopyWith<$Res> {
  __$$MyCodeImplCopyWithImpl(
      _$MyCodeImpl _value, $Res Function(_$MyCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? status = freezed,
    Object? totalClaims = freezed,
  }) {
    return _then(_$MyCodeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalClaims: freezed == totalClaims
          ? _value.totalClaims
          : totalClaims // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyCodeImpl implements _MyCode {
  const _$MyCodeImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "total_claims") this.totalClaims});

  factory _$MyCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyCodeImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "total_claims")
  final int? totalClaims;

  @override
  String toString() {
    return 'MyCode(id: $id, code: $code, status: $status, totalClaims: $totalClaims)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalClaims, totalClaims) ||
                other.totalClaims == totalClaims));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, status, totalClaims);

  /// Create a copy of MyCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCodeImplCopyWith<_$MyCodeImpl> get copyWith =>
      __$$MyCodeImplCopyWithImpl<_$MyCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyCodeImplToJson(
      this,
    );
  }
}

abstract class _MyCode implements MyCode {
  const factory _MyCode(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "code") final String? code,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "total_claims") final int? totalClaims}) = _$MyCodeImpl;

  factory _MyCode.fromJson(Map<String, dynamic> json) = _$MyCodeImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "total_claims")
  int? get totalClaims;

  /// Create a copy of MyCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyCodeImplCopyWith<_$MyCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Referrer _$ReferrerFromJson(Map<String, dynamic> json) {
  return _Referrer.fromJson(json);
}

/// @nodoc
mixin _$Referrer {
  @JsonKey(name: "total_referees")
  int? get totalReferees => throw _privateConstructorUsedError;
  @JsonKey(name: "bonuses_disbursed")
  num? get bonusesDisbursed => throw _privateConstructorUsedError;
  @JsonKey(name: "total_earned")
  num? get totalEarned => throw _privateConstructorUsedError;
  @JsonKey(name: "payouts")
  List<dynamic>? get payouts => throw _privateConstructorUsedError;

  /// Serializes this Referrer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Referrer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferrerCopyWith<Referrer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferrerCopyWith<$Res> {
  factory $ReferrerCopyWith(Referrer value, $Res Function(Referrer) then) =
      _$ReferrerCopyWithImpl<$Res, Referrer>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_referees") int? totalReferees,
      @JsonKey(name: "bonuses_disbursed") num? bonusesDisbursed,
      @JsonKey(name: "total_earned") num? totalEarned,
      @JsonKey(name: "payouts") List<dynamic>? payouts});
}

/// @nodoc
class _$ReferrerCopyWithImpl<$Res, $Val extends Referrer>
    implements $ReferrerCopyWith<$Res> {
  _$ReferrerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Referrer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferees = freezed,
    Object? bonusesDisbursed = freezed,
    Object? totalEarned = freezed,
    Object? payouts = freezed,
  }) {
    return _then(_value.copyWith(
      totalReferees: freezed == totalReferees
          ? _value.totalReferees
          : totalReferees // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusesDisbursed: freezed == bonusesDisbursed
          ? _value.bonusesDisbursed
          : bonusesDisbursed // ignore: cast_nullable_to_non_nullable
              as num?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
      payouts: freezed == payouts
          ? _value.payouts
          : payouts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferrerImplCopyWith<$Res>
    implements $ReferrerCopyWith<$Res> {
  factory _$$ReferrerImplCopyWith(
          _$ReferrerImpl value, $Res Function(_$ReferrerImpl) then) =
      __$$ReferrerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_referees") int? totalReferees,
      @JsonKey(name: "bonuses_disbursed") num? bonusesDisbursed,
      @JsonKey(name: "total_earned") num? totalEarned,
      @JsonKey(name: "payouts") List<dynamic>? payouts});
}

/// @nodoc
class __$$ReferrerImplCopyWithImpl<$Res>
    extends _$ReferrerCopyWithImpl<$Res, _$ReferrerImpl>
    implements _$$ReferrerImplCopyWith<$Res> {
  __$$ReferrerImplCopyWithImpl(
      _$ReferrerImpl _value, $Res Function(_$ReferrerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Referrer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferees = freezed,
    Object? bonusesDisbursed = freezed,
    Object? totalEarned = freezed,
    Object? payouts = freezed,
  }) {
    return _then(_$ReferrerImpl(
      totalReferees: freezed == totalReferees
          ? _value.totalReferees
          : totalReferees // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusesDisbursed: freezed == bonusesDisbursed
          ? _value.bonusesDisbursed
          : bonusesDisbursed // ignore: cast_nullable_to_non_nullable
              as num?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
      payouts: freezed == payouts
          ? _value._payouts
          : payouts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferrerImpl implements _Referrer {
  const _$ReferrerImpl(
      {@JsonKey(name: "total_referees") this.totalReferees,
      @JsonKey(name: "bonuses_disbursed") this.bonusesDisbursed,
      @JsonKey(name: "total_earned") this.totalEarned,
      @JsonKey(name: "payouts") final List<dynamic>? payouts})
      : _payouts = payouts;

  factory _$ReferrerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferrerImplFromJson(json);

  @override
  @JsonKey(name: "total_referees")
  final int? totalReferees;
  @override
  @JsonKey(name: "bonuses_disbursed")
  final num? bonusesDisbursed;
  @override
  @JsonKey(name: "total_earned")
  final num? totalEarned;
  final List<dynamic>? _payouts;
  @override
  @JsonKey(name: "payouts")
  List<dynamic>? get payouts {
    final value = _payouts;
    if (value == null) return null;
    if (_payouts is EqualUnmodifiableListView) return _payouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Referrer(totalReferees: $totalReferees, bonusesDisbursed: $bonusesDisbursed, totalEarned: $totalEarned, payouts: $payouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferrerImpl &&
            (identical(other.totalReferees, totalReferees) ||
                other.totalReferees == totalReferees) &&
            (identical(other.bonusesDisbursed, bonusesDisbursed) ||
                other.bonusesDisbursed == bonusesDisbursed) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned) &&
            const DeepCollectionEquality().equals(other._payouts, _payouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReferees, bonusesDisbursed,
      totalEarned, const DeepCollectionEquality().hash(_payouts));

  /// Create a copy of Referrer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferrerImplCopyWith<_$ReferrerImpl> get copyWith =>
      __$$ReferrerImplCopyWithImpl<_$ReferrerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferrerImplToJson(
      this,
    );
  }
}

abstract class _Referrer implements Referrer {
  const factory _Referrer(
      {@JsonKey(name: "total_referees") final int? totalReferees,
      @JsonKey(name: "bonuses_disbursed") final num? bonusesDisbursed,
      @JsonKey(name: "total_earned") final num? totalEarned,
      @JsonKey(name: "payouts") final List<dynamic>? payouts}) = _$ReferrerImpl;

  factory _Referrer.fromJson(Map<String, dynamic> json) =
      _$ReferrerImpl.fromJson;

  @override
  @JsonKey(name: "total_referees")
  int? get totalReferees;
  @override
  @JsonKey(name: "bonuses_disbursed")
  num? get bonusesDisbursed;
  @override
  @JsonKey(name: "total_earned")
  num? get totalEarned;
  @override
  @JsonKey(name: "payouts")
  List<dynamic>? get payouts;

  /// Create a copy of Referrer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferrerImplCopyWith<_$ReferrerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PeerClaim _$PeerClaimFromJson(Map<String, dynamic> json) {
  return _PeerClaim.fromJson(json);
}

/// @nodoc
mixin _$PeerClaim {
  @JsonKey(name: "referral_code_id")
  int? get referralCodeId => throw _privateConstructorUsedError;
  @JsonKey(name: "claimed_at")
  String? get claimedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "rides_after_claim")
  int? get ridesAfterClaim => throw _privateConstructorUsedError;
  @JsonKey(name: "min_rides_required")
  int? get minRidesRequired => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "bonus_amount")
  num? get bonusAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "bonus_paid_at")
  String? get bonusPaidAt => throw _privateConstructorUsedError;

  /// Serializes this PeerClaim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PeerClaim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeerClaimCopyWith<PeerClaim> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeerClaimCopyWith<$Res> {
  factory $PeerClaimCopyWith(PeerClaim value, $Res Function(PeerClaim) then) =
      _$PeerClaimCopyWithImpl<$Res, PeerClaim>;
  @useResult
  $Res call(
      {@JsonKey(name: "referral_code_id") int? referralCodeId,
      @JsonKey(name: "claimed_at") String? claimedAt,
      @JsonKey(name: "rides_after_claim") int? ridesAfterClaim,
      @JsonKey(name: "min_rides_required") int? minRidesRequired,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "bonus_amount") num? bonusAmount,
      @JsonKey(name: "bonus_paid_at") String? bonusPaidAt});
}

/// @nodoc
class _$PeerClaimCopyWithImpl<$Res, $Val extends PeerClaim>
    implements $PeerClaimCopyWith<$Res> {
  _$PeerClaimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PeerClaim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCodeId = freezed,
    Object? claimedAt = freezed,
    Object? ridesAfterClaim = freezed,
    Object? minRidesRequired = freezed,
    Object? status = freezed,
    Object? bonusAmount = freezed,
    Object? bonusPaidAt = freezed,
  }) {
    return _then(_value.copyWith(
      referralCodeId: freezed == referralCodeId
          ? _value.referralCodeId
          : referralCodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      ridesAfterClaim: freezed == ridesAfterClaim
          ? _value.ridesAfterClaim
          : ridesAfterClaim // ignore: cast_nullable_to_non_nullable
              as int?,
      minRidesRequired: freezed == minRidesRequired
          ? _value.minRidesRequired
          : minRidesRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusAmount: freezed == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      bonusPaidAt: freezed == bonusPaidAt
          ? _value.bonusPaidAt
          : bonusPaidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeerClaimImplCopyWith<$Res>
    implements $PeerClaimCopyWith<$Res> {
  factory _$$PeerClaimImplCopyWith(
          _$PeerClaimImpl value, $Res Function(_$PeerClaimImpl) then) =
      __$$PeerClaimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "referral_code_id") int? referralCodeId,
      @JsonKey(name: "claimed_at") String? claimedAt,
      @JsonKey(name: "rides_after_claim") int? ridesAfterClaim,
      @JsonKey(name: "min_rides_required") int? minRidesRequired,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "bonus_amount") num? bonusAmount,
      @JsonKey(name: "bonus_paid_at") String? bonusPaidAt});
}

/// @nodoc
class __$$PeerClaimImplCopyWithImpl<$Res>
    extends _$PeerClaimCopyWithImpl<$Res, _$PeerClaimImpl>
    implements _$$PeerClaimImplCopyWith<$Res> {
  __$$PeerClaimImplCopyWithImpl(
      _$PeerClaimImpl _value, $Res Function(_$PeerClaimImpl) _then)
      : super(_value, _then);

  /// Create a copy of PeerClaim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCodeId = freezed,
    Object? claimedAt = freezed,
    Object? ridesAfterClaim = freezed,
    Object? minRidesRequired = freezed,
    Object? status = freezed,
    Object? bonusAmount = freezed,
    Object? bonusPaidAt = freezed,
  }) {
    return _then(_$PeerClaimImpl(
      referralCodeId: freezed == referralCodeId
          ? _value.referralCodeId
          : referralCodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      ridesAfterClaim: freezed == ridesAfterClaim
          ? _value.ridesAfterClaim
          : ridesAfterClaim // ignore: cast_nullable_to_non_nullable
              as int?,
      minRidesRequired: freezed == minRidesRequired
          ? _value.minRidesRequired
          : minRidesRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusAmount: freezed == bonusAmount
          ? _value.bonusAmount
          : bonusAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      bonusPaidAt: freezed == bonusPaidAt
          ? _value.bonusPaidAt
          : bonusPaidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeerClaimImpl implements _PeerClaim {
  const _$PeerClaimImpl(
      {@JsonKey(name: "referral_code_id") this.referralCodeId,
      @JsonKey(name: "claimed_at") this.claimedAt,
      @JsonKey(name: "rides_after_claim") this.ridesAfterClaim,
      @JsonKey(name: "min_rides_required") this.minRidesRequired,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "bonus_amount") this.bonusAmount,
      @JsonKey(name: "bonus_paid_at") this.bonusPaidAt});

  factory _$PeerClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeerClaimImplFromJson(json);

  @override
  @JsonKey(name: "referral_code_id")
  final int? referralCodeId;
  @override
  @JsonKey(name: "claimed_at")
  final String? claimedAt;
  @override
  @JsonKey(name: "rides_after_claim")
  final int? ridesAfterClaim;
  @override
  @JsonKey(name: "min_rides_required")
  final int? minRidesRequired;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "bonus_amount")
  final num? bonusAmount;
  @override
  @JsonKey(name: "bonus_paid_at")
  final String? bonusPaidAt;

  @override
  String toString() {
    return 'PeerClaim(referralCodeId: $referralCodeId, claimedAt: $claimedAt, ridesAfterClaim: $ridesAfterClaim, minRidesRequired: $minRidesRequired, status: $status, bonusAmount: $bonusAmount, bonusPaidAt: $bonusPaidAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeerClaimImpl &&
            (identical(other.referralCodeId, referralCodeId) ||
                other.referralCodeId == referralCodeId) &&
            (identical(other.claimedAt, claimedAt) ||
                other.claimedAt == claimedAt) &&
            (identical(other.ridesAfterClaim, ridesAfterClaim) ||
                other.ridesAfterClaim == ridesAfterClaim) &&
            (identical(other.minRidesRequired, minRidesRequired) ||
                other.minRidesRequired == minRidesRequired) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bonusAmount, bonusAmount) ||
                other.bonusAmount == bonusAmount) &&
            (identical(other.bonusPaidAt, bonusPaidAt) ||
                other.bonusPaidAt == bonusPaidAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referralCodeId, claimedAt,
      ridesAfterClaim, minRidesRequired, status, bonusAmount, bonusPaidAt);

  /// Create a copy of PeerClaim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PeerClaimImplCopyWith<_$PeerClaimImpl> get copyWith =>
      __$$PeerClaimImplCopyWithImpl<_$PeerClaimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeerClaimImplToJson(
      this,
    );
  }
}

abstract class _PeerClaim implements PeerClaim {
  const factory _PeerClaim(
          {@JsonKey(name: "referral_code_id") final int? referralCodeId,
          @JsonKey(name: "claimed_at") final String? claimedAt,
          @JsonKey(name: "rides_after_claim") final int? ridesAfterClaim,
          @JsonKey(name: "min_rides_required") final int? minRidesRequired,
          @JsonKey(name: "status") final String? status,
          @JsonKey(name: "bonus_amount") final num? bonusAmount,
          @JsonKey(name: "bonus_paid_at") final String? bonusPaidAt}) =
      _$PeerClaimImpl;

  factory _PeerClaim.fromJson(Map<String, dynamic> json) =
      _$PeerClaimImpl.fromJson;

  @override
  @JsonKey(name: "referral_code_id")
  int? get referralCodeId;
  @override
  @JsonKey(name: "claimed_at")
  String? get claimedAt;
  @override
  @JsonKey(name: "rides_after_claim")
  int? get ridesAfterClaim;
  @override
  @JsonKey(name: "min_rides_required")
  int? get minRidesRequired;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "bonus_amount")
  num? get bonusAmount;
  @override
  @JsonKey(name: "bonus_paid_at")
  String? get bonusPaidAt;

  /// Create a copy of PeerClaim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PeerClaimImplCopyWith<_$PeerClaimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminPromos _$AdminPromosFromJson(Map<String, dynamic> json) {
  return _AdminPromos.fromJson(json);
}

/// @nodoc
mixin _$AdminPromos {
  @JsonKey(name: "total_claimed")
  int? get totalClaimed => throw _privateConstructorUsedError;
  @JsonKey(name: "total_earned")
  num? get totalEarned => throw _privateConstructorUsedError;
  @JsonKey(name: "claims")
  List<dynamic>? get claims => throw _privateConstructorUsedError;

  /// Serializes this AdminPromos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminPromos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminPromosCopyWith<AdminPromos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminPromosCopyWith<$Res> {
  factory $AdminPromosCopyWith(
          AdminPromos value, $Res Function(AdminPromos) then) =
      _$AdminPromosCopyWithImpl<$Res, AdminPromos>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_claimed") int? totalClaimed,
      @JsonKey(name: "total_earned") num? totalEarned,
      @JsonKey(name: "claims") List<dynamic>? claims});
}

/// @nodoc
class _$AdminPromosCopyWithImpl<$Res, $Val extends AdminPromos>
    implements $AdminPromosCopyWith<$Res> {
  _$AdminPromosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminPromos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalClaimed = freezed,
    Object? totalEarned = freezed,
    Object? claims = freezed,
  }) {
    return _then(_value.copyWith(
      totalClaimed: freezed == totalClaimed
          ? _value.totalClaimed
          : totalClaimed // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
      claims: freezed == claims
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminPromosImplCopyWith<$Res>
    implements $AdminPromosCopyWith<$Res> {
  factory _$$AdminPromosImplCopyWith(
          _$AdminPromosImpl value, $Res Function(_$AdminPromosImpl) then) =
      __$$AdminPromosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_claimed") int? totalClaimed,
      @JsonKey(name: "total_earned") num? totalEarned,
      @JsonKey(name: "claims") List<dynamic>? claims});
}

/// @nodoc
class __$$AdminPromosImplCopyWithImpl<$Res>
    extends _$AdminPromosCopyWithImpl<$Res, _$AdminPromosImpl>
    implements _$$AdminPromosImplCopyWith<$Res> {
  __$$AdminPromosImplCopyWithImpl(
      _$AdminPromosImpl _value, $Res Function(_$AdminPromosImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminPromos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalClaimed = freezed,
    Object? totalEarned = freezed,
    Object? claims = freezed,
  }) {
    return _then(_$AdminPromosImpl(
      totalClaimed: freezed == totalClaimed
          ? _value.totalClaimed
          : totalClaimed // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
      claims: freezed == claims
          ? _value._claims
          : claims // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminPromosImpl implements _AdminPromos {
  const _$AdminPromosImpl(
      {@JsonKey(name: "total_claimed") this.totalClaimed,
      @JsonKey(name: "total_earned") this.totalEarned,
      @JsonKey(name: "claims") final List<dynamic>? claims})
      : _claims = claims;

  factory _$AdminPromosImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminPromosImplFromJson(json);

  @override
  @JsonKey(name: "total_claimed")
  final int? totalClaimed;
  @override
  @JsonKey(name: "total_earned")
  final num? totalEarned;
  final List<dynamic>? _claims;
  @override
  @JsonKey(name: "claims")
  List<dynamic>? get claims {
    final value = _claims;
    if (value == null) return null;
    if (_claims is EqualUnmodifiableListView) return _claims;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminPromos(totalClaimed: $totalClaimed, totalEarned: $totalEarned, claims: $claims)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminPromosImpl &&
            (identical(other.totalClaimed, totalClaimed) ||
                other.totalClaimed == totalClaimed) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned) &&
            const DeepCollectionEquality().equals(other._claims, _claims));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalClaimed, totalEarned,
      const DeepCollectionEquality().hash(_claims));

  /// Create a copy of AdminPromos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminPromosImplCopyWith<_$AdminPromosImpl> get copyWith =>
      __$$AdminPromosImplCopyWithImpl<_$AdminPromosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminPromosImplToJson(
      this,
    );
  }
}

abstract class _AdminPromos implements AdminPromos {
  const factory _AdminPromos(
          {@JsonKey(name: "total_claimed") final int? totalClaimed,
          @JsonKey(name: "total_earned") final num? totalEarned,
          @JsonKey(name: "claims") final List<dynamic>? claims}) =
      _$AdminPromosImpl;

  factory _AdminPromos.fromJson(Map<String, dynamic> json) =
      _$AdminPromosImpl.fromJson;

  @override
  @JsonKey(name: "total_claimed")
  int? get totalClaimed;
  @override
  @JsonKey(name: "total_earned")
  num? get totalEarned;
  @override
  @JsonKey(name: "claims")
  List<dynamic>? get claims;

  /// Create a copy of AdminPromos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminPromosImplCopyWith<_$AdminPromosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Totals _$TotalsFromJson(Map<String, dynamic> json) {
  return _Totals.fromJson(json);
}

/// @nodoc
mixin _$Totals {
  @JsonKey(name: "total_bonus_received")
  num? get totalBonusReceived => throw _privateConstructorUsedError;
  @JsonKey(name: "total_earned")
  num? get totalEarned => throw _privateConstructorUsedError;

  /// Serializes this Totals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Totals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotalsCopyWith<Totals> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalsCopyWith<$Res> {
  factory $TotalsCopyWith(Totals value, $Res Function(Totals) then) =
      _$TotalsCopyWithImpl<$Res, Totals>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_bonus_received") num? totalBonusReceived,
      @JsonKey(name: "total_earned") num? totalEarned});
}

/// @nodoc
class _$TotalsCopyWithImpl<$Res, $Val extends Totals>
    implements $TotalsCopyWith<$Res> {
  _$TotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Totals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonusReceived = freezed,
    Object? totalEarned = freezed,
  }) {
    return _then(_value.copyWith(
      totalBonusReceived: freezed == totalBonusReceived
          ? _value.totalBonusReceived
          : totalBonusReceived // ignore: cast_nullable_to_non_nullable
              as num?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalsImplCopyWith<$Res> implements $TotalsCopyWith<$Res> {
  factory _$$TotalsImplCopyWith(
          _$TotalsImpl value, $Res Function(_$TotalsImpl) then) =
      __$$TotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_bonus_received") num? totalBonusReceived,
      @JsonKey(name: "total_earned") num? totalEarned});
}

/// @nodoc
class __$$TotalsImplCopyWithImpl<$Res>
    extends _$TotalsCopyWithImpl<$Res, _$TotalsImpl>
    implements _$$TotalsImplCopyWith<$Res> {
  __$$TotalsImplCopyWithImpl(
      _$TotalsImpl _value, $Res Function(_$TotalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Totals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonusReceived = freezed,
    Object? totalEarned = freezed,
  }) {
    return _then(_$TotalsImpl(
      totalBonusReceived: freezed == totalBonusReceived
          ? _value.totalBonusReceived
          : totalBonusReceived // ignore: cast_nullable_to_non_nullable
              as num?,
      totalEarned: freezed == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalsImpl implements _Totals {
  const _$TotalsImpl(
      {@JsonKey(name: "total_bonus_received") this.totalBonusReceived,
      @JsonKey(name: "total_earned") this.totalEarned});

  factory _$TotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalsImplFromJson(json);

  @override
  @JsonKey(name: "total_bonus_received")
  final num? totalBonusReceived;
  @override
  @JsonKey(name: "total_earned")
  final num? totalEarned;

  @override
  String toString() {
    return 'Totals(totalBonusReceived: $totalBonusReceived, totalEarned: $totalEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalsImpl &&
            (identical(other.totalBonusReceived, totalBonusReceived) ||
                other.totalBonusReceived == totalBonusReceived) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalBonusReceived, totalEarned);

  /// Create a copy of Totals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalsImplCopyWith<_$TotalsImpl> get copyWith =>
      __$$TotalsImplCopyWithImpl<_$TotalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalsImplToJson(
      this,
    );
  }
}

abstract class _Totals implements Totals {
  const factory _Totals(
      {@JsonKey(name: "total_bonus_received") final num? totalBonusReceived,
      @JsonKey(name: "total_earned") final num? totalEarned}) = _$TotalsImpl;

  factory _Totals.fromJson(Map<String, dynamic> json) = _$TotalsImpl.fromJson;

  @override
  @JsonKey(name: "total_bonus_received")
  num? get totalBonusReceived;
  @override
  @JsonKey(name: "total_earned")
  num? get totalEarned;

  /// Create a copy of Totals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotalsImplCopyWith<_$TotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
