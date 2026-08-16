/// The sampling cadence required by the backend's distance calculation.
///
/// `ride_session.total_distance` is the haversine sum of the points the app
/// uploads (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §5.2), so cadence is not a battery
/// trade-off any more — it is accuracy of a number the instructor is shown.
/// §12.6 specifies **every 10 s or 50 m of displacement, whichever comes
/// first**.
///
/// Pure functions, kept out of the isolate so they can be tested without a
/// foreground service.
class LocationTrackingPolicy {
  const LocationTrackingPolicy._();

  /// The time floor. Was 30 s, which at 100 km/h leaves ~830 m of unsampled
  /// road between points — and the server draws a straight line across it.
  static const Duration interval = Duration(seconds: 10);

  /// Displacement trigger, in metres, handed to the position stream.
  static const int distanceFilterMetres = 50;

  /// Two triggers feed one capture path, so they can arrive together — a
  /// displacement event moments after a periodic tick. This debounce stops the
  /// pair becoming a duplicate point.
  ///
  /// Deliberately short: at highway speed 50 m passes in under two seconds, and
  /// dropping those points is exactly the under-reading this work is fixing.
  static const Duration minGap = Duration(milliseconds: 1500);

  /// Whether a capture should proceed now.
  ///
  /// [fromDisplacement] marks events raised by the position stream — those have
  /// already cleared the 50 m filter, so they only need to clear [minGap].
  /// Periodic ticks must additionally have waited a full [interval], so a tick
  /// landing between two displacement events does not add a redundant point.
  static bool shouldCapture({
    required DateTime? lastCaptureAt,
    required DateTime now,
    required bool fromDisplacement,
  }) {
    if (lastCaptureAt == null) return true;

    final elapsed = now.difference(lastCaptureAt);
    if (elapsed.isNegative) return true; // clock moved backwards; do not stall

    if (elapsed < minGap) return false;
    return fromDisplacement || elapsed >= interval;
  }
}
