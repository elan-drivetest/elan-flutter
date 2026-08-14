import 'dart:async';
import 'package:elan/core/log/app_log.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/data/api_service/trace_api_service.dart';
import 'package:elan/data/api_service/i_trace_api_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:elan/data/interceptor/cookie_refresh_interceptor.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';

@pragma('vm:entry-point')
void startLocationService() {
  FlutterForegroundTask.setTaskHandler(LocationServiceHandler());
}

class LocationServiceHandler extends TaskHandler {
  late final Dio _dio;
  late final PersistCookieJar _cookieJar;
  late final ITraceApiService traceService;
  late final CacheManagerImpl authCacheManager;

  Timer? _refreshTimer;

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    FlutterForegroundTask.updateService(
      notificationTitle: 'Location Tracking',
      notificationText: 'Initializing location service…',
    );

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

    traceService = ITraceApiService(_dio);
    authCacheManager = CacheManagerImpl(CacheManager());

    _startProactiveRefresh();
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
            options: Options(
              validateStatus: (s) => s != null && s < 500,
            ),
          );

          AppLog.d('✅ Proactive refresh success');
        } catch (e) {
          AppLog.d('❌ Proactive refresh failed: $e');
        }
      },
    );
  }

  @override
  void onRepeatEvent(DateTime timestamp) async {
    FlutterForegroundTask.updateService(
      notificationText: 'Tracking location…',
    );
    await _backgroundWork();
  }

  Future<bool> _backgroundWork() async {
    try {
      final rideSessionId = await authCacheManager.getTrackableRideId();
      if (rideSessionId == null) {
        // No active ride → nothing to track. Stop self so a stale
        // autoRunOnBoot restart doesn't keep looping forever.
        AppLog.d('ℹ️ No trackable ride, stopping service.');
        await FlutterForegroundTask.stopService();
        return false;
      }

      final permission = await Geolocator.checkPermission();
      final enabled = await Geolocator.isLocationServiceEnabled();

      if (!enabled ||
          permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }

      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
        ),
      );

      await traceService.locationTracking(
        rideSessionId: rideSessionId,
        accuracy: pos.accuracy,
        latitude: pos.latitude,
        longitude: pos.longitude,
        altitude: pos.altitude,
        speed: pos.speed,
        bearing: pos.heading,
        batteryLevel: 100,
        timezone: DateTime.now().timeZoneName,
      );

      FlutterForegroundTask.updateService(
        notificationText: 'lat: ${pos.latitude}, lon: ${pos.longitude}',
      );

      FlutterForegroundTask.sendDataToMain(jsonEncode({
        "latitude": pos.latitude,
        "longitude": pos.longitude,
        "accuracy": pos.accuracy,
        "altitude": pos.altitude,
        "speed": pos.speed,
        "heading": pos.heading,
        "speedAccuracy": pos.speedAccuracy,
        "altitudeAccuracy": pos.altitudeAccuracy,
        "headingAccuracy": pos.headingAccuracy,
        "isMocked": pos.isMocked,
        "timestamp": DateTime.now().toUtc().toIso8601String(),
      }));

      AppLog.d('✅ Location snapshot sent successfully.');
      return true;
    } catch (e) {
      AppLog.d('❌ Error in background work: $e');
      return false;
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    _refreshTimer?.cancel();
    AppLog.d('🛑 Foreground service stopped');
  }
}