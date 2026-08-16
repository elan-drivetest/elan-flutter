import 'package:elan/core/payout_readiness.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/stripe_onboard_response/stripe_onboard_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fromResponse — the endpoint answered', () {
    test('payouts enabled → ready', () {
      final r = PayoutReadinessResolver.fromResponse(
        const StripeOnboardResponse(
          status: 'verified',
          chargesEnabled: true,
          payoutsEnabled: true,
        ),
      );
      expect(r, PayoutReadiness.ready);
      expect(r.canAccept, isTrue);
    });

    test('payouts disabled → pending, and the board stays shut', () {
      final r = PayoutReadinessResolver.fromResponse(
        const StripeOnboardResponse(
          status: 'pending',
          chargesEnabled: true,
          payoutsEnabled: false,
        ),
      );
      expect(r, PayoutReadiness.pendingVerification);
      expect(r.canAccept, isFalse);
    });

    test('payouts enabled but unverified is still ready', () {
      // The gate the server actually applies is stripe_account_id +
      // stripe_payouts_enabled (rides.service.ts:180). It never reads
      // stripe_account_status, so neither may this — blocking on a condition
      // the server does not enforce locks out instructors who can be paid.
      final r = PayoutReadinessResolver.fromResponse(
        const StripeOnboardResponse(
          status: 'pending',
          chargesEnabled: false,
          payoutsEnabled: true,
        ),
      );
      expect(r, PayoutReadiness.ready);
    });

    test('a null payouts_enabled is not treated as a yes', () {
      expect(
        PayoutReadinessResolver.fromResponse(const StripeOnboardResponse()),
        PayoutReadiness.pendingVerification,
      );
    });

    test('no response at all → unknown', () {
      expect(
        PayoutReadinessResolver.fromResponse(null),
        PayoutReadiness.unknown,
      );
    });
  });

  group('fromError — fail open unless the error is about onboarding', () {
    test('400 is the "not connected to Stripe" branch', () {
      // instructors.service.ts:352 throws BadRequestException before it ever
      // reaches Stripe when the instructor has no stripe_account_id.
      final r = PayoutReadinessResolver.fromError(
        const ErrorResponse(statusCode: 400),
      );
      expect(r, PayoutReadiness.notConnected);
      expect(r.canAccept, isFalse);
    });

    test('404 — no instructor record — also blocks', () {
      expect(
        PayoutReadinessResolver.fromError(const ErrorResponse(statusCode: 404)),
        PayoutReadiness.notConnected,
      );
    });

    test('a network failure must not lock the job board', () {
      // ApiErrorMapper.humanizeBody stamps status_code 0 when there was no
      // response. Blocking on that would hide every job whenever the connection
      // drops, with no way for the instructor to get past it.
      final r = PayoutReadinessResolver.fromError(
        const ErrorResponse(statusCode: 0, message: 'No internet connection.'),
      );
      expect(r, PayoutReadiness.unknown);
      expect(r.canAccept, isTrue);
    });

    test('a server fault does not lock it either', () {
      expect(
        PayoutReadinessResolver.fromError(const ErrorResponse(statusCode: 500))
            .canAccept,
        isTrue,
      );
    });

    test('an error with no status code at all fails open', () {
      expect(
        PayoutReadinessResolver.fromError(const ErrorResponse()),
        PayoutReadiness.unknown,
      );
      expect(PayoutReadinessResolver.fromError(null), PayoutReadiness.unknown);
    });
  });

  group('canAccept', () {
    test('only the two onboarding states close the board', () {
      expect(PayoutReadiness.ready.canAccept, isTrue);
      expect(PayoutReadiness.unknown.canAccept, isTrue);
      expect(PayoutReadiness.notConnected.canAccept, isFalse);
      expect(PayoutReadiness.pendingVerification.canAccept, isFalse);
    });
  });
}
