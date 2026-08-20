# Stripe connect status — backend issues

**From:** instructor app (`elan-flutter`)
**Repo to change:** `elan-backend`
**Date:** 2026-08-17

Line references are against the `elan-backend` working tree as of this date.

---

## The reported symptom

A newly created instructor completes every onboarding step, connects Stripe with
test data and a test bank account. Stripe shows the account as fully onboarded.
The app still shows:

1. profile completion stuck at **69%**, and
2. the **"Add A Bank To Get Paid"** card.

Investigation found five backend defects. Three of them are independent of the
app entirely, and one (Issue 1) is a latent production outage rather than a dev
annoyance. The app-side race that contributed to this has already been fixed in
`elan-flutter` — see "What the app now does" at the bottom, because it changes
what load you should expect on one endpoint.

---

## Issue 1 — `stripe_account_status` has three writers and six values 🔴 urgent

`instructors.stripe_account_status` is written from three places that do not
agree on the vocabulary.

| Writer | Values it can write |
|---|---|
| `stripe.service.ts:869-877` `getVerificationStatus`, via `checkAccountCapabilities` → `instructors.service.ts:364` | `verified` \| `pending` \| `unverified` |
| `instructors.service.ts:321-328` `handleAccountUpdate` | `verified` \| `submitted` \| `pending` |
| `stripe.service.ts:1120-1122` `handleAccountUpdate` | `active` \| `incomplete` |

Six distinct values in one `varchar` column.

The payment gate is an equality check against exactly one of them:

```ts
// instructors.service.ts:193-197
public canInstructorReceivePayments(instructor: Instructor): boolean {
  return (
    instructor.stripe_account_id &&
    instructor.stripe_payouts_enabled &&
    instructor.stripe_account_status === 'verified'
  );
}
```

**The webhook is wired to the writer that can never satisfy that gate.**

```ts
// stripe.controller.ts:56-58
case 'account.updated':
  await this.stripeService.handleAccountUpdate(event.data.object.id);
  break;
```

That resolves to `stripe.service.ts:1109`, which writes `'active'`. So the
moment a real `account.updated` webhook is delivered for a fully-onboarded
instructor, `stripe_account_status` becomes `'active'`,
`canInstructorReceivePayments()` returns `false`, and it stays false — no code
path ever writes `'verified'` again unless someone hits
`/stripe-onboarding-status`.

Two further notes:

- `instructors.service.ts:311` `handleAccountUpdate` is **dead code**. Nothing
  calls it (`grep` for `instructorsService.handleAccountUpdate` returns nothing).
  It is also the only writer that can emit `'submitted'`, which no reader
  handles.
- The two live writers disagree on *meaning*, not just spelling.
  `stripe.service.ts` derives from `details_submitted` alone; the other derives
  from `charges_enabled && payouts_enabled`. An account that has submitted
  details but is not yet enabled gets `'active'` from one and `'pending'` from
  the other.

**Asks**

1. Pick one vocabulary and make every writer use it. A shared enum/const, not
   string literals at three call sites.
2. Delete `instructors.service.ts:311-339` `handleAccountUpdate`, or make the
   controller call it and delete the other.
3. Consider dropping `stripe_account_status` from `canInstructorReceivePayments`
   entirely. `stripe_payouts_enabled` is the fact that matters and is already
   what the three real gates use (`rides.service.ts:180`,
   `bookings.service.ts:552`, `bookings.service.ts:993`). The status string adds
   a second condition that can only ever cause false negatives.
4. A migration for existing rows, since prod may already hold a mix of values.

---

## Issue 2 — `profile_completion_percentage` cannot reach 100% 🟠

```ts
// instructors.service.ts:56-89
const profileFields = [
  'full_name', 'email', 'phone_number', 'address', 'photo_url',
  'driving_school_name', 'license_number', 'license_validity_date',
  'driving_license_url', 'instructor_license_url',
  'work_eligibility_doc_url', 'tax_info_doc_url', 'stripe_account_id',
];
```

13 fields. **9 ÷ 13 = 69.23% → 69.** The reported number is this formula with
exactly four empty fields; it is arithmetic, not staleness.

The problem is that this list and the app's notion of "profile complete" are
measuring different things:

| | counted by the % | required by the app's checklist |
|---|---|---|
| licence fields + documents | yes | yes |
| `stripe_account_id` | yes | yes |
| `address`, `photo_url`, `driving_school_name` | **yes** | no — never prompted for |
| all 8 vehicle fields | **no** | yes |

So an instructor can finish every step the app asks for and still sit well below
100%, because the percentage is scoring fields the app never collects while
ignoring the entire vehicle section.

**Asks**

1. Decide what the percentage is *for*. If it is "how much of the onboarding
   checklist is done", it should count the same fields the instructor is
   actually asked for — which means adding the vehicle fields and dropping (or
   prompting for) `address` and `photo_url`.
2. Whatever the list becomes, please publish it, so the app can show a matching
   checklist instead of an unexplained number. Right now the app cannot tell an
   instructor *which* field is missing.

---

## Issue 3 — the percentage is computed from pre-update values 🟠

```ts
// auth.service.ts:1263-1272
const instructor = await this.instructorsService.update(currentInstructor.id, {
  ...userDto,
  profile_completion_percentage:
    this.instructorsService.calculateProfileCompletionPercentage({
      ...userDto,           // the NEW values
      ...currentUser,       // snapshot taken BEFORE the update
      ...currentInstructor, // snapshot taken BEFORE the update
    }),
});
```

Later spreads win in JS. `currentUser` and `currentInstructor` were both read
before the write, so they overwrite the incoming `userDto` values with the old
ones. The percentage is therefore always computed from the state *before* the
save — filling in a field never counts until the next unrelated update.

**Ask:** reverse the order so the new values win:

```ts
{ ...currentUser, ...currentInstructor, ...userDto }
```

Worth a unit test — this is invisible in manual testing because the number does
eventually move, just one save late.

---

## Issue 4 — `stripe_payouts_enabled` is hidden from the instructor app 🟠

```ts
// instructors/domain/instructor.ts:140-148
@Expose({ groups: ['admin'] })
stripe_charges_enabled?: boolean;

@Expose({ groups: ['admin'] })
stripe_payouts_enabled?: boolean;
```

```ts
// instructor-auth.controller.ts:129-132
@SerializeOptions({ groups: ['me'] })
@Get('me')
```

`GET /v1/auth/instructor/me` serializes with `groups: ['me']`, so both fields are
stripped before the response leaves the server.

The consequence: **the app cannot see the one field the server actually gates
on.** `rides.service.ts:180` rejects an accept unless
`stripe_payouts_enabled` is true, but the app's profile payload only carries
`stripe_account_status` — the ambiguous string from Issue 1. The app is forced
to infer payout readiness from a proxy, which is the root of the wrong card.

Neither field is sensitive: they are booleans about the instructor's own
account, and the instructor can already see the same facts by opening their
Stripe dashboard.

**Ask:** add `'me'` to the expose groups on `stripe_payouts_enabled` and
`stripe_charges_enabled`:

```ts
@Expose({ groups: ['me', 'admin'] })
```

`stripe_onboarding_url` at `instructor.ts:132` should stay admin-only — that one
is a credential.

---

## Issue 5 — please confirm the webhook is configured 🟡

`account.updated` is handled (`stripe.controller.ts:56`), but if the endpoint is
not registered in the Stripe dashboard for the dev environment — or cannot be
reached — then nothing reconciles the instructors table in the background, and
`GET /v1/instructors/stripe-onboarding-status` becomes the only path that ever
corrects a row.

Two questions:

1. Is the `account.updated` webhook registered and delivering for **dev**?
2. If yes, has it been delivering all along? Because per Issue 1 that would mean
   affected rows are already sitting at `'active'` and failing
   `canInstructorReceivePayments()`.

---

## What the app now does (contract note)

`elan-flutter` has been changed as follows. No backend change is required for
these, but Issue 4 would let us simplify.

1. **`GET /v1/instructors/stripe-onboarding-status` is now awaited before the
   profile is refetched**, on the dashboard and on return from the Stripe
   webview. Previously both fired at once and the profile read — a local DB read
   — beat the Stripe round-trip, returning the very row the status call was
   about to correct.

   Please note this endpoint is **not idempotent from a load perspective**: it
   performs a live `accounts.retrieve` against Stripe and a DB write on every
   call, and the app calls it on every dashboard visit. If that is a problem,
   say so and we will back off to calling it only after onboarding — but then we
   need Issue 1 and Issue 5 resolved, because the webhook becomes the only
   reconciliation path.

2. **Payout readiness is now taken from `payouts_enabled` on that endpoint's
   response**, not from `stripe_account_status`. The status string is treated as
   a hint only.

3. The app accepts **both** `'verified'` and `'active'` as meaning "done", and
   treats every other value — including `'incomplete'`, `'submitted'`,
   `'pending'`, `'unverified'` and anything unrecognised — as not done. This is
   a defensive workaround for Issue 1 and should be removable once the
   vocabulary is unified.

---

## Suggested order

1. **Issue 1** — correctness bug that can silently disable payouts in prod.
2. **Issue 4** — one-line change, removes the app's need to guess.
3. **Issue 3** — one-line change.
4. **Issue 5** — confirmation, may turn into config work.
5. **Issue 2** — needs a product decision on what the number means.
