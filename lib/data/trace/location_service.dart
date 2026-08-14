import 'dart:convert';
import 'package:elan/core/log/app_log.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';

import 'location_service_handler.dart';

typedef LocationChanged = void Function(Position position);

class LocationService {
  LocationService._();

  static final LocationService instance = LocationService._();

  void init() {
    FlutterForegroundTask.initCommunicationPort();
    FlutterForegroundTask.addTaskDataCallback(_onReceiveTaskData);

    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'location_request_service',
        channelName: 'Location Service',
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(30000),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  Future<void> start() async {
    try {
      if (await isRunningService) return;

      final ServiceRequestResult result =
          await FlutterForegroundTask.startService(
        serviceId: 200,
        notificationTitle: 'Location Service',
        notificationText: 'Starting location tracking…',
        callback: startLocationService,
      );

      if (result is ServiceRequestFailure) {
        AppLog.d('❌🚀 Start service failed: ${result.error}');
      }
    } catch (e, st) {
      AppLog.d('💥🚀 Start service exception: $e\n$st');
    }
  }

  Future<void> stop() async {
    try {
      if (!await isRunningService) return;

      final ServiceRequestResult result =
          await FlutterForegroundTask.stopService();

      if (result is ServiceRequestFailure) {
        AppLog.d('❌🛑 Stop service failed: ${result.error}');
      }
    } on ServiceNotStartedException {
      return;
    } catch (e, st) {
      AppLog.d('💥🛑 Stop service exception: $e\n$st');
    }
  }

  Future<bool> get isRunningService => FlutterForegroundTask.isRunningService;

  // ------------- Service callback -------------
  final List<LocationChanged> _callbacks = [];

  void _onReceiveTaskData(Object data) {
    try {
      if (data is! String) return;

      final Map<String, dynamic> jsonMap = jsonDecode(data);

      /// Convert JSON → Position
      final Position position = Position(
        latitude: jsonMap["latitude"],
        longitude: jsonMap["longitude"],
        accuracy: jsonMap["accuracy"],
        altitude: jsonMap["altitude"],
        speed: jsonMap["speed"],
        heading: jsonMap["heading"],
        timestamp: DateTime.parse(jsonMap["timestamp"]),
        floor: null,
        speedAccuracy: jsonMap["speedAccuracy"] ?? 0.0,
        altitudeAccuracy: jsonMap["altitudeAccuracy"] ?? 0.0,
        headingAccuracy: jsonMap["headingAccuracy"] ?? 0.0,
        isMocked: jsonMap["isMocked"] ?? false,
      );

      for (final callback in _callbacks.toList()) {
        try {
          callback(position);
        } catch (e) {
          AppLog.d('⚠️📍 Location callback error: $e');
        }
      }
    } catch (e) {
      AppLog.d('⚠️📍 Task data parse error: $e');
    }
  }

  void addLocationChangedCallback(LocationChanged callback) {
    if (!_callbacks.contains(callback)) {
      _callbacks.add(callback);
    }
  }

  void removeLocationChangedCallback(LocationChanged callback) {
    _callbacks.remove(callback);
  }
}