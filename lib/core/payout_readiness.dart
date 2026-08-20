import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/stripe_onboard_response/stripe_onboard_response.dart';

/// Whether the instructor may accept work yet.
///
/// `RidesService.acceptBooking` rejects with a 400 unless the instructor has
/// **both** a `stripe_account_id` and `stripe_payouts_enabled`
/// (`rides.service.ts:180`). Nothing about the job board reflected that, so an
/// instructor who had not finished payout onboarding saw a full list of jobs
/// and got *"Finish setting up your payout account before accepting bookings"*
/// on every tap — `INSTRUCTOR_APP_RIDE_JOURNEY.md` §10 asks for the board to be
/// gated instead.
///
/// Note the gate is `payouts_enabled` **alone**. §10's prose adds "and the
/// account is verified", but the service does not check
/// `stripe_account_status`, and gating on a condition the server does not
/// enforce would lock out instructors who can in fact be paid. Matching the
/// code is the safer of the two readings.
enum PayoutReadiness {
  /// Not checked yet, or the check failed for a reason that says nothing about
  /// onboarding — no connection, a timeout, a 5xx.
  ///
  /// **Treated as permitted.** The server still enforces the real gate, so the
  /// cost of guessing wrong here is one rejected accept with a clear message;
  /// the cost of guessing wrong the other way is an instructor who *can* work
  /// being shown an empty board with no way past it.
  unknown,

  /// Payouts are enabled. Accepts will pass this particular check.
  ready,

  /// No Stripe account at all — `GET /v1/instructors/stripe-onboarding-status`
  /// 400s with *"Instructor not connected to Stripe"* before it reaches Stripe
  /// (`instructors.service.ts:352`). The instructor has never started.
  notConnected,

  /// The account exists but Stripe has not enabled payouts — typically
  /// documents still under review, or a requirement outstanding.
  pendingVerification;

  bool get canAccept => this != notConnected && this != pendingVerification;
}

/// Whether to show the dashboard's *"Add A Bank To Get Paid"* card.
///
/// The app has two signals about payout setup and they disagree constantly:
///
/// * `cachedPaymentIncomplete` — derived from the instructor row that
///   `GET /v1/auth/instructor/me` serves. Only reconciled with Stripe by the
///   `account.updated` webhook or by a call to `/stripe-onboarding-status`, so
///   right after onboarding it still reads `'pending'` from account creation.
/// * [live] — from `/stripe-onboarding-status`, which asks Stripe directly and
///   returns `payouts_enabled`: the exact field the server gates accepts on.
///
/// The card gating on the cached row alone is why an instructor who has fully
/// onboarded — bank attached, payouts enabled — was still told to add a bank.
/// [live] wins wherever it has an opinion; the cache only breaks ties.
bool shouldPromptBankSetup({
  required bool cachedPaymentIncomplete,
  required PayoutReadiness live,
}) {
  switch (live) {
    // Stripe says they can be paid. Nothing the stale row claims outranks that.
    case PayoutReadiness.ready:
      return false;
    // Both are statements *from Stripe* that setup is unfinished — no account
    // at all, or an account whose payouts are still switched off.
    case PayoutReadiness.notConnected:
    case PayoutReadiness.pendingVerification:
      return true;
    // The check has not run yet, or failed for a reason that says nothing about
    // onboarding. Fall back to the cache rather than guessing.
    case PayoutReadiness.unknown:
      return cachedPaymentIncomplete;
  }
}

/// Resolves [PayoutReadiness] from whatever the status endpoint returned.
///
/// Kept out of the bloc so the fail-open rule can be tested directly — it is
/// the part most likely to be "simplified" into locking people out.
abstract final class PayoutReadinessResolver {
  /// A successful `GET /v1/instructors/stripe-onboarding-status`.
  static PayoutReadiness fromResponse(StripeOnboardResponse? response) {
    if (response == null) return PayoutReadiness.unknown;
    return (response.payoutsEnabled ?? false)
        ? PayoutReadiness.ready
        : PayoutReadiness.pendingVerification;
  }

  /// A failed one.
  ///
  /// Only 400 and 404 are statements about onboarding: the endpoint throws
  /// `BadRequestException` when there is no `stripe_account_id` and
  /// `NotFoundException` when there is no instructor record. Everything else —
  /// including the `0` that [ApiErrorMapper] assigns when there was no
  /// response at all — is a failure to find out, not a finding.
  static PayoutReadiness fromError(ErrorResponse? error) {
    final code = error?.statusCode;
    if (code == 400 || code == 404) return PayoutReadiness.notConnected;
    return PayoutReadiness.unknown;
  }
}
