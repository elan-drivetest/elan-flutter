# Elan Instructor App

Flutter app for driving instructors: accept road-test rides, track location live during a ride, take payments via Stripe Connect, and manage referral codes.

**New here? Read [Quick Start](#quick-start) → [How the App Is Wired](#how-the-app-is-wired) → [Add a Feature](#add-a-feature-end-to-end). That's the whole onboarding.**

- Package name: `elan` (Android appId / iOS bundle: `com.drivingschool.elan`)
- Backend: `https://api-dev.elanroadtestrental.ca`
- Stack: Flutter + BLoC + injectable/get_it + dio + freezed + go_router

---

## Quick Start

### 1. Prerequisites

| Tool | Version |
|---|---|
| Flutter SDK | stable, Dart `>=3.4.0 <4.0.0` |
| Android SDK | compileSdk 36 |
| Xcode + CocoaPods | for iOS |
| JDK | 17 (Gradle/AGP) |

```bash
flutter --version   # confirm stable channel
flutter doctor      # must be green for android + ios
```

### 2. Set up

```bash
git clone <repo-url> && cd elan-instructor-app
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # REQUIRED — app won't compile without it
flutter run
```

`build_runner` generates `injection.config.dart`, all `*.freezed.dart` and `*.g.dart`. These are **not** committed as a matter of course — if you get "undefined `_$FooFromJson`" or "getIt is not registered", you skipped this step.

### 3. Run on a real device

Location tracking uses a **foreground service + GPS**. The emulator/simulator works for UI but not for realistic ride tracking. Use a physical device for anything touching `ride_map_page`, `LocationService`, or `/v1/rides/location-tracking`.

On first launch the app requests: location (fine + background), notifications (Android 13+), and ignore-battery-optimizations. Deny any of these and ride tracking silently degrades.

### 4. Test account

Ask the team for dev credentials. Registration against `api-dev` works too, but email confirmation goes through a deep link (below).

---

## Environments & Configuration

There is **no `.env` / flavor system yet.** Config is hardcoded. To point at another backend:

```dart
// lib/core/endpoints/api_endpoints.dart
static const String baseUrl = "https://api-dev.elanroadtestrental.ca";
const bool debugMode = false;   // extra tracing in location/trace code paths
```

### Google Maps key

The same key is hardcoded in **three** places. If you rotate it, change all three:

| Platform | File |
|---|---|
| Android | `android/app/src/main/AndroidManifest.xml` → `com.google.android.geo.API_KEY` |
| iOS | `ios/Runner/AppDelegate.swift` → `GMSServices.provideAPIKey(...)` |
| Directions API (Dart) | `lib/data/api_service/google_maps_api_service.dart` → `_apiKey` |

> ⚠️ **Known issue.** The key is committed to git and unrestricted. Moving it to `--dart-define` + build-time injection is tracked work — don't add a fourth copy.

### Deep links

Email confirmation opens the app via:

- `https://www.elanroadtestrental.ca/confirm-email/...`
- custom scheme fallback: `elan://confirm-email`

Test on Android:

```bash
adb shell am start -a android.intent.action.VIEW -d "elan://confirm-email?token=xxx" com.drivingschool.elan
```

---

## How the App Is Wired

### Boot sequence

`main.dart` → `configureDependencies()` (get_it) → `LocationService.instance.init()` (foreground task) → `MyApp` → `MultiBlocProvider` (app-scoped blocs) → `MaterialApp.router` with `go_router`.

DI **must** be first; services resolve dependencies from `getIt` at init.

### Layers

```
presentation/  UI + BLoC + navigation      ← depends on domain
domain/        freezed entities & responses
data/          api_service + repository + interceptors + trace
core/          endpoints, error mapping, logging, cache, theme
```

Rule: UI never touches `dio` or an API service directly. UI → Bloc → Repository → ApiService → dio.

### Networking (`lib/data/module/network_module.dart`)

Single `Dio` singleton with:

- `baseUrl` from `ApiEndpoints`, 50s connect/receive timeouts
- `CookieManager` over a `PersistCookieJar` on disk (`<appdocs>/cookies`) — **auth is cookie-based, not Bearer tokens**
- `CookieRefreshInterceptor`

### Auth & the 401 flow

`CookieRefreshInterceptor` is the single most important file to understand:

1. Request returns 401 → interceptor pauses, single-flights a `POST /v1/auth/instructor/refresh` (concurrent 401s wait on one `Completer`, they do not stampede).
2. Refresh OK → original request is replayed transparently.
3. Refresh itself 401s → cookies cleared, `AuthBloc.logout()` dispatched.

Navigation on logout is **not** done in the interceptor — the `go_router` `redirect` in `lib/presentation/navigation/route.dart` watches `AuthState` and sends the user to login. Calling `router.go()` from the interceptor races the redirect chain. Don't.

### Errors

Every API method returns `Either<ErrorResponse, T>` (dartz). Left = failure, Right = data.

```dart
final result = await userRepository.getInstructorInfo();
result.fold(
  (err) => emit(state.copyWith(status: Status.error, message: err.message)),
  (data) => emit(state.copyWith(status: Status.success, data: data)),
);
```

Raw `DioException`s are translated in `lib/core/error/`:

- `api_error_mapper.dart` — `toAppError()` for new call sites; `humanizeBody()` rewrites the JSON body so existing `*ErrorResponse.fromJson` models get friendly text with no model change.
- `app_error.dart` — user-safe `AppError` (`message`, `code`, `statusCode`, `field`, `isNetwork`, `isAuth`).
- `friendly_error_messages.dart` — the copy shown to users.

Never surface a raw backend string to the UI; run it through the mapper.

### Logging

`print` and `debugPrint` are **analyzer errors**. Use `AppLog` (`lib/core/log/app_log.dart`) — debug-only, silent in release.

```dart
AppLog.d('ride started: $rideId');
AppLog.e('start ride failed', error: e, stack: s);
```

### Location tracking

`lib/data/trace/location_service.dart` + `location_service_handler.dart` run a `flutter_foreground_task` that emits a position every **30s**, POSTing to `/v1/rides/location-tracking` with lat/lng, accuracy, speed, bearing, altitude, battery level, timezone. Session id is cached under `Key.rideSessionId` (`lib/core/cache/`).

### Navigation

`go_router` with a `StatefulShellRoute` (bottom tabs: Dashboard / Rides / Referral) plus root-level full-screen routes.

- Routes: `lib/presentation/navigation/route.dart`
- Paths: `lib/presentation/navigation/page_name.dart` — enum, `PagesName.dashboardPage.path`
- Leading `/` = root route; no leading `/` = nested under a shell branch. Getting this wrong is the usual cause of "route not found".

```dart
context.push(PagesName.rideMapPage.path, extra: ride);
context.go(PagesName.dashboardPage.path);
```

Objects are passed via `extra:` and cast in the route builder — keep the cast type in sync with the caller.

### State management

App-wide blocs are provided in `my_app.dart` and constructed from `getIt`. Screen-local blocs are provided per-page:

```dart
BlocProvider(
  create: (_) => getIt<MyFeatureBloc>()..add(const MyFeatureEvent.fetch()),
  child: ...,
)
```

Events/states are `freezed` unions; state uses `copyWith` + a `status` enum. Prefer `BlocSelector`/`buildWhen` over rebuilding whole pages.

---

## Repo Map

```
lib/
├── core/
│   ├── endpoints/api_endpoints.dart   # all URLs + baseUrl + debugMode
│   ├── error/                         # api_error_mapper, app_error, friendly messages
│   ├── log/app_log.dart               # use instead of print
│   ├── cache/                         # cache_manager + Key enum
│   ├── extension/ mixin/ validatator/
│   ├── app_colors.dart app_themes.dart styles.dart
│
├── data/
│   ├── api_service/                   # *_api_service.dart (impl) + i_*_api_service.dart (abstract)
│   ├── repository/                    # auth, user, public, direction
│   ├── interceptor/                   # cookie_refresh_interceptor.dart
│   ├── module/network_module.dart     # Dio + CookieJar DI
│   ├── service/cookie_refresh_service.dart
│   └── trace/                         # foreground location service
│
├── domain/                            # freezed entities, one folder per response type
│
├── presentation/
│   ├── bloc/                          # one folder per bloc (bloc + event + state + generated)
│   ├── ui/pages/                      # one folder per screen
│   ├── ui/widgets/                    # reusable + per-screen widgets
│   ├── ui/dialog/  ui/extension/
│   ├── navigation/                    # route.dart, page_name.dart, tab_page_name.dart
│   └── my_app.dart
│
├── utlits/paging_state_converter.dart  # (sic) infinite_scroll_pagination glue
├── injection.dart / injection.config.dart
└── main.dart
```

Naming quirk worth knowing: `i_*_api_service.dart` holds the **abstract** interface; `*_api_service.dart` holds the `@injectable` implementation. (The `I` prefix is inverted vs. the usual convention — don't "fix" it piecemeal.)

---

## Add a Feature (end to end)

Follow the same six steps every time.

**1. Domain model** — `lib/domain/my_feature/my_model.dart`

```dart
@freezed
class MyModel with _$MyModel {
  const factory MyModel({required String id, required String name}) = _MyModel;
  factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
}
```

**2. Endpoint** — add the URL to `lib/core/endpoints/api_endpoints.dart`. No inline URL strings anywhere else.

**3. API service** — interface in `i_my_feature_api_service.dart`, impl in `my_feature_api_service.dart`

```dart
@Injectable(as: MyFeatureApiService)
class IMyFeatureApiService implements MyFeatureApiService {
  final Dio dio;
  IMyFeatureApiService(this.dio);

  @override
  Future<Either<ErrorResponse, MyModel>> fetchData() async {
    try {
      final res = await dio.get(ApiEndpoints.myFeatureUrl);
      return Right(MyModel.fromJson(res.data));
    } on DioException catch (e) {
      return Left(ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(e)));
    }
  }
}
```

**4. Repository** — thin pass-through, `@LazySingleton(as: MyFeatureRepository)`.

**5. Bloc** — `lib/presentation/bloc/my_feature_bloc/` with `_bloc.dart`, `_event.dart`, `_state.dart`. Mark `@injectable`. Use `bloc_concurrency` transformers (`droppable()` for submit, `restartable()` for search) where it matters.

**6. Page + route** — page under `ui/pages/my_feature_page/`, add to `PagesName`, add a `GoRoute` under the right shell branch.

Then regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Day-to-Day Commands

```bash
# code generation (after touching freezed / json / @injectable)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs   # leave running while developing

# quality gate — run both before pushing
flutter analyze
flutter test

# formatting
dart format lib test

# builds
flutter build apk --release
flutter build ios --release      # release signs with DEBUG keys — see Known Issues
```

### Lint rules that will bite you

From `analysis_options.yaml`:

- `avoid_print` → **error** (use `AppLog`)
- `prefer_const_constructors`, `prefer_const_constructors_in_immutables`
- `prefer_final_locals`
- `unawaited_futures` → `await` it or `unawaited(...)`
- `use_build_context_synchronously` → guard with `if (!context.mounted) return;` after every `await`

Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) are excluded from analysis.

---

## Testing

Current coverage is thin — `test/api_error_mapper_test.dart` and `test/widget_test.dart`. New work should add tests.

```bash
flutter test
flutter test test/api_error_mapper_test.dart
```

Blocs are the highest-value target: inject a fake repository returning `Left`/`Right` and assert the emitted state sequence with `bloc_test`-style expectations.

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| `_$MyModelFromJson` undefined / `*.freezed.dart` missing | `dart run build_runner build --delete-conflicting-outputs` |
| `Bad state: GetIt: Object/factory with type X is not registered` | Missing `@injectable`, or regenerate `injection.config.dart` |
| build_runner conflict errors | `dart run build_runner clean` then rebuild |
| Blank grey map | Google Maps key wrong/unrestricted for that platform — check all three locations above |
| Endless login loop | Refresh 401 → `CookieRefreshInterceptor._handleUnauthorized`. Clear app data (cookie jar is persisted to disk) |
| No location updates | Real device? Background location + notification permissions granted? Battery optimization disabled? |
| iOS pod errors after dependency change | `cd ios && pod repo update && pod install` |
| Android Gradle/JDK error | JDK 17, `cd android && ./gradlew clean` |
| Stale everything | `flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs` |

---

## Known Issues / Tech Debt

Read before you're surprised by them:

- **Google Maps API key is committed** in three files, unrestricted. Needs `--dart-define`.
- **`infinite_scroll_pagination` is pinned to a personal fork** (`github.com/shaunhossain/infinite_scroll_pagination`) with no pub.dev release. Move to upstream or vendor it.
- **Release builds sign with debug keys** (`android/app/build.gradle`). Needs a real signing config before any store release.
- **No flavors / `.env`** — env switching is a source edit.
- `strict-casts` / `strict-raw-types` are commented out in `analysis_options.yaml`; enabling them is a dedicated PR.
- Typo'd directories kept for stability: `lib/utlits/`, `lib/core/validatator/`.

---

## Contributing

```bash
git checkout -b feat/short-description
# ... work ...
dart run build_runner build --delete-conflicting-outputs
flutter analyze && flutter test && dart format lib test
git commit -m "feat: add X"
git push -u origin feat/short-description
```

Branch off `master`. Conventional-ish commit prefixes (`feat:`, `fix:`, `chore:`). PR checklist:

- [ ] `flutter analyze` clean
- [ ] `flutter test` passes
- [ ] Generated files regenerated if models/DI changed
- [ ] No `print` / hardcoded URLs / hardcoded keys
- [ ] Location or map changes tested on a **physical device**

---

## References

- [Flutter](https://docs.flutter.dev/) · [BLoC](https://bloclibrary.dev/) · [freezed](https://pub.dev/packages/freezed) · [injectable](https://pub.dev/packages/injectable) · [go_router](https://pub.dev/packages/go_router) · [dio](https://pub.dev/packages/dio) · [dartz](https://pub.dev/packages/dartz)

Proprietary software for Elan Road Test Rental.
