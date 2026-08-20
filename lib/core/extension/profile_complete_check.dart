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

  /// Whether payout setup still looks unfinished **according to the cached
  /// profile row**.
  ///
  /// This is the weaker of the two signals the app has. `GET /v1/auth/instructor/me`
  /// serves whatever was last written to the instructors table, and that row is
  /// only reconciled with Stripe by the `account.updated` webhook or by a call
  /// to `/v1/instructors/stripe-onboarding-status`. Straight after onboarding it
  /// is routinely stale. Prefer `shouldPromptBankSetup` in
  /// `core/payout_readiness.dart`, which lets a live status check overrule this.
  ///
  /// Resolution order, strongest evidence first:
  ///  1. no `stripe_account_id` — nothing has been started, definitely incomplete;
  ///  2. `stripe_payouts_enabled` — the exact condition `rides.service.ts:180`
  ///     enforces on accept. Dormant today (see [Instructor.stripePayoutsEnabled]);
  ///  3. the status string — a hint, and the only thing available right now.
  bool get isPaymentInfoIncomplete {
    final i = this;
    if (i == null) return true;
    if (i.stripeAccountId?.isEmpty ?? true) return true;

    final payoutsEnabled = i.stripePayoutsEnabled;
    if (payoutsEnabled != null) return !payoutsEnabled;

    return _statusLooksIncomplete(i.stripeAccountStatus);
  }
}

/// Both backend vocabularies, matched exactly rather than by `contains`.
///
/// `contains('pending')` was the old test. It is a trap waiting to spring: the
/// webhook writes `'incomplete'`, which contains neither `'pending'` nor
/// `'unverified'`, so it read as *complete* — the opposite of what it means.
/// An unrecognised value is treated as incomplete, because the two known
/// "good" values are a short, closed set and guessing optimistically here hides
/// the setup prompt from someone who needs it.
bool _statusLooksIncomplete(String? status) {
  final s = status?.trim().toLowerCase();
  if (s == null || s.isEmpty) return true;
  // 'verified' — instructors.service.ts; 'active' — the account.updated webhook.
  return s != 'verified' && s != 'active';
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
