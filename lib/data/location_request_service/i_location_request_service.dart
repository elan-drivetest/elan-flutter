import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location_request_service.dart';

@LazySingleton(as: LocationRequestService)
class ILocationRequestService implements LocationRequestService {
  @override
  Future<NotificationPermission> checkNotificationPermission() async {
    return await FlutterForegroundTask.checkNotificationPermission();
  }

  @override
  Future<Either<String?, Position>> getCurrentLocation() async {
    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          //distanceFilter: 10,
        ),
      );

      // Android mock location check
      if (Platform.isAndroid && pos.isMocked == true) {
        return left("Mock location detected.");
      }

      // iOS: Reduced accuracy / stale timing check
      if (Platform.isIOS) {
        // iOS Approximate location → accuracy radius too large
        if (pos.accuracy > 1000) {
          return left("Reduced accuracy location on Device (approximate only).");
        }

        // Reject stale data (>5 mins old)
        if (pos.timestamp
            .isBefore(DateTime.now().subtract(const Duration(minutes: 5)))) {
          return left("iOS location data is stale.");
        }
      }

      return right(pos);
    } catch (e, s) {
      return left("Failed to get location: $e");
    }
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> requestIgnoreBatteryOptimization() async {
    if (!Platform.isAndroid) return true;

    if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      final result =
      await FlutterForegroundTask.requestIgnoreBatteryOptimization();
      if (!result) return false;
    }

    if (!await FlutterForegroundTask.canScheduleExactAlarms) {
      await FlutterForegroundTask.openAlarmsAndRemindersSettings();
      return false;
    }

    return true;
  }

  @override
  Future<NotificationPermission> requestNotificationPermission() async {
    return await FlutterForegroundTask.requestNotificationPermission();
  }

  @override
  Future<LocationPermission> requestPermission() async {
    final current = await Geolocator.checkPermission();

    if (current == LocationPermission.denied) {
      return await Geolocator.requestPermission();
    }

    // do NOT show permission dialog again
    return current;
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  @override
  Future<bool> hasBackgroundPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always;
  }

  @override
  Future<bool> requestBackgroundPermission() async {
    try {
      final current = await Geolocator.checkPermission();

      if (current == LocationPermission.always) return true;

      if (Platform.isAndroid) {
        /// Android: must request in 2 steps for Android 11+
        if (current == LocationPermission.whileInUse) {
          /// Use permission_handler to request background location
          /// This properly shows "Allow all the time" option on Android 11+
          final status = await Permission.locationAlways.request();
          return status.isGranted;
        }

        /// If denied, cannot jump to ALWAYS. Must request normal permission first.
        return false;
      }

      /// iOS: Home-screen reopen sometimes triggers Always prompt automatically
      final perm = await Geolocator.requestPermission();
      return perm == LocationPermission.always;
    } catch (_) {
      return false;
    }
  }
}