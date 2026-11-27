import 'package:dartz/dartz.dart';
import 'package:flutter_foreground_task/models/notification_permission.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRequestService {
  /// Foreground (While-In-Use) permission
  Future<LocationPermission> checkPermission();     // returns current level
  Future<LocationPermission> requestPermission();   // requests foreground only

  // /// Background ("Always") permission
  Future<bool> hasBackgroundPermission();           // true iff ALWAYS
  Future<bool> requestBackgroundPermission();       // tries to elevate only

  // Platform/background support extras
  /// True when Android battery optimisation will not throttle the tracker.
  /// Always true off Android.
  Future<bool> isIgnoringBatteryOptimizations();

  /// Opens the system battery-optimisation list so the instructor can exempt
  /// the app themselves. Deliberately not the direct "allow?" prompt: that
  /// needs `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`, which Google Play restricts.
  Future<void> openBatteryOptimizationSettings();
  Future<NotificationPermission> requestNotificationPermission();
  Future<NotificationPermission> checkNotificationPermission();
  Future<bool> isLocationServiceEnabled();

  /// One-shot current fix (Either error message or Location)
  Future<Either<String?, Position>> getCurrentLocation();
}