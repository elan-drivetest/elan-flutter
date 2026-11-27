# Play Console Submission: Elan Instructor

Copy-paste answers for every Play Console form. Written 2026-11-27 against the
build `1.0.0 (6)`; verify against the code if the app changes.
Account: Elan Instructor (organization), signed in as the Lead (Admin).

---

## 0. Artifacts

| Item | Where |
|---|---|
| App bundle | `build/app/outputs/bundle/release/app-release.aab`. Rebuild with `flutter build appbundle --release` (needs `android/key.properties`). |
| Upload keystore | `%USERPROFILE%\.elan-signing\elan-upload.jks`; its password is in `android/key.properties` (gitignored). **Back up both now** (Elan's Google Drive and a password manager). If lost, Play support can reset the upload key, which takes days. |
| Upload key SHA-1 | `96:59:E8:20:3B:1C:D6:E8:B2:14:47:B2:15:C9:71:E1:B6:4E:29:C1` |
| Hi-res icon 512×512 | `store/play/icon-512.png` |
| Feature graphic 1024×500 | `store/play/feature-graphic-1024x500.png` |
| Phone screenshots | TODO (checklist: docs/PLAY_STORE_RELEASE_PLAN.md, "On-device release checklist"). At least 2, and the longest side must be ≤ 2× the shortest (the Pixel 9 Pro emulator's 1280×2856 is too tall). Capture on a 1080×1920 device/emulator, logged in as the demo account: Dashboard, Available Rides, active ride map, Profile. |

## 1. Create app
- App name: **Elan Instructor**
- Default language: English (Canada), en-CA
- App or game: **App** · Free or paid: **Free**
- Declarations: tick Developer Program Policies + US export laws.

## 2. Play App Signing
Accept **Google-managed app signing key** (default) on the first upload. Then
App integrity → copy the **App signing key SHA-1** and add it, together with
the upload SHA-1 above, to the Android Maps key restriction (package
`com.drivingschool.elan`) in Google Cloud Console.

## 3. Store listing
- **Short description (80):**
  `Accept road-test jobs, track rides live and get paid. For Elan instructors.`
- **Full description:**

```
Elan Instructor is the app for driving instructors and vehicle providers who work with Elan Road Test Rental in Ontario.

FIND AND ACCEPT JOBS
• Browse road-test bookings near you on the job board
• See the pickup point, DriveTest centre, test time and what the job pays before you accept
• One booking per day, with clear start and transfer windows

RUN THE RIDE
• Start and stop rides in the app
• Live ride tracking with your route on the map, so ride distance and pay are recorded accurately
• See the route to the pickup point and the test centre on the map

GET PAID
• Set up payouts securely with Stripe
• Track your earnings, available balance and ride history

GROW WITH REFERRALS
• Generate referral codes and earn rewards when they are claimed

PRIVACY
In the background, location is collected only while a ride you started is in progress, and tracking stops when you end the ride. While you use the app, your location also shows your position and route on maps. You can delete your account at any time in the app.

An approved Elan instructor or vehicle-provider account is required.
```
- App icon / feature graphic: see §0.
- Category: **Business** · Tags: Business, Productivity
- Contact email: `elan.drivetestrental@gmail.com` · Phone: `+1 416 407 4757`
- Website: `https://www.elanroadtestrental.ca`
- Privacy policy: `https://www.elanroadtestrental.ca/privacy`

## 4. App content (Policy → App content)

### Privacy policy
`https://www.elanroadtestrental.ca/privacy` (v1.1; instructor section `#section-17`)

### App access
"All or some functionality is restricted" → add instructions:
- Name: Demo instructor
- Username / password: **the demo account (B11, still to create; see the release plan)**
- Instructions:
```
1. Log in with the credentials above.
2. Read the agreements screen and tap "I Agree and Accept".
3. On the location disclosure, tap Continue, then allow location "All the time" and notifications.
4. Available Rides tab → accept the booking listed for the review.
5. Dashboard → Start the ride. A "Location Tracking" notification appears; the app records the route in the background.
6. Stop the ride from the Dashboard.
Account deletion: Profile photo (top right) → Profile Settings → Delete Account.
```

### Ads
**No, my app does not contain ads.**

### Content rating (IARC questionnaire)
- Category: **All other app types** (Utility, Productivity, Communication, or other)
- Violence / sexuality / language / controlled substances / gambling: **No** to all
- Users can interact or exchange content: **No** (no chat or UGC)
- Shares the user's current location with other users: **No** (location is not shown to customers)
- Shares personal information with third parties: **Yes** (the instructor's name, phone and email are shown to the customer on their own booking)
- Digital purchases: **No**
- Expected result: Everyone / PEGI 3

### Target audience
Ages **18 and over** only. Appeal to children: **No**.

### News app: **No** · COVID-19 app: **No** · Government app: **No**

### Financial features
**My app doesn't provide any financial features.** Instructors receive payouts for their own work through Stripe Connect; the app offers no financial product.

### Health: **No health features**

### Advertising ID
**No.** The app does not use the advertising ID.

### Data safety
Data is encrypted in transit: **Yes**. Users can request deletion: **Yes**
(in-app, plus `https://www.elanroadtestrental.ca/delete-account#instructors`).
Data collection is required for the app to function. No data is optional.

| Data type | Collected | Shared* | Purposes |
|---|---|---|---|
| Location: Precise | Yes | No | App functionality; Fraud prevention, security & compliance |
| Location: Approximate | Yes | No | App functionality |
| Personal info: Name | Yes | **Yes** | App functionality; Account management |
| Personal info: Email address | Yes | **Yes** | App functionality; Account management |
| Personal info: Phone number | Yes | **Yes** | App functionality; Account management |
| Personal info: Address | Yes | No | App functionality; Account management |
| Personal info: Other info (driver's/instructor licence numbers) | Yes | No | App functionality; Fraud prevention, security & compliance |
| Financial info: Other financial info (earnings, payouts) | Yes | No | App functionality; Account management |
| Photos and videos: Photos (licence and vehicle images) | Yes | No | App functionality; Fraud prevention, security & compliance |
| Files and docs (work-eligibility, tax documents) | Yes | No | App functionality; Fraud prevention, security & compliance |
| App activity: Other actions (rides accepted, started, completed) | Yes | No | App functionality |

\*Shared = shown to the customer on their own booking (name, phone, email).
Service providers acting for Elan (AWS, Stripe, Google Maps) are not
"sharing" under Play's definition. Banking and identity details for payouts
are entered on Stripe's own onboarding page and are never stored by Elan.

⚠️ Before declaring this form, confirm B12 (uploads bucket not public). If
documents are publicly readable, "encrypted in transit / protected" claims and
the privacy policy are not truthful.

### Sensitive permissions → Location permissions (background)
- Feature: **Live ride tracking**
- Description:
```
In the background, Elan Instructor records the instructor's location only while a ride they started is in progress (in the foreground it also shows their position and route on maps), so the route, the distance driven (which determines the instructor's pay) and the ride record are accurate. Tracking must continue while the screen is off or the instructor is using navigation, which requires background location. Tracking starts when the instructor taps Start and stops when they tap Stop; a persistent notification is shown the whole time. An in-app disclosure explains this before any permission prompt.
```
- Video (≤ 30 s, YouTube unlisted link): record on a phone:
  1. the disclosure screen → Continue → OS prompt → "Allow all the time",
  2. Start ride → notification visible → lock the screen,
  3. unlock → route drawn → Stop ride.

### Foreground service permissions
- `FOREGROUND_SERVICE_LOCATION`, task type **Location**:
```
Started only when the instructor starts a ride, to record the ride route in the background; stopped when the ride ends. A persistent notification shows while it runs. Deferring or interrupting it would lose route points and under-record the instructor's paid distance.
```
- Same video as above.

## 5. Release
1. Testing → **Internal testing** → Create release → upload the AAB.
2. Release name `1.0.0 (6)`; notes: `First release of Elan Instructor.`
3. Testers: create an email list (Lead + 2–4 instructors). Share the opt-in link.
4. Run the on-device checklist (release plan) on 2+ real phones.
5. Production → Countries: **Canada** only → Create release (promote the
   internal build) → staged rollout **20%** → Send for review.
