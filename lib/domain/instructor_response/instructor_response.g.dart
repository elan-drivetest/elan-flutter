// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorResponseImpl _$$InstructorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructorResponseImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      instructor: json['instructor'] == null
          ? null
          : Instructor.fromJson(json['instructor'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InstructorResponseImplToJson(
        _$InstructorResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'instructor': instance.instructor,
      'vehicle': instance.vehicle,
    };

_$InstructorImpl _$$InstructorImplFromJson(Map<String, dynamic> json) =>
    _$InstructorImpl(
      drivingSchoolName: json['driving_school_name'] as String?,
      licenseNumber: json['license_number'] as String?,
      licenseValidityDate: json['license_validity_date'] == null
          ? null
          : DateTime.parse(json['license_validity_date'] as String),
      drivingLicenseUrl: json['driving_license_url'] as String?,
      instructorLicenseUrl: json['instructor_license_url'] as String?,
      workEligibilityDocUrl: json['work_eligibility_doc_url'] as String?,
      taxInfoDocUrl: json['tax_info_doc_url'] as String?,
      profileCompletionPercentage:
          (json['profile_completion_percentage'] as num?)?.toInt(),
      transferCount: (json['transfer_count'] as num?)?.toInt(),
      walletBalance: (json['wallet_balance'] as num?)?.toInt(),
      stripeAccountId: json['stripe_account_id'] as String?,
      stripeAccountStatus: json['stripe_account_status'] as String?,
      stripeAccountType: json['stripe_account_type'] as String?,
      stripeCountry: json['stripe_country'] as String?,
    );

Map<String, dynamic> _$$InstructorImplToJson(_$InstructorImpl instance) =>
    <String, dynamic>{
      'driving_school_name': instance.drivingSchoolName,
      'license_number': instance.licenseNumber,
      'license_validity_date': instance.licenseValidityDate?.toIso8601String(),
      'driving_license_url': instance.drivingLicenseUrl,
      'instructor_license_url': instance.instructorLicenseUrl,
      'work_eligibility_doc_url': instance.workEligibilityDocUrl,
      'tax_info_doc_url': instance.taxInfoDocUrl,
      'profile_completion_percentage': instance.profileCompletionPercentage,
      'transfer_count': instance.transferCount,
      'wallet_balance': instance.walletBalance,
      'stripe_account_id': instance.stripeAccountId,
      'stripe_account_status': instance.stripeAccountStatus,
      'stripe_account_type': instance.stripeAccountType,
      'stripe_country': instance.stripeCountry,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      photoUrl: json['photo_url'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'photo_url': instance.photoUrl,
    };

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: (json['year'] as num?)?.toInt(),
      color: json['color'] as String?,
      licensePlate: json['license_plate'] as String?,
      registrationDocUrl: json['registration_doc_url'] as String?,
      insuranceDocUrl: json['insurance_doc_url'] as String?,
      vehicleImageUrl: json['vehicle_image_url'] as String?,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'license_plate': instance.licensePlate,
      'registration_doc_url': instance.registrationDocUrl,
      'insurance_doc_url': instance.insuranceDocUrl,
      'vehicle_image_url': instance.vehicleImageUrl,
    };
