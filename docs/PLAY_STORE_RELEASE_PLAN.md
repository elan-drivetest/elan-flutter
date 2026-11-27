# Google Play Release Plan: Elan Instructor

Owner: Anvil (elan-flutter session) with the Lead Engineer. Created 2026-11-25.
Package: `com.drivingschool.elan` · Current version: `1.0.1+5` · Market: Canada.
Status legend: `[ ]` todo · `[~]` in progress · `[x]` done.

## Blockers found in code

| # | Issue | Where | Owner | Status |
|---|---|---|---|---|
| B1 | Release builds are signed with the **debug key** | `android/app/build.gradle` | Anvil | [x] upload-key signing 2026-11-27 (keystore in %USERPROFILE%.elan-signing; BACK IT UP) |
| B2 | "Delete account" only logs out. Play requires real deletion. The backend has `DELETE /v1/auth/instructor/me`. | `delete_account_button.dart` | Anvil | [x] code done 2026-11-27 (uncommitted); live behaviour depends on Forge 119a850 |
| B3 | No prominent disclosure before the background-location prompt (Play also requires a Console declaration and a video) | `location_bloc.dart` | Anvil + Lead | [x] in-app disclosure done 2026-11-27 (uncommitted); Console declaration + video still to do |
| B4 | Base URL hardcoded to `api-dev` | `api_endpoints.dart` | Anvil | [x] not a blocker: api-dev IS prod (backend dev = live) |
| B5 | Restricted or obsolete permissions: `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`, `SCHEDULE_EXACT_ALARM`, `READ/WRITE_EXTERNAL_STORAGE`, `READ_MEDIA_DOCUMENTS` | `AndroidManifest.xml` | Anvil | [x] removed and verified in the merged manifest 2026-11-27 (uncommitted) |
| B6 | Maps API key unrestricted | Manifest / Google Cloud Console | Lead | [ ] |
| B7 | Tracker sends `timeZoneName` ("EDT") instead of an IANA name; `getIt` crash in the isolate on session rejection | `location_service_handler.dart` | Anvil | [x] fixed 2026-11-27 (uncommitted) |

## Play Console account (captured 2026-11-27)
- Type: **Organization** · Developer account ID `5585311207930420732`
- Organization: Elan Road Test Car Solutions Inc., Scarborough, ON, Canada · D-U-N-S `243705332`
- Website `https://www.elanroadtestrental.ca/` verified. Owner login: Elan's Gmail.
- Personal contact details are kept out of git, in the local agent memory only.

## Backend gaps (from Forge, 2026-11-27): owner Forge, decisions by the Lead

| # | Gap | Impact | Status |
|---|---|---|---|
| B8 (decided 2026-11-27: Forge fix 1 = revoke refresh on delete, shipping; option (a) = anonymise PII + delete docs, keep financials) | `DELETE /me` only sets `status='deleted'`. Nothing is anonymised, the S3 docs and location points stay, `refresh_token` isn't revoked (refresh keeps working), and the Stripe account isn't closed. | Fails Play's account-deletion policy; security hole | [ ] |
| B9 | No retention: location points, documents (S3), rides and financial records are kept forever | Privacy policy and Data safety can't be truthful | [ ] |
| B10 | Prod `NODE_ENV` unverified. If it's `development`, Stripe onboarding pre-fills **fake identity** on live accounts. | Critical if true | [ ] |
| B11 | No reviewer demo account or seeder; payouts need a real Connect account | Play review can't get past onboarding | [ ] |
| B12 | **Uploads S3 bucket may be PUBLIC READ**: licence, insurance and tax documents readable by anyone with the URL | Critical privacy breach; Data safety can't claim the data is protected | [ ] Lead to verify live config, Forge to fix |
| B13 | API port 8001 open to 0.0.0.0/0 over plain HTTP (bypasses TLS) | Cleartext credentials and cookies possible | [ ] |
| B14 | Email Lambda gap: instructor welcome, ride-complete and withdrawal emails fail in prod | Broken UX; not a Play blocker | [ ] |

Legal API LIVE (2026-11-27) with enforcement OFF: public `GET /v1/legal/documents?role=instructor`, `/legal/status`, `/legal/accept`. Backend still treats privacy as v1 until the Lead tells Forge to deploy v1.1.
Retention: nothing is purged while an account is active; CRA requires 6 years for tax records.

## Legal acceptance (Lead's requirement, 2026-11-27)
Documents (v1, client-supplied): `docs/legal/privacy-policy.v1.md`, `terms-of-service.v1.md`, `provider-agreement.v1.md`.
- [x] Website LIVE 2026-11-27 (client main 08177c2): `https://www.elanroadtestrental.ca/privacy`, `/terms`, `/provider-agreement`, `/delete-account` (instructor section `#instructors`), support `/contact-us`. All return 200.
- [ ] Backend: `legal_acceptances` records, `GET /v1/legal/status`, `POST /v1/legal/accept`, server-side 403 `legalAcceptanceRequired` gate (Forge).
- [ ] App: required checkbox at signup; blocking "I Agree and Accept" screen for existing instructors on missing or outdated versions; a Legal section in settings (Anvil).
- [ ] Client web: required checkbox at booking/signup (Picasso). Decided: customers accept **Terms + Privacy only**; the Provider Agreement is instructor-only.
- [ ] Lead: privacy v1 lacks an instructor section (GPS, documents, Stripe Connect) and a contact email/phone in §15. Play needs both; addendum to be drafted and approved by the client.

Facts: the prod API is `https://api-dev.elanroadtestrental.ca` (backend `dev` = live prod; no separate host). Stripe Connect is Express, CA; we store only `stripe_account_id` and status flags, no banking data. The email is unique across deleted rows (a deleted account can't re-register).

## Phase 0: Accounts and decisions (Lead; start first, slowest)
- [x] Play Console **Organization** account, D-U-N-S verified, website verified.
- [x] Trader status declared (2026-11-27); public phone is the 416 business line.
- [x] Developer name stays **"Elan Instructor"**: this account only publishes the instructor app; customers use the web app.
- [ ] Optional: a domain email (support@elanroadtestrental.ca) in place of Gmail.
- [x] The Lead's own Google account added as Admin (2026-11-27).
- [ ] Prod API URL confirmed and deployed (Forge).
- [ ] Privacy policy URL (covers precise and background location, personal data, documents, Stripe).
- [ ] Account-deletion web URL (required in addition to in-app deletion).
- [ ] Reviewer demo instructor account: payouts enabled, an upcoming ride seeded (Forge).
- [ ] Support email and developer display name.

## Phase 1: Code hardening (Anvil, one PR each)
- [ ] `chore(android)`: release signing via `android/key.properties` (gitignored) and an upload keystore.
- [ ] `feat(config)`: `--dart-define=ENV=dev|prod` base URL; a release build fails without `ENV`.
- [ ] `feat(account)`: real deletion (confirm → `DELETE /me` → wipe cookies and cache → login).
- [ ] `feat(location)`: prominent disclosure screen before the background-location request.
- [ ] `chore(manifest)`: remove the restricted permissions; open the battery settings screen instead of requesting the exemption directly; drop the `http` deep-link scheme.
- [ ] `fix(trace)`: IANA timezone; guard `getIt` in the isolate.
- [ ] Crash reporting (Crashlytics or Sentry).
- [ ] Version `1.0.0+<n>`; the build number increases on every upload.
- [ ] Gate: analyze shows no new issues, tests pass, physical-device run (login, accept, start, tracking while locked, stop, payout).

## Phase 2: Build
- [ ] `flutter build appbundle --release --dart-define=ENV=prod`
- [ ] Enroll in Play App Signing (Google holds the app signing key; we keep the upload key).
- [ ] Restrict the Maps key to `com.drivingschool.elan` plus the upload and Play signing SHA-1s.

## Phase 3: Play Console setup
- [ ] Create the app: "Elan Instructor", app, free.
- [ ] App content: privacy policy, app access (demo credentials), ads = no, content rating, target audience 18+, Data safety, location permissions declaration and video, foreground service (location) declaration and video, account-deletion URL, financial features.
- [ ] Store listing: short description (80 characters), full description (4,000), 512px icon, 1024×500 feature graphic, at least 2 phone screenshots, category, contact details.
- [ ] Countries: Canada.

## Phase 4: Release tracks
- [ ] Internal testing: upload the AAB; test on 3+ devices.
- [ ] Closed testing (optional for an organization account).
- [ ] Production review (3–7+ days with background location).
- [ ] Staged rollout: 20% → 100%.

## Phase 5: After launch
- Increase the build number on every release; back up the upload keystore in two places.
- Annual target-SDK requirement (each August).
- Watch Android vitals (crash and ANR rates).

## Critical path
D-U-N-S / Console account ∥ Phase 1 code ∥ legal pages → internal test → review.

## On-device release checklist (run on 2+ real phones before production)
Install from the Play **internal testing** link, not a local build. **Uninstall
any previous debug build first:** it's signed with a different key, so Android
refuses the update and you'd silently keep testing the old app.

1. Fresh install → onboarding → login. **No** location prompt before login.
2. After login: the "Review and accept" screen blocks the app. The bottom nav
   isn't reachable. "Sign out" returns to login. "I Agree and Accept" closes it.
3. Location disclosure appears **before** any OS location prompt → Continue →
   allow "All the time" and notifications. "Not now" shows no OS prompt.
4. Battery hint snackbar appears (if not exempt) and "Settings" opens the system list.
5. Accept a ride → Start → lock the screen for 5+ minutes while moving, with the
   battery exemption **not** granted → unlock → route recorded without gaps; the
   tracking notification stays visible throughout.
6. Stop the ride → earnings and history update.
7. Profile Settings → Legal links open the four live pages.
8. Delete Account (use a throwaway account): blocked while a ride is upcoming;
   otherwise confirm → returns to login; logging in again fails.
9. Registration step 2: "Complete Registration" is blocked until the
   agreements checkbox is ticked.

## Android ship: minimum scope (Lead, 2026-11-27)
"Least scope so the Android app ships; core functionality must work."

| # | Owner | Item | Status |
|---|---|---|---|
| F1 | Forge | Presigned document URLs + signature stripping on write | [x] LIVE (1f58ce5) |
| P1 | Picasso | Publish privacy §17.1 foreground-location wording | [ ] |
| P2 | Picasso | Web read-side B12 fix to prod (bbcd10d) | [ ] |
| A1 | Atlas | Admin photo_url only-if-changed (54c63d2) | [ ] code done; **Lead pushes elan-admin main** |
| A2 | Atlas/Lead | refund_partial_percentage = 0 in admin settings | [ ] **Lead, in admin** |
| B12 | Lead | Private-bucket terraform (after P2 + A1 live) | [ ] |
| F2 | Forge | Play reviewer demo mode + `seed-play-review` | [ ] Forge confirming with Lead |
| N1 | Anvil | Signed AAB 1.0.0 (6) with all fixes | [x] |
| N2 | Anvil | Emulator walkthrough with the demo account + screenshots | [ ] after F2 |
| L1 | Lead | Back up keystore; record video; Console forms; upload to internal testing | [ ] |

Deferred until after launch: B13 ports, cookies/Swagger, NODE_ENV + email Lambda,
legal enforcement flag, crash reporting, signup legal payload, iOS.

Live surfaces: web https://www.elanroadtestcar.ca (same deployment as
www.elanroadtestrental.ca, the Play-verified domain), admin
https://admin.elanroadtestcar.ca, API https://api-dev.elanroadtestrental.ca (= prod).
