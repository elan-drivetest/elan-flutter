import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_response.freezed.dart';
part 'instructor_response.g.dart';

@freezed
class InstructorResponse with _$InstructorResponse {
  const factory InstructorResponse({
    @JsonKey(name: "user")
    User? user,
    @JsonKey(name: "instructor")
    Instructor? instructor,
    @JsonKey(name: "vehicle")
    Vehicle? vehicle,
  }) = _InstructorResponse;

  factory InstructorResponse.fromJson(Map<String, dynamic> json) => _$InstructorResponseFromJson(json);
}

@freezed
class Instructor with _$Instructor {
  const factory Instructor({
    @JsonKey(name: "driving_school_name")
    String? drivingSchoolName,
    @JsonKey(name: "license_number")
    String? licenseNumber,
    @JsonKey(name: "license_validity_date")
    DateTime? licenseValidityDate,
    @JsonKey(name: "driving_license_url")
    String? drivingLicenseUrl,
    @JsonKey(name: "instructor_license_url")
    String? instructorLicenseUrl,
    @JsonKey(name: "work_eligibility_doc_url")
    String? workEligibilityDocUrl,
    @JsonKey(name: "tax_info_doc_url")
    String? taxInfoDocUrl,
    @JsonKey(name: "profile_completion_percentage")
    int? profileCompletionPercentage,
    @JsonKey(name: "transfer_count")
    int? transferCount,
    @JsonKey(name: "wallet_balance")
    int? walletBalance,
    @JsonKey(name: "stripe_account_id")
    String? stripeAccountId,
    @JsonKey(name: "stripe_account_status")
    String? stripeAccountStatus,
    @JsonKey(name: "stripe_account_type")
    String? stripeAccountType,
    @JsonKey(name: "stripe_country")
    String? stripeCountry,
  }) = _Instructor;

  factory Instructor.fromJson(Map<String, dynamic> json) => _$InstructorFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "full_name")
    String? fullName,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "phone_number")
    String? phoneNumber,
    @JsonKey(name: "address")
    String? address,
    @JsonKey(name: "photo_url")
    String? photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: "brand")
    String? brand,
    @JsonKey(name: "model")
    String? model,
    @JsonKey(name: "year")
    int? year,
    @JsonKey(name: "color")
    String? color,
    @JsonKey(name: "license_plate")
    String? licensePlate,
    @JsonKey(name: "registration_doc_url")
    String? registrationDocUrl,
    @JsonKey(name: "insurance_doc_url")
    String? insuranceDocUrl,
    @JsonKey(name: "vehicle_image_url")
    String? vehicleImageUrl,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
