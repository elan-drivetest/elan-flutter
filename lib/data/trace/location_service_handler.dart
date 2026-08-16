import 'dart:async';
import 'dart:convert';

import 'package:battery_plus/battery_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/api_service/i_trace_api_service.dart';
import 'package:elan/data/interceptor/cookie_refresh_interceptor.dart';
import 'package:elan/data/trace/location_ping.dart';
import 'package:elan/data/trace/location_ping_queue.dart';
import 'package:elan/data/trace/location_tracking_policy.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
void startLocationService() {
  FlutterForegroundTask.setTaskHandler(LocationServiceHandler());
}

/// The ride tracker, running in its own isolate.
///
/// ## Why this is now load-bearing
///
/// `ride_session.total_distance` used to be a Distance-Matrix lookup from the
/// Start point to the Stop point. It is now the **haversine sum of the points
/// this handler uploads** (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §5.2), so the
/// distance every finished ride reports is a direct product of this file's ping
/// quality. Sparse sampling visibly under-reads; a dropped buffer is distance
/// the instructor is never credited with.
///
/// Three requirements follow (§12.6), all of which this handler previously
/// failed:
///
/// * ping every **10 s or 50 m**, whichever comes first — it was a flat 30 s;
/// * send **capture time** on every point — it sent none, so the server stamped
///   arrival time and any delayed point landed out of order;
/// * **buffer offline and replay** — it dropped failures on the floor.
///
/// ## Isolate constraints
///
/// `getIt` is unavailable here, so the Dio stack, cookie jar and cache are all
/// built by hand in [onStart]. Any change to how the app-side network stack is
/// assembled must be mirrored here or tracking silently drifts — see
/// `CLAUDE.md`.
class LocationServiceHandler extends TaskHandler {
  late final Dio _dio;
  late final PersistCookieJar _cookieJar;
  late final ITraceApiService _traceService;
  late final CacheManagerImpl _cache;
  late final LocationPingQueue _queue;

  final Battery _battery = Battery();

  Timer? _refreshTimer;
  StreamSubscription<Position>? _positionSub;

  /// Guards against the periodic tick and the displacement stream firing on top
  /// of each other — both funnel into [_capture].
  DateTime? _lastCaptureAt;

  /// Last successful battery read. The plugin can fail in a background isolate;
  /// a stale-but-real value beats the hardcoded 100 this used to send.
  int _batteryLevel = 100;

  bool _flushing = false;

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    // Cosmetic; never block a capture on a notification update.
    unawaited(FlutterForegroundTask.updateService(
      notificationTitle: 'Location Tracking',
      notificationText: 'Initializing location service…',
    ));

    final dir = await getApplicationDocumentsDirectory();
    _cookieJar = PersistCookieJar(storage: FileStorage('${dir.path}/cookies'));

    final interceptor = CookieRefreshInterceptor(_cookieJar);

    _dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
      contentType: 'application/json',
    ));

    _dio.interceptors.addAll([
      CookieManager(_cookieJar),
      interceptor,
    ]);

    interceptor.bindDio(_dio);

    _traceService = ITraceApiService(_dio);
    _cache = CacheManagerImpl(CacheManager());
    _queue = LocationPingQueue(_cache);

    await _readBattery();
    _startProactiveRefresh();
    await _startDisplacementStream();
  }

  /// 🔁 Refresh cookies every 10 minutes BEFORE access expiry
  void _startProactiveRefresh() {
    _refreshTimer?.cancel();

    _refreshTimer = Timer.periodic(
      const Duration(minutes: 10),
      (_) async {
        try {
          AppLog.d('⏰ Proactive cookie refresh');
          await _dio.post(
            ApiEndpoints.refreshCookieUrl,
            options: Options(validateStatus: (s) => s != null && s < 500),
          );
          AppLog.d('✅ Proactive refresh success');
        } catch (e) {
          AppLog.d('❌ Proactive refresh failed: $e');
        }
      },
    );
  }

  /// The 50 m half of the cadence.
  ///
  /// The foreground task's repeat handles the 10 s floor, but at highway speed
  /// 10 s is ~280 m of road — far too coarse for a distance sum that draws
  /// straight lines between samples. This stream fires on displacement, so
  /// corners and fast sections stay dense.
  Future<void> _startDisplacementStream() async {
    await _positionSub?.cancel();
    try {
      _positionSub = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: LocationTrackingPolicy.distanceFilterMetres,
        ),
      ).listen(
        (position) => _capture(position: position),
        onError: (Object e) => AppLog.d('📍 position stream error: $e'),
      );
    } catch (e) {
      // Not fatal — the periodic tick still samples, just more coarsely.
      AppLog.d('📍 could not start displacement stream: $e');
    }
  }

  @override
  void onRepeatEvent(DateTime timestamp) async {
    await _capture();
  }

  /// Records one point and tries to drain the queue.
  ///
  /// [position] is supplied by the displacement stream; the periodic tick reads
  /// a fresh fix itself.
  Future<void> _capture({Position? position}) async {
    try {
      final rideSessionId = await _cache.getTrackableRideId();
      if (rideSessionId == null) {
        // No active ride → nothing to track. Stop self so a stale
        // autoRunOnBoot restart doesn't keep looping forever.
        AppLog.d('ℹ️ No trackable ride, stopping service.');
        await _positionSub?.cancel();
        await FlutterForegroundTask.stopService();
        return;
      }

      final now = DateTime.now();
      if (!LocationTrackingPolicy.shouldCapture(
        lastCaptureAt: _lastCaptureAt,
        now: now,
        fromDisplacement: position != null,
      )) {
        return;
      }

      if (position == null) {
        final permission = await Geolocator.checkPermission();
        final enabled = await Geolocator.isLocationServiceEnabled();
        if (!enabled ||
            permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return;
        }
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );
      }

      _lastCaptureAt = now;

      final ping = LocationPing(
        rideSessionId: rideSessionId,
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        speed: position.speed,
        bearing: position.heading,
        altitude: position.altitude,
        batteryLevel: _batteryLevel,
        timezone: now.timeZoneName,
        // Capture time, not upload time — the server orders the track by this.
        timestamp: position.timestamp,
      );

      // Persist before attempting the network, so a crash mid-upload cannot
      // lose the point.
      await _queue.add(ping);
      await _flush();

      unawaited(FlutterForegroundTask.updateService(
        notificationText: 'Tracking — ${position.latitude.toStringAsFixed(4)}, '
            '${position.longitude.toStringAsFixed(4)}',
      ));

      FlutterForegroundTask.sendDataToMain(jsonEncode({
        "latitude": position.latitude,
        "longitude": position.longitude,
        "accuracy": position.accuracy,
        "altitude": position.altitude,
        "speed": position.speed,
        "heading": position.heading,
        "speedAccuracy": position.speedAccuracy,
        "altitudeAccuracy": position.altitudeAccuracy,
        "headingAccuracy": position.headingAccuracy,
        "isMocked": position.isMocked,
        "timestamp": position.timestamp.toUtc().toIso8601String(),
      }));
    } catch (e) {
      AppLog.d('❌ Error capturing location: $e');
    }
  }

  /// Drains the queue oldest-first, stopping at the first failure so ordering
  /// survives and nothing is dropped.
  Future<void> _flush() async {
    if (_flushing) return;
    _flushing = true;
    try {
      final sent = await _queue.flush((ping) async {
        final result = await _traceService.locationTracking(
          rideSessionId: ping.rideSessionId,
          latitude: ping.latitude,
          longitude: ping.longitude,
          accuracy: ping.accuracy,
          speed: ping.speed,
          bearing: ping.bearing,
          altitude: ping.altitude,
          batteryLevel: ping.batteryLevel,
          timezone: ping.timezone,
          timestamp: ping.timestamp,
        );
        return result.isRight();
      });

      if (sent > 0) {
        final remaining = await _queue.length;
        AppLog.d('✅ sent $sent point(s), $remaining queued');
      }
    } catch (e) {
      AppLog.d('❌ flush failed: $e');
    } finally {
      _flushing = false;
    }
  }

  Future<void> _readBattery() async {
    try {
      _batteryLevel = await _battery.batteryLevel;
    } catch (e) {
      // Plugin channels are not guaranteed in a background isolate; keep the
      // last known value rather than reporting a fabricated 100.
      AppLog.d('🔋 battery read failed: $e');
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    _refreshTimer?.cancel();
    await _positionSub?.cancel();
    // Last chance to hand over anything still buffered before the process goes.
    await _flush();
    AppLog.d('🛑 Foreground service stopped');
  }
}
