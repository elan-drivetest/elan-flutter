import 'package:elan/domain/instructor_response/instructor_response.dart';

extension InstructorValidation on Instructor? {
  bool get isLicenseIncomplete {
    final i = this;
    return i == null ||
        (i.licenseNumber?.isEmpty ?? true) ||
        i.licenseValidityDate == null ||
        (i.drivingLicenseUrl?.isEmpty ?? true) ||
        (i.instructorLicenseUrl?.isEmpty ?? true) ||
        (i.workEligibilityDocUrl?.isEmpty ?? true) ||
        (i.taxInfoDocUrl?.isEmpty ?? true);
  }

  bool get isPaymentInfoIncomplete {
    final i = this;
    return i == null ||
        (i.stripeAccountId?.isEmpty ?? true) ||
        (i.stripeAccountStatus?.isEmpty ?? true) ||
        (i.stripeAccountStatus?.toLowerCase().contains("unverified") ??
            false) ||
        (i.stripeAccountStatus?.toLowerCase().contains("pending") ?? false) ||
        (i.stripeAccountType?.isEmpty ?? true);
  }
}

extension VehicleValidation on Vehicle? {
  bool get isVehicleInfoIncomplete {
    final v = this;
    return v == null ||
        (v.brand?.isEmpty ?? true) ||
        (v.model?.isEmpty ?? true) ||
        v.year == null ||
        (v.color?.isEmpty ?? true) ||
        (v.licensePlate?.isEmpty ?? true) ||
        (v.registrationDocUrl?.isEmpty ?? true) ||
        (v.insuranceDocUrl?.isEmpty ?? true) ||
        (v.vehicleImageUrl?.isEmpty ?? true);
  }
}
