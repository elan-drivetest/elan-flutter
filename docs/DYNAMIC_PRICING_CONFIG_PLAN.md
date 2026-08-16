# Server-Driven Config & Ride Geometry — API Integration Plan

Three rounds of work against the same backend:

- **Part 1 — Dynamic pricing config.** Consume `GET /v1/pricing-config` and drive every money/policy number from the server instead of hardcoded literals.
- **Part 2 — Ride geometry alignment.** Make the app's model of a *ride* match the backend's: the right legs, the right distances, the right ids.
- **Part 3 — Revised backend contract.** The backend shipped fixes for much of what Parts 1–2 worked around, and changed how distance is measured. Four phases: **A** tracking, **B** config, **C** deleting dead code, **D** display correctness.

They are one document because each part consumes the last — the start/transfer windows and the payout preview read the config Part 1 introduced, and Part 3 deletes the workarounds Part 2 built.

**Sources:** `elan-backend/docs/BUSINESS_LOGIC.md` (§2, §3, §6, §10, §17.13), `docs/ADMIN_SETTINGS.md`, and `docs/INSTRUCTOR_APP_RIDE_JOURNEY.md` (the authority for Parts 2–3; §-references below are to it). Verified against `src/settings/settings.service.ts`, `src/settings/pricing-config.controller.ts`, `src/rides/rides.service.ts`, `src/instructors/instructors.service.ts` and `src/bookings/infrastructure/persistence/repositories/booking.repository.ts`.

Status legend: ☐ not started · ◐ in progress · ☑ done

> **All three parts are complete.** `flutter analyze` → **0 errors** (247 warnings, 142 info — overwhelmingly `prefer_const_constructors`, the repo's pre-existing baseline); `flutter test` → **161 passing, 1 failing** (the failure is the pre-existing `test/widget_test.dart` counter template, untouched by this work — it was already red); `flutter build apk --debug` succeeds.
>
> Test count over the course of the work: **13 → 40 → 95 → 116 → 134 → 152 → 153 → 142 → 156 → 161**. The dip is Phase C deleting `test_center_resolver_test`'s 11 tests along with the code they covered.
>
> ### ⚠️ Toolchain constraint discovered during this work
>
> **This project cannot run `build_runner` on Flutter 3.47 / Dart 3.13.** `freezed 2.5.8` hard-pins `analyzer >=7.0.0 <8.0.0`, and analyzer 7.7.1 only understands language version 3.9. Dart 3.13 stabilised *dot shorthands*, which the SDK's own libraries now use, so the generator throws `Missing implementation of visitDotShorthandPropertyAccess` on the first file it links and aborts.
>
> Because `--delete-conflicting-outputs` removes all 82 committed generated files *before* generating, a failed run leaves the repo uncompilable. They are committed, so `git checkout --` restores them — but do not run codegen on 3.47 expecting a clean failure.
>
> **Resolution applied:** the Flutter SDK was pinned to **3.44.9 (Dart 3.12.2)**, which is what `pubspec.lock` was resolved against (`dart: ">=3.12.0"`, `flutter: ">=3.44.0"`). Codegen succeeds there in ~55 s. The permanent fix is migrating to `freezed 3.x`, which is a breaking change across ~45 model/bloc files and deserves its own PR.

---

# Part 1 — Dynamic pricing config ☑

## 0. Why this work exists

`GET /v1/pricing-config` is public, unauthenticated, and returns all 17 numeric settings as numbers. Every value is admin-editable and takes effect on the **next request with no deploy**. Anything this app hardcodes drifts silently.

That drift is not hypothetical — the live dev config already disagrees with the seeded defaults the docs describe:

| key | doc / seeded | live dev | delta |
|---|---|---|---|
| `base_rate` | 100 | **200** | 2× |
| `normal_rate` | 50 | **100** | 2× |
| `instructor_rate` | 4000 | **6000** | $40/h → **$60/h** |
| `average_distance_per_hour` | 50 | **100** | 2× |
| `admin_referral_price` | 10000 | **12000** | +20% |
| `booking_min_lead_days` | 2 | **0** | same-day booking allowed |

*Re-read from `GET /v1/pricing-config` on 2026-08-15. An earlier revision of this table recorded `base_rate` 500 and `booking_min_lead_days` 1 — both had since been changed by an admin, which is the point: these move without a deploy.*

### Contract guarantees (from `pricing-config.controller.ts`)

- Values are **numbers**, not strings (unlike `settings.value` on the admin routes).
- **Every key is always present** — a missing or invalid row resolves to the server's own fallback, so clients never handle absent keys.
- **Additive only** — new keys are appended; existing keys never change name or type. Read what you need, ignore the rest.
- It is an **allow-list**, not a table dump. A new admin row is not published until registered in `PUBLIC_CONFIG_FALLBACKS`.
- Cache per session, re-fetch on app start.

---

## 1. Confirmed bugs this work fixes

**Balances are 100× too large.** `BUSINESS_LOGIC.md` §10 defines `available_balance` / `withdrawn` as cents. `dashboard_page.dart:465-466` renders them raw. A $266.67 balance shows as **$26667**.

**Accepted rides display the wrong rate.** §6.2: `hourly_rate` is *snapshotted* onto the ride session at accept time so later rate changes never reprice an accepted job. `ride_map_page.dart:140` and `upcoming_ride_map_page.dart:140` show the **live global** rate instead. With the live rate now 6000, a ride accepted at 4000 advertises "$60.00/hr" but pays $40/h.

**The per-job estimate is discarded.** §6.1: `/v1/rides/available` computes `ride_price` and `total_ride_hour` per booking so an instructor can judge a job before accepting. `Ride.ridePrice` (`ride.dart:50`) is parsed and **never read** — every card shows one global "$/hr". Worse, the local variable named `ridePrice` in both pickup bottom sheets actually holds the global rate.

**Wrong currency symbol.** `৳` (Bangladeshi Taka) on a CAD product — `your_referral_code_tab.dart:370,478`, `referral_card_thump.dart:24`.

**One endpoint, two models.** `/v1/instructors/dashboard` is fetched twice under two names into `InstructorSummaryResponse` and `EarningsSummary` (a strict superset), via two blocs, on every dashboard load.

---

## 2. Conventions to honour (BUSINESS_LOGIC.md §2)

| Concept | Rule |
|---|---|
| Money | integer **cents** CAD. `9240` → `$92.40`. Display as `(cents / 100).toFixed(2)` |
| Distance | float **km** |
| Time | float **hours**. `2.1666666` → 2 h 10 m |
| Rates | **cents per hour**. `4000` → $40.00/h |
| Auth | httpOnly cookies — but `/v1/pricing-config` is **unauthenticated**, usable pre-login |

---

## Phase 1 — Config foundation ☑

Fetch, model, cache and expose the config.

| File | Change |
|---|---|
| `domain/pricing_config/pricing_config.dart` | New freezed model, 17 fields, snake_case `@JsonKey`, defaults mirroring `PUBLIC_CONFIG_FALLBACKS` |
| `core/endpoints/api_endpoints.dart` | Add `pricingConfigUrl = "/v1/pricing-config"` |
| `data/api_service/pricing_config_api_service.dart` | Abstract `PricingConfigApiService` |
| `data/api_service/i_pricing_config_api_service.dart` | `@LazySingleton(as:)` impl |
| `data/repository/pricing_config_repository.dart` | Abstract + `IPricingConfigRepository` |
| `presentation/bloc/pricing_config_bloc/` | Bloc + event + state |
| `core/cache/key.dart` | Add `pricingConfig` key |
| `core/cache/cache_manager_impl.dart` | Persist/read last-good config JSON |
| `presentation/my_app.dart` | Provide app-wide, fetch at boot |

**Defaults** (must match the server's own fallbacks exactly):

```
base_distance 50 · base_rate 100 · normal_rate 50
instructor_rate 8000 · average_distance_per_hour 50
instructor_referral_price 10000 · admin_referral_price 10000 · referral_min_rides 5
booking_min_lead_days 2
refund_full_hours 48 · refund_partial_hours 24 · refund_partial_percentage 50
failure_coupon_percentage 10 · failure_coupon_validity_months 6
instructor_payout_delay_days 7
ride_start_window_hours 6 · ride_transfer_cutoff_hours 6
```

> `instructor_rate` falls back to **8000**, not the seeded 4000. That mismatch is the server's, deliberately mirrored here so the client never advertises a number the server would not use.

Resolution order: **live fetch → cached last-good → baked-in defaults**. Non-blocking; a slow or failed fetch must never block login.

## Phase 2 — One money path ☑

| File | Change |
|---|---|
| `core/money.dart` | New: `centsToDisplay()`, `formatRate()`, `formatCents()` |
| `dashboard_page.dart:465-466` | Divide balances by 100 — **the 100× bug** |
| `available_rides_page.dart:209,283` | Route through formatter |
| `ride_map_page.dart:140` · `pickup_bottom_sheet.dart:42` | Route through formatter |
| `upcoming_ride_map_page.dart:140` · `upcoming_pickup_bottom_sheet.dart:42` | Route through formatter |
| `your_referral_code_tab.dart:370,478` · `referral_card_thump.dart:24` | `৳` → `$` |

Phase 2 changes *formatting only* — the data source for the rate stays as-is so the diff is reviewable. Swapping sources is Phase 3.

## Phase 3 — Correct economics ☑

- Available-ride cards → per-job `ride_price` + `total_ride_hour`, not the global rate
- Accepted / upcoming / current ride screens → the **snapshotted** `ride_session.hourly_rate`
- Dashboard "current rate" → the live `hourly_rate` (correct source already; needs the Phase 2 conversion)

## Phase 4 — Dynamic gates and copy ☑

Per §17.13 — every one of these is currently hardcoded or absent.

| Config key | Drives |
|---|---|
| `ride_start_window_hours` | Start-ride button enablement |
| `ride_transfer_cutoff_hours` | Transfer button enablement |
| `instructor_payout_delay_days` | "paid within N days" copy |
| `referral_min_rides` | replaces hardcoded `?? 5` in `referral_card_thump.dart:96` |
| `instructor_referral_price` | replaces hardcoded `'get $100 CAD'` |

Disable buttons rather than letting the request 400 (§17.8). The server still enforces every rule independently and its error messages interpolate the live number, so surfacing the server message stays the most reliable copy.

## Phase 5 — Cleanup ☑

Collapse `InstructorSummaryResponse` / `InstructorSummaryBloc` into `EarningsSummary` — one endpoint, one model, one call.

> **Correction.** This phase originally described `AcceptResponse` typing `total_distance`/`total_hours` as `String?` as "type drift". That framing was wrong: `INSTRUCTOR_APP_RIDE_JOURNEY.md` §12.2 confirms every `decimal` column genuinely **is** a string on the wire, so `String?` was faithful, not a bug. The real problem was subtler — `AcceptResponse` and `RideSession` model the *same server object* with different types, and neither could be used for arithmetic. Both were aligned to `double?` with a tolerant parser in **Part 2, item 13**.
>
> `CompleteRide`'s camelCase keys are correct too: that endpoint really does serialise in camelCase while every other one uses snake_case. Left as-is.

## Phase 6 — Tests ☑

Unit tests for the money formatter and the Phase 4 gate predicates. This is money logic and the existing suite has one real test file.

---

## Implementation notes — where the build differed from the plan

**Three 100× bugs, not one.** The plan named `available_balance` / `withdrawn`. Two more turned up during the work, both confirmed cents in the backend:
- `wallet_balance` — the headline "Total earnings" figure. `rides.service.ts:716` divides it by 100.
- Referral `code.amount` and `peer_claim.bonus_amount` — a $100 bonus rendered as "10000".

**Upcoming rides genuinely have no price to show.** `/v1/rides/available` enriches each booking with `ride_price` / `total_ride_hour` (`rides.service.ts:112-125`), but `/v1/rides/upcoming` returns a plain `Booking` — no price, no hours, no rate. So the "snapshotted `hourly_rate`" the plan called for **is not reachable from that endpoint**.

Rather than show a misleading global rate, those screens now render `--` via `Money.formatOrDash`, matching how `total_ride_hour` already degraded. The dashboard's *active* ride is unaffected: `/v1/rides/current` returns a `RideSession`, so it shows the true snapshot.

To display a real number on upcoming rides, one of:
1. **(preferred)** enrich `/v1/rides/upcoming` server-side the way `/available` already is, or expose the ride session's `hourly_rate`; or
2. compute the estimate client-side from `pickup_distance ÷ average_distance_per_hour × instructor_rate` — now possible via the config, but it uses the *live* rate and would misstate a job accepted at an older rate.

**`instructor_payout_delay_days` is wired but unused.** The value is available on the bloc; there is no existing "paid within N days" copy anywhere in the app to make dynamic. Adding that surface is a design decision, not a refactor, so it was left out deliberately.

**`base_distance` / `base_rate` / `normal_rate` are parsed and ignored**, as planned — they drive the *customer* pickup fare, not instructor economics.

> **Superseded twice.** Part 2 made upcoming rides resolve their test centre from a cached `/v1/drive-test-centers` list; Part 3 deleted that entirely once the backend started returning the coordinates (§14.2). Option 1 above — enrich `/rides/upcoming` server-side — is what actually happened for coordinates, but **not** for price: that endpoint still returns no `ride_price`, so upcoming rides still show `--`. `instructor_payout_delay_days` remains wired-but-unused.

---

# Part 2 — Ride geometry alignment ☑

**Authority:** `elan-backend/docs/INSTRUCTOR_APP_RIDE_JOURNEY.md`. Where that doc and the app disagreed, the app was wrong.

## The model the app was missing

The backend describes a ride as **one billable leg** — pickup → test centre — plus two legs it does not store. The app had no vocabulary for any of this, which is why "how far is this job?" had no reliable answer on screen.

| Leg | From → To | Distance source | Paid? | Stored? |
|---|---|---|---|---|
| **0 — Deadhead** | instructor GPS → first stop | app-computed | ❌ | ❌ |
| **1 — Pickup run** | pickup → test centre | **`booking.pickup_distance`** (authoritative, one-way, km) | ✅ | ✅ |
| **2 — Return** | centre → pickup (same coords) | mirror of Leg 1 | ✅ implicitly when `≤ base_distance` | ❌ no field |
| **Test** | centre → centre | n/a | ✅ wall clock | elapsed time |

Shape is decided by **`booking.meet_at_center`** — authoritative and always present. Shape B (meet at centre) has no Leg 1 and no Leg 2, and `pickup_distance = 0` by construction.

**There is no customer drop-off anywhere in the backend.** `/rides/completed`'s `dropoffLocation` is the *test centre*; `ride_sessions.dropoff_lat/lng` is simply where the phone was when Stop was pressed.

## What was wrong, and what it is now

| # | Defect | Severity | Fix |
|---|---|---|---|
| 1 | Ride shape inferred from `pickup == null` instead of `meet_at_center` | 🔴 wrong destination | `RideShape` on `Ride`; both map pages route by the flag |
| 2 | Distance chip showed the **deadhead** when Directions succeeded and **`pickup_distance`** when it failed — one slot, two journeys | 🔴 §14.1 | Two rows that never swap: *Pickup run* (authoritative) and *Your drive* (greyed). *Phase B renamed the first to* **Round trip** *and doubled it* |
| 3 | "Drop-off" labelled the test centre, in 5 places | 🟠 reads as a third location | All say **Test centre**; sheets gained an explicit *Return* row |
| 4 | `test_date` rendered with `.toLocal()` | 🔴 wrong time | `BookingTime` renders in `booking.timezone`, appending the zone when it disagrees with the device |
| 5 | `total_distance` mislabelled as distance driven | — | §5.2 warning recorded on the field — *rewritten in Phase C, the warning no longer applies* |
| 6 | Active-ride navigation routed to `dropoff_*`, which is **null for the whole ride** | 🔴 dead on every ride | `direction_map_page` rebuilt around the leg model + cached booking |
| 7 | Booking id written into the ride-**session** cache key | 🔴 wrong `ride_session_id` on every breadcrumb | Separate keys; session id read from the start response — *the second key went in Phase C* |
| 8 | One anonymous polyline | 🟠 paid vs unpaid indistinguishable | Three styled legs; camera fits the **paid** legs |
| 9 | `/rides/upcoming` returns null centre coordinates | 🔴 §14.2 | Cached `/v1/drive-test-centers` + `TestCenterResolver` — *deleted in Phase C; the backend returns them now* |
| 10 | Meet-at-centre jobs advertised **$0.00** | 🟠 §14.3 — instructors skip them | Quoted the hourly rate + "paid on the clock" — *deleted in Phase B; the server quotes a real figure now* |
| 11 | Completed rides showed **no money at all** | 🟠 | Earnings row that distinguishes paid from pending (§14.6) |
| 12 | Same-calendar-date jobs let Accept 400 | 🟠 §10 | Greyed with an explanation, compared in the booking's timezone |
| 13 | `AcceptResponse` typed coords `dynamic`, decimals `String?` | 🟡 §12.2 | Aligned with `RideSession`; `CompleteRide` decimals parsed |

## New files

| File | Purpose |
|---|---|
| `domain/common/ride/ride_shape.dart` | `RideShape`, `oneWayDistanceKm` / `roundTripDistanceKm`, `returnAddress` |
| `domain/common/ride/ride_leg.dart` | `RideLegKind` + `RideLeg` — the vocabulary of §3 |
| ~~`domain/common/ride/test_center_resolver.dart`~~ | Recovered the coordinates §14.2 omitted — **deleted in Phase C** |
| ~~`domain/drive_test_center/` + api service + repository~~ | Cached public centres list — **deleted in Phase C** |
| `presentation/bloc/ride_route_bloc/` | Assembles all legs concurrently, per-leg failure |
| `presentation/ui/widgets/common/ride_route_style.dart` | §11 polyline styling and camera bounds |
| `presentation/ui/widgets/common/ride_legs_section.dart` | Shared journey rows + distance summary |
| `core/booking_time.dart` | Timezone-correct rendering (adds `timezone: ^0.11.1`) |
| `core/ride_earnings.dart` | Estimate vs settled vs pending |
| `core/ride_availability.dart` | One-booking-per-calendar-date rule |

## Design decisions worth knowing

**The kilometre figure never comes from Directions.** For Leg 1 the app prints `booking.pickup_distance`, because the pay estimate was derived from that exact number (§5.3). Directions is used only for the drawn line and the ETA — they differ by a few hundred metres.

**The camera fits paid legs, not everything.** §11: on a 200 km deadhead, fitting all legs makes the 5 km billable leg invisible — exactly what the original screenshot showed.

**Distance is null, not `0.0`, for meet-at-centre.** The backend stores 0 because there is no pickup run; rendering "0.0 km" reads as a broken value rather than an absent leg. (`billableDistanceKm` was split into `oneWayDistanceKm` and `roundTripDistanceKm` in Phase B — both null here.)

**Two bottom sheets became one widget.** They were 403 lines each and byte-identical except the bloc type; the shared `RideLegsSection` removed 160 lines of duplication and meant fixing defect #2 once.

---

# Part 3 — Revised backend contract ☑

`INSTRUCTOR_APP_RIDE_JOURNEY.md` was reissued after Parts 1–2 shipped (824 → 960 lines). Most of it confirmed what the app already did. The parts that did not fell into four groups, worked in order:

| Phase | Theme | Why it had to be this order |
|---|---|---|
| **A** | Tracking | `total_distance` became a *product of what the app uploads*. Everything downstream is wrong until the app samples correctly. |
| **B** | Config | New settings key, and two estimates that changed meaning. |
| **C** | Deleting dead code | Only safe once A and B confirmed the new contract holds. |
| **D** | Display correctness | The remaining checklist items, including one never done. |

## Phase A — tracking ☑

**The one change that made this urgent:** `ride_session.total_distance` used to be a Distance-Matrix lookup from the Start point to the Stop point — which reported ≈ 0 km for any round trip that ended where it began. It is now the **haversine sum of the breadcrumbs this app uploads** (§5.2). The distance every finished ride reports, and that the instructor is shown, is a direct product of this app's ping quality. §12.6 specifies the cadence: **every 10 s or 50 m of displacement, whichever comes first**.

The handler failed all three of its requirements:

| Requirement | Was | Now |
|---|---|---|
| Sample every 10 s **or** 50 m | flat 30 s timer | 10 s tick **and** a `getPositionStream(distanceFilter: 50)`, both funnelling into one `_capture()` |
| Send **capture** time | sent none — the server stamped arrival, so a delayed point landed out of order | `timestamp` on every ping, UTC ISO-8601 |
| Buffer offline, replay in order | dropped failures on the floor | durable FIFO queue, persisted **before** upload |

At 100 km/h a 30 s interval leaves ~830 m of unsampled road between points, and the server draws a straight line across it — so the old cadence did not merely under-read, it silently shortened every motorway leg.

**New files.** `location_ping.dart` (plain Dart, no freezed — the isolate has no DI), `location_ping_queue.dart` (durable FIFO, `maxPoints = 1000`, flushes in batches of 25, stops at the first failure so order is preserved), `location_tracking_policy.dart` (the pure cadence predicate, kept out of the isolate so it can be tested without a foreground service).

**Why persist before upload.** A buffer lost to a process death is distance the instructor is never credited with. The ping is written to disk first and only removed once the server accepts it; a `minGap` of 1.5 s stops the two triggers double-recording the same position.

## Phase B — config ☑

**`test_duration_hours` added to `PricingConfig`** (`@Default(1)`, matching `settings.service.ts:72`). Documented with the warning that the app must **not** reproduce the server's estimate formula from it: `addon_duration` is not exposed to instructors (§14.11), so a job with a booked lesson cannot be recomputed client-side.

**The meet-at-centre special case was deleted.** `RideEarnings.estimate()` went from three parameters to one. The server now quotes `test_duration_hours + addon/60 + roundTripKm/avgPerHour`, so Shape B jobs come back at ~1 h instead of $0 — and the app's "Paid on the clock — approx. $X/h" substitution would now **contradict a real figure** rather than rescue a broken one.

**Expect `ride_price` to roughly double.** A 12.4 km pickup with a 30-minute add-on quotes `1 + 0.5 + 24.8/50 = 2.0 h` → **$79.84** where it used to be ~$19.84. That is the correction landing, not a regression; the note lives in `estimate()`'s doc comment so the next reader does not "fix" it.

**§14.1's fix changed shape.** Part 2 made the primary distance chip `pickup_distance`. The revised doc says it must be **`2 × pickup_distance`, labelled "round trip"** — that is the drive actually made, and the distance `ride_price` was computed from. Quoting the one-way figure put a distance on the card that disagreed with the price beside it. So `billableDistanceKm` split in two:

- `oneWayDistanceKm` — `pickup_distance` verbatim
- `roundTripDistanceKm` — doubled, and what every screen displays

This deliberately does *not* mirror the customer's fare, where a pickup beyond `base_distance` is billed one way — that is a pricing concession, not a shorter drive (§7.3).

## Phase C — deleting what the backend fixed ☑

Four workarounds retired after the backend shipped §14.2, §14.4, §14.3 and §5.2. Net **−8 files**, and 11 tests deleted with the code they covered.

**Test-centre name matching is gone.** `TestCenterResolver` recovered centre coordinates by normalising and matching names against the public `/v1/drive-test-centers` list, refusing to guess when two centres shared a city. `/rides/upcoming` returns the coordinates now, so both map pages read them straight off the booking. `test_center_id` was added to `Ride` at the same time — the join key, if one is ever needed again.

**The id-link cache is gone.** `RIDE_BOOKING_ID` existed only because `/start` takes a booking id, `/stop` takes a session id, and no response carried both. It turned out to be write-only even before this — nothing ever read it back — so removing it deletes `setRideLink` / `clearRideLink` and simplifies the accept handler to storing the session id alone.

**`total_distance` is labelled honestly, in both of its meanings.** It is now real driven distance *at stop*, so the disclaimer on `CompleteRide` is replaced by what the number is and what it is not: haversine over jitter-filtered breadcrumbs, under-reading road distance by 3–8%, and **not backfilled** — rides completed before the backend fix keep their old ≈ 0 km values. But it is *still* the accept-time round-trip estimate while a ride is running, so `ActiveRideCard` now says **"Round trip"** rather than implying a live odometer.

**Item 13 was dropped — the documented recovery does not work.** §8.8 says a restart can `read booking_id, fetch the booking from /rides/upcoming, rebuild the screen. No local cache needed.` The query says otherwise: `upcomingBookingForInstructor` requires the ride session to be `SCHEDULED` and `test_date > NOW()`, so the moment a ride starts it leaves that list. With no get-booking-by-id endpoint, `booking_id` cannot be redeemed for a booking at all. The fallback was written, checked against the query, and reverted; `ACTIVE_BOOKING` stays the only copy. Raised with the backend above.

## Phase D — display correctness ☑

**The job board is gated behind payout onboarding.** `acceptBooking` rejects with a 400 unless the instructor has a `stripe_account_id` *and* `stripe_payouts_enabled` (`rides.service.ts:180`), and nothing in the app reflected that — a new instructor saw a full list of jobs and got *"Finish setting up your payout account"* on every tap. `PayoutSetupRequired` now replaces the list with the one action that unblocks them.

Three details decided the shape of it:

- **It fails open.** `PayoutReadiness.unknown` — no answer yet, a timeout, a 5xx — is treated as permitted. Only a 400/404 from the status endpoint (*"Instructor not connected to Stripe"*) or an explicit `payouts_enabled: false` closes the board. The server still enforces the real gate, so guessing wrong costs one rejected accept with a clear message; guessing wrong the other way hides every job behind a dead end whenever the connection drops.
- **It gates on `payouts_enabled` alone.** §10's prose adds "and the account is verified", but `acceptBooking` never reads `stripe_account_status`. Gating on a condition the server does not enforce would lock out instructors who can in fact be paid, so the code won over the prose.
- **The verify-page push had no owner.** Three places request an onboarding URL — the dashboard bank card, the profile bank sheet, and now the job-board gate — but only the dashboard ever pushed the verify page, and only while its card was mounted with `paymentStatus == incomplete`. The profile sheet's button did nothing visible. That push is handled once in `MainPage`, above every branch.

**A snackbar that blamed a button nobody pressed.** The dashboard runs `getInfo` on load and showed *"Failed to initiate bank onboarding. Please try again."* on any `error` — so every instructor without Stripe got it at app start. `getInfo` failures now emit `infoError`, separate from the onboarding-URL flow's `error`.

**The rate a preview used is now part of the call.** `RideEarnings.settled()` takes a **required** `rateIsRideSnapshot`. `hourly_rate` is snapshotted onto the session at accept so a later admin change cannot reprice a held job (§7.2) — which means the current global rate and a ride's own rate legitimately differ, by 2× for any session created before the §14.9 fix that kept the 8000 column default. Getting that wrong is invisible: the preview still renders a confident figure. Making it required meant the compiler listed every call site.

The active-ride card already read `RideSession.hourly_rate`, which is correct; it now shows `--` rather than `$0.00/hr` when that is absent. The ride-history card **cannot** be fixed — `/rides/completed` returns no `hourly_rate` (§8.9) — so it passes `false` and its caption reads *"Pending — at current rate"*. `EarningsSummary.hourly_rate` is the global setting and is displayed nowhere; it now carries a comment saying so.

---

# Shared

## Follow-ups after Phase D ☑

Two things surfaced from using the build rather than from the spec.

### §14.1 is now closed on every surface

Phase B fixed the distance/price mismatch on the **detail sheet** and the **active-ride map**, but the *list cards* showed no distance at all — which is worse than showing the wrong one, because there was nothing to be suspicious of. A live booking made that concrete: one job quoted **$1869** and another **$105**, and nothing on either card explained the gap.

The cause was upstream — `pickup_distance ≈ 1508 km` on a bad geocode, plus a `meet_at_center` flag that did not match what the customer selected — but the app made a corrupt row *invisible*. `RideDistanceRow` now puts `2 × pickup_distance` on the job-board and upcoming cards, so the number the price was computed from sits next to the price. A meet-at-centre job reads "No pickup run", which is equally diagnostic: **$1869 for no driving** is a question an instructor can ask.

No client-side plausibility threshold was added. What counts as too far is a business rule; a hardcoded limit here would be a second, drifting copy of it. If the backend publishes `max_pickup_distance_km` through `/v1/pricing-config`, the app can gate on it the way it already gates the start/transfer windows.

### One ride card, not four

`RideCard`, `UpcomingRideCard` and `RideHistoryCard` were three ~400-line files drawing the same card, drifted apart: the job board used raw `Colors.blue` and a hardcoded `0xFF4CAF50` where the others used `RideCardColors`, so identical elements rendered in different blues on different tabs, and only two of the three were tappable. All three now compose `ride_card_parts.dart` — **1537 → 956 lines**.

Three defects fell out of unifying them:

- **An empty "Pickup" row** on every meet-at-centre job — `?? ''` passed through regardless of shape. Now states the arrangement.
- **The test centre printed twice**, in the timeline and again in a grey panel below it. `RideHistoryCard` passed `dropOffLocation` to both. The panel is gone; the centre's *name* leads the destination stop.
- **A fourth card, `DashboardRideCard`, was never instantiated at all.** Deleted.

The amber *"Pickup location not provided. Showing Test Center location instead."* banner was removed from both map pages — it framed normal business logic (§2) as a fault in the app.

### Regression: `emit` after handler completion

Accepting a ride threw `emit was called after an event handler completed normally` and **locked the job board behind its loading dialog**, which is dismissed on `update` — a state that never arrived.

`UpcomingRideBloc._onAcceptRide` called `result.fold(...)` without awaiting it, while both callbacks were `async`. This was **introduced by Part 2**: the original code emitted as the *first* statement of each callback, and an async function runs synchronously up to its first `await`, so the emit always landed before the handler returned. Part 2 added the cache write above the emit, which put an `await` in front of it and made a latent bug live.

Fixed with `await result.fold(...)`, `emit.isDone` guards, and the shared delay-and-refresh hoisted into one `_refreshAfter` that checks `isClosed` — the instructor can navigate away during that 600 ms. A sweep found the same shape in `InstructorInfoBloc._onUpdateInfo` and `_onUpdateVehicleInfo`, both latent for the identical reason; both fixed.

**Worth knowing for anyone re-testing this:** hoisting the delay into the handler *alone* masks the defect, because it keeps the handler open long enough for the late emit to land. Reproducing it needs the original shape — delay inside the callbacks, fold unawaited. That is why both the `await` and the guards are in, and why `upcoming_ride_bloc_accept_test.dart` was verified against a genuine reproduction rather than assumed to cover it.

## Known limitations

**`DirectionMapPage` needs a ride started after this build, and started on this device.** The booking is cached at Start and there is no server-side way to get it back (see *For the backend team* below), so a ride already in progress — or accepted on another phone, or one that outlived a storage clear — shows *"Ride details unavailable on this device"*. An honest dead end. Self-corrects on the next ride.

**The pending-payout preview uses the live rate**, not the rate snapshotted at accept — `/rides/completed` still does not return `hourly_rate` (§8.9). Labelled *"Pending — at current rate"* and self-corrects when the payout cron runs. It can be wrong by 2× for sessions created before the §14.9 fix.

**`instructor_payout_delay_days` is still unused.** No "paid within N days" copy exists to attach it to; adding that surface is a design decision.

**Tracking cannot be verified on an emulator.** The Phase A cadence, the offline queue and the battery reading all need a physical device with fine + background location, notifications (Android 13+) and a battery-optimisation exemption.

## Not in scope

The instructor app does **not** need `base_distance` / `base_rate` / `normal_rate` — those drive the *customer* pickup fare and the `elan-client` price preview. They are parsed and ignored here.

## For the backend team

### Still open — ranked by operational impact

- 🔴 **`addon_duration` is `@Exclude`d, so the instructor is never told a lesson was booked** (§14.11). A booking with a 30- or 60-minute add-on looks identical to one without, and the instructor discovers the extra time on arrival. Operational, not cosmetic — one `@Expose`, the same shape as the `test_center_id` fix.
- 🟠 **Admin-assigned rides pay double.** §6.2: `hourly_rate` is only snapshotted on instructor self-accept. Admin assignment leaves the `ride_sessions.hourly_rate` column default of **8000**, so identical work pays $80/h vs $40/h.
- 🟠 **There is no way to recover the active booking after an app restart.** `/rides/current` returns `booking_id` now, but nothing redeems it: there is no instructor get-booking-by-id endpoint, and `/rides/upcoming` filters on `rideSessions.status = SCHEDULED` **and** `test_date > NOW()` (`booking.repository.ts:385-419`), so a ride disappears from it the instant it starts. Either include the booking on `/rides/current` or relax that filter to include `in_progress`. Until then the app's `ACTIVE_BOOKING` cache is the only copy — see *Known limitations*.
- 🟠 **Add `hourly_rate` to `GET /v1/rides/completed`.** It is on the session already; without it the history card can only preview a pending payout at the *current* global rate, which the backend itself says can disagree with what the ride pays (§7.2, §8.10). One field removes the last hedged number in the app.
- 🔴 **Bound `pickup_distance` at booking creation** (`max_pickup_distance_km`). A geocode that lands in the wrong province is currently sold: one live booking carries ≈ 1508 km one-way, which prices the instructor estimate at **$1869** and the customer fare at **$779**. Rejecting it at creation protects both. Publishing the bound through `/v1/pricing-config` would let the app grey the job out too, rather than only displaying the distance.
- 🔴 **`meet_at_center` is not being persisted** — a booking the customer created as meet-at-centre is stored `false`. That is the root cause of the above, and it belongs to the **customer-facing `elan-client` app**, not this repo: the instructor app has no booking-creation path. Routed here only so it is not lost.
- 🟡 **`Setting.id` is excluded from responses** yet required in `GET`/`PUT` paths, forcing the admin panel's brute-force id scan. Either un-exclude `id` or add `PUT /v1/admin/settings/by-key/:key`.

### Shipped by the backend, and what it changed here

Every ask from the previous revision of this document has now landed. Three deleted client code; one created it.

| Fix | Effect on the app |
|---|---|
| Test-centre coords + `test_center_id` on `/rides/upcoming` (§14.2) | **−8 files.** `TestCenterResolver`, `DriveTestCenter`, its api-service, its repository, the `DRIVE_TEST_CENTERS` cache key and endpoint |
| `booking_id` on every `RideSession` (§14.4) | Deleted the `RIDE_BOOKING_ID` key, `setRideBookingId` / `setRideLink` / `clearRideLink` |
| Shape B quotes `test_duration_hours` (§14.3) | Deleted the meet-at-centre branch of `RideEarnings.estimate()` |
| `total_distance` summed from breadcrumbs (§5.2) | **Added work, not removed it** — the reported distance is now a product of this app's ping quality, which is the whole of Phase A. It also retired the "never label this distance driven" disclaimer |

## Test coverage added

| Suite | Covers |
|---|---|
| `money_test` | Cents conversion, the 100× regression, absent vs zero |
| `ride_windows_test` | Start/transfer gates, boundary complementarity |
| `canadian_phone_test` | NANP + Canadian area codes, E.164 round trip |
| `ride_shape_test` | Shape selection, stale-pickup regression, null-not-zero |
| `booking_time_test` | Toronto/Vancouver/St John's, DST, day-differs-from-UTC |
| `ride_route_style_test` | Leg styling, z-order, degenerate bounds |
| `ride_earnings_test` | Server estimate (no meet-at-centre branch), pending payout preview, **which rate the preview used** |
| `ride_availability_test` | Calendar-date clash in the booking's timezone |
| `payout_readiness_test` | The accept gate, and **failing open** on network/5xx |
| `location_tracking_policy_test` | The 10 s / 50 m cadence, and the min-gap that stops double-recording |
| `location_ping_queue_test` | FIFO order, the cap, and surviving a corrupt payload |
| `upcoming_ride_bloc_accept_test` | Accept emits `update`, stores the **session** id, and survives a mid-flight close — verified against a real reproduction of the freeze |
| `api_error_mapper_test` | Pre-existing — the repo's only suite before this work |
