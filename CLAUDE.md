# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Flutter app for driving instructors (`elan`, bundle id `com.drivingschool.elan`): accept road-test rides, track location live during a ride, take Stripe Connect payouts, manage referral codes. Backend is `https://api-dev.elanroadtestrental.ca`.

`README.md` is unusually detailed — read it for onboarding, troubleshooting tables, and the known-tech-debt list. This file covers what is not obvious from a single file and corrects a few README inaccuracies (noted below).

## Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # after touching freezed / json / @injectable
dart run build_runner watch  --delete-conflicting-outputs

flutter analyze
flutter test
flutter test test/api_error_mapper_test.dart               # single file
flutter test --plain-name "maps known codes"               # single test by name
dart format lib test

flutter build apk --release
flutter build ios --release      # signs with DEBUG keys — no real signing config yet
```

Generated files (`*.freezed.dart`, `*.g.dart`, `injection.config.dart`) **are committed** (~82 files tracked). Regenerate and commit them whenever a model, bloc union, or `@injectable` annotation changes. (README says they are "not committed as a matter of course" — that is wrong.)

### Known-red baselines — both are pre-existing, neither means you broke something

- `flutter test` → **13 passing, 1 failing**. The failure is `test/widget_test.dart`, still the untouched Flutter counter template (pumps `MyApp`, asserts on `'0'` and `Icons.add`); it cannot pass against this app. `test/api_error_mapper_test.dart` holds all 13 real tests.
- `flutter analyze` → **424 issues: 0 errors, 231 warnings, 193 info** (exit code 1). Overwhelmingly `prefer_const_constructors` in `presentation/ui/widgets/`. Judge your change by whether the count moved, not by whether the command is green.

## Toolchain (verified working — read before debugging a build)

Version floors and ceilings here are narrow and mutually constraining; getting one wrong produces errors that look unrelated to versions.

| | Requirement | Why |
|---|---|---|
| Flutter | **≥ 3.44** (verified on 3.47.0 / Dart 3.13.0) | `pubspec.lock`'s `sdks:` block requires `dart >=3.12.0`, `flutter >=3.44.0`. **`pubspec.yaml`'s `sdk: '>=3.4.0 <4.0.0'` is misleading** — an older Flutter fails at `pub get`. |
| JDK | **21** | `android/gradle/wrapper/gradle-wrapper.properties` pins Gradle **8.14.3**, which cannot run on JDK 25 — the JDK current Android Studio bundles. Oracle JDK 23 is also outside AGP 8.13.2's supported range. Pin explicitly: `flutter config --jdk-dir "<path-to-jdk-21>"`. |
| Android SDK | **Platform 36 + Build-Tools 36.0.0** | `android/app/build.gradle` sets `compileSdk = 36`. |

Do **not** point Flutter at Android Studio's bundled `jbr` — that tracks whatever JDK Studio ships and has already broken this project once by moving to 25. If you build from inside Studio, set Gradle JDK to the same JDK 21 (Settings → Build Tools → Gradle).

First Android build takes **~12 minutes** (Gradle + dependency download); subsequent builds ~95s. Gradle auto-installs SDK Platform 35 and CMake 3.22.1 mid-build — this only works if SDK licenses are already accepted (`flutter doctor --android-licenses`).

### Expected, non-actionable build noise

- Flutter 3.47 warns that support for Gradle 8.14.3, AGP 8.13.2, and Kotlin 2.2.21 "will soon be dropped." **Advisory only — the build succeeds.** Upgrading these is a dedicated PR, not a drive-by fix.
- `warning: [options] source value 8 is obsolete` — from `compileOptions { sourceCompatibility = VERSION_1_8 }` in `android/app/build.gradle`.
- The Flutter migrator auto-appends `android.builtInKotlin=false` and `android.newDsl=false` to `android/gradle.properties`. **Keep them** — they are re-added on every build otherwise.
- `flutter pub get` rewrites `analysis_options.yaml` (adds `android/**`, `ios/**`, … to `exclude`) and bumps 4 Flutter-SDK-pinned lockfile entries (`matcher`, `meta`, `test_api`, `vector_math`). Expected; don't revert.

### Emulator

Needs a Play-Services image for Google Maps to render. Two failures look like app bugs but aren't:
- `Error connecting to the service protocol … Connection closed before full header was received` → adb dropped the device (`adb devices` shows `offline`). Fix: `adb kill-server; adb start-server`.
- Activity `pause timeout` / `isSleeping=true` in logcat → the emulator screen slept mid-launch and killed the VM-service handshake. Fix: `adb shell input keyevent KEYCODE_WAKEUP`, and raise `screen_off_timeout`.

## Architecture

Layering: `presentation/` (UI + bloc + navigation) → `data/` (api_service + repository + interceptor + trace) → `domain/` (freezed models), with `core/` (endpoints, errors, logging, cache, theme) underneath. UI never touches `dio` or an api_service directly: **UI → Bloc → Repository → ApiService → dio**.

Boot order in `lib/main.dart` is load-bearing: `configureDependencies()` (get_it) **must** run before `LocationService.instance.init()`, then `MyApp`.

### Naming convention (inverted from the usual `I` prefix)

- `foo_api_service.dart` / `foo_repository.dart` → the **abstract** class `FooApiService` / `FooRepository`.
- `i_foo_api_service.dart` → the **implementation** `class IFooApiService extends FooApiService`, annotated `@LazySingleton(as: FooApiService)`. Repositories keep both abstract and `IFooRepository` impl in the same file.

README's "Add a Feature" section states this backwards — follow the code, not the README. Don't "fix" the prefix piecemeal.

### Everything returns `Either<ErrorResponse, T>` (dartz)

`Left` = failure, `Right` = data; blocs `.fold()` into a `copyWith(status: ...)`. Every bloc state is a freezed class carrying a per-feature `Status` enum (`initial/loading/success/error`, plus feature-specific members like `actionLoading`, `resendSuccess`, `claimLoading`).

Raw `DioException`s are never surfaced. Api services convert with `ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(e))` — `humanizeBody` rewrites `message` to friendly copy while deliberately **passing `errors[...]` field codes through raw** so call sites can still branch on codes like `userIsNotActive`/`otpResendCooldown`; resolve those at display time with `ApiErrorMapper.resolveField` / `FriendlyErrorMessages.resolve`. New call sites can use `ApiErrorMapper.toAppError` for a single `AppError`.

### Auth is cookie-based, not bearer tokens

`lib/data/module/network_module.dart` builds one `Dio` with a `PersistCookieJar` on disk (`<appdocs>/cookies`) plus `CookieRefreshInterceptor`.

`lib/data/interceptor/cookie_refresh_interceptor.dart` is the file to understand before touching auth:
1. 401 → single-flight `POST /v1/auth/instructor/refresh` (concurrent 401s await one `Completer`, no stampede) → original request replayed via `handler.resolve`.
2. Refresh itself 401s → cookies wiped, `AuthBloc.add(AuthEvent.logout())`.
3. **Navigation is deliberately not done here.** The `redirect` in `lib/presentation/navigation/route.dart` reads `AuthBloc` state and sends `refreshFailed`/`logout` to login. Calling `router.go()` from the interceptor races go_router's redirect chain.

`CookieRefreshService` runs a periodic refresh, started on login success and stopped on logout in `AuthBloc`.

### The foreground location isolate has its own DI-free stack

`lib/data/trace/location_service_handler.dart` runs in a **separate isolate**, so `getIt` is unavailable: it constructs its own `PersistCookieJar` (same on-disk path), `Dio`, `CookieRefreshInterceptor`, `ITraceApiService`, and `CacheManagerImpl` by hand in `onStart`. Any change to how the app-side network stack is assembled must be mirrored here or background tracking silently drifts.

Loop: `LocationService` (`location_service.dart`) inits `flutter_foreground_task` with a 30s repeat; each tick reads the cached ride id (`Key.rideSessionId`, flutter_secure_storage via `CacheManagerImpl`), and if it is **null the service stops itself** (guards against `autoRunOnBoot` restarts looping forever). Otherwise it posts a position to `/v1/rides/location-tracking` and mirrors it to the UI isolate via `sendDataToMain` → `LocationService.addLocationChangedCallback`. It also refreshes cookies proactively every 10 minutes.

Map/tracking work must be tested on a physical device; needs fine + background location, notifications (Android 13+), and battery-optimization exemption.

### Navigation

`go_router` with `StatefulShellRoute.indexedStack` over three branches (Dashboard / Rides / Referral) plus root-level routes (splash, login + nested auth pages, profile, stripe verify) and a `/confirm-email` deep-link route that redirects into login with the `hash` query param.

Paths live in the `PagesName` enum (`page_name.dart`). **Leading `/` = root route; no leading `/` = nested under a branch** — getting this wrong is the usual "route not found". Arguments are passed via `extra:` and cast in the builder (`state.extra as Ride`, or a `Map<String, dynamic>` for multi-arg pages) — keep the cast in sync with every caller.

### Bloc provisioning

App-wide blocs are listed in `lib/presentation/my_app.dart` via `getIt`. Screen-scoped blocs are provided at the route or page (`BlocProvider(create: (_) => getIt<XBloc>()..add(const XEvent.fetch()))`). `bloc_concurrency` transformers are used only where ordering matters (currently `restartable()` in `location_bloc`).

### Endpoints & config

All URLs live in `lib/core/endpoints/api_endpoints.dart` (`baseUrl`, plus cursor-pagination helpers that build query strings). No inline URL strings anywhere else. There is no `.env`/flavor system — `lib/core/.env.dart` is a stub; switching backends is a source edit. The Google Maps key is duplicated in three places (AndroidManifest, `AppDelegate.swift`, `google_maps_api_service.dart`) — rotate all three, don't add a fourth.

### UI conventions

Text styles are top-level functions in `lib/core/styles.dart` (`ibmPlexSerifH5Style(color: ...)`, google_fonts); colors are `LightModeColor`/`DarkModeColor` enums in `app_colors.dart`. Loading states use `skeletonizer` through the `withSkeleton(enabled:)` / `withSliverSkeleton(enabled:)` widget extension. Themes exist for light and dark but `MyApp` pins `ThemeMode.light`.

## Constraints

- `avoid_print` is an **analyzer error**. Use `AppLog.d` / `AppLog.e` (`lib/core/log/app_log.dart`), which no-op outside debug builds. A few legacy call sites still use `dart:developer log` directly (interceptor) — prefer `AppLog` in new code.
- Enforced lints: `prefer_const_constructors`, `prefer_const_constructors_in_immutables`, `prefer_final_locals`, `unawaited_futures` (await or `unawaited(...)`), `use_build_context_synchronously` (guard with `if (!context.mounted) return;` after every await).
- `strict-casts` / `strict-raw-types` are commented out in `analysis_options.yaml`; enabling them is its own PR.
- `infinite_scroll_pagination` is pinned to a personal git fork (`shaunhossain/infinite_scroll_pagination`) with no pub.dev release; `lib/utlits/paging_state_converter.dart` is the json glue for its `PagingState`.
- Typo'd directories are intentional and load-bearing: `lib/utlits/`, `lib/core/validatator/`. `lib/core/mixin/cursor_pagination_mixin.dart` is fully commented out.
- `migrate-repo.sh` at the repo root **deletes `.git`** and re-inits against a new remote. It is a one-shot migration script — never run it.
