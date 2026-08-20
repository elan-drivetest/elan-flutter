import 'package:elan/core/extension/profile_complete_check.dart';
import 'package:elan/core/payout_readiness.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:flutter_test/flutter_test.dart';

/// Cover for the dashboard's "Add A Bank To Get Paid" gate.
///
/// The reported bug: an instructor finished Stripe onboarding — bank attached,
/// payouts enabled — and the dashboard still told them to add a bank, while the
/// job board (which reads the live status) considered them ready. Two signals,
/// one question, no rule about which wins.
///
/// These pin the rule down: a live answer from Stripe always outranks the
/// cached profile row, and the cache only decides when there is no live answer.
///
/// Companion to `payout_readiness_test.dart`, which covers the layer below —
/// how a raw `/stripe-onboarding-status` response or error becomes a
/// [PayoutReadiness] in the first place.

void main() {
  group('shouldPromptBankSetup', () {
    test('a live "ready" hides the card even when the cached row disagrees',
        () {
      // This is the whole bug. The row still says 'pending' from account
      // creation because nothing has reconciled it yet.
      expect(
        shouldPromptBankSetup(
          cachedPaymentIncomplete: true,
          live: PayoutReadiness.ready,
        ),
        isFalse,
      );
    });

    test('a live "notConnected" shows the card even if the cache looks fine',
        () {
      // The mirror case: a stale row can be wrong in the optimistic direction
      // too, e.g. after an account is rejected or detached upstream.
      expect(
        shouldPromptBankSetup(
          cachedPaymentIncomplete: false,
          live: PayoutReadiness.notConnected,
        ),
        isTrue,
      );
    });

    test('pendingVerification shows the card — payouts are still off', () {
      expect(
        shouldPromptBankSetup(
          cachedPaymentIncomplete: false,
          live: PayoutReadiness.pendingVerification,
        ),
        isTrue,
      );
    });

    group('unknown falls back to the cache', () {
      // `unknown` is "we failed to find out" — no connection, a 5xx, or the
      // check has simply not run yet. It must not be read as either answer.
      test('cache says incomplete -> prompt', () {
        expect(
          shouldPromptBankSetup(
            cachedPaymentIncomplete: true,
            live: PayoutReadiness.unknown,
          ),
          isTrue,
        );
      });

      test('cache says complete -> stay quiet', () {
        expect(
          shouldPromptBankSetup(
            cachedPaymentIncomplete: false,
            live: PayoutReadiness.unknown,
          ),
          isFalse,
        );
      });
    });
  });

  group('isPaymentInfoIncomplete', () {
    Instructor withStatus(String? status, {String? accountId = 'acct_123'}) =>
        Instructor(stripeAccountId: accountId, stripeAccountStatus: status);

    test('no stripe account at all is incomplete', () {
      expect(withStatus('verified', accountId: null).isPaymentInfoIncomplete,
          isTrue);
      expect(withStatus('verified', accountId: '').isPaymentInfoIncomplete,
          isTrue);
      expect(const Instructor().isPaymentInfoIncomplete, isTrue);
    });

    test('a null instructor is incomplete', () {
      const Instructor? absent = null;
      expect(absent.isPaymentInfoIncomplete, isTrue);
    });

    group('accepts both backend vocabularies', () {
      // instructors.service.ts writes 'verified'; the account.updated webhook
      // in stripe.service.ts writes 'active'. Same meaning, different word.
      test("'verified' is complete", () {
        expect(withStatus('verified').isPaymentInfoIncomplete, isFalse);
      });

      test("'active' is complete", () {
        expect(withStatus('active').isPaymentInfoIncomplete, isFalse);
      });

      test('matching is case- and whitespace-insensitive', () {
        expect(withStatus(' Verified ').isPaymentInfoIncomplete, isFalse);
      });
    });

    group('unfinished states', () {
      for (final status in ['pending', 'unverified', 'incomplete', '', null]) {
        test('${status ?? "null"} is incomplete', () {
          expect(withStatus(status).isPaymentInfoIncomplete, isTrue);
        });
      }

      test("'incomplete' is not read as complete", () {
        // Regression: the old check was `contains('pending')` ||
        // `contains('unverified')`. The webhook's 'incomplete' matches neither,
        // so it fell through and reported the profile as done — inverting the
        // meaning of the only word that says otherwise.
        expect(withStatus('incomplete').isPaymentInfoIncomplete, isTrue);
      });

      test('an unrecognised status is treated as incomplete', () {
        expect(withStatus('some_new_stripe_state').isPaymentInfoIncomplete,
            isTrue);
      });
    });

    group('stripe_payouts_enabled outranks the status string', () {
      // Dormant until the backend widens the serializer group, so both
      // directions are pinned now — the day it starts arriving, the behaviour
      // should not be a surprise.
      test('true beats a status that looks unfinished', () {
        expect(
          const Instructor(
            stripeAccountId: 'acct_123',
            stripeAccountStatus: 'pending',
            stripePayoutsEnabled: true,
          ).isPaymentInfoIncomplete,
          isFalse,
        );
      });

      test('false beats a status that looks finished', () {
        expect(
          const Instructor(
            stripeAccountId: 'acct_123',
            stripeAccountStatus: 'verified',
            stripePayoutsEnabled: false,
          ).isPaymentInfoIncomplete,
          isTrue,
        );
      });

      test('null falls through to the status string', () {
        expect(
          const Instructor(
            stripeAccountId: 'acct_123',
            stripeAccountStatus: 'verified',
          ).isPaymentInfoIncomplete,
          isFalse,
        );
      });
    });
  });
}
