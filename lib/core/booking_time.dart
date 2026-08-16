import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Renders a booking's `test_date` in the booking's own timezone.
///
/// `test_date` is UTC and `booking.timezone` (default `America/Toronto`) is the
/// zone the test actually happens in — the customer's
/// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §12.4).
///
/// The app previously called `.toLocal()`, which renders in the *device's* zone.
/// Canada spans six time zones, so an instructor whose phone is on Mountain time
/// looking at a Toronto booking saw the test two hours earlier than it is. For a
/// screen whose whole purpose is "when do I need to be there", that is the worst
/// possible class of bug — it is silently wrong and looks right.
class BookingTime {
  const BookingTime._();

  static const String defaultZone = 'America/Toronto';

  static bool _initialised = false;

  /// Loads the IANA database. Idempotent, and lazy so it stays out of the boot
  /// sequence in `main.dart`, which is order-sensitive.
  static void _ensureInitialised() {
    if (_initialised) return;
    tzdata.initializeTimeZones();
    _initialised = true;
  }

  static tz.Location _location(String? name) {
    _ensureInitialised();
    try {
      return tz.getLocation(
        (name == null || name.trim().isEmpty) ? defaultZone : name.trim(),
      );
    } catch (_) {
      // Unrecognised zone string — fall back rather than throw on a render path.
      return tz.getLocation(defaultZone);
    }
  }

  /// [utc] rendered in [zone].
  ///
  /// When the booking's zone puts the test at a different wall-clock time than
  /// the device would show, the abbreviation is appended (`9:05 AM EDT`) so the
  /// instructor can see *why* it disagrees with their phone.
  static String format(
    DateTime? utc,
    String? zone, {
    String pattern = 'd MMM yyyy h:mm a',
    bool showZoneWhenDifferent = true,
  }) {
    if (utc == null) return 'N/A';

    final location = _location(zone);
    final inZone = tz.TZDateTime.from(utc.toUtc(), location);
    final formatted = DateFormat(pattern).format(inZone);

    if (!showZoneWhenDifferent) return formatted;

    final deviceLocal = utc.toLocal();
    final sameWallClock = deviceLocal.hour == inZone.hour &&
        deviceLocal.minute == inZone.minute &&
        deviceLocal.day == inZone.day;

    return sameWallClock ? formatted : '$formatted ${inZone.timeZoneName}';
  }

  /// Matches the existing `toDayMonthTime()` style — `19th August - 10:00 AM` —
  /// but anchored to the booking's zone instead of the device's.
  static String dayMonthTime(DateTime? utc, String? zone) {
    if (utc == null) return '-:-';

    final location = _location(zone);
    final inZone = tz.TZDateTime.from(utc.toUtc(), location);

    final day = inZone.day;
    final suffix = _ordinal(day);
    final month = DateFormat('MMMM').format(inZone);
    final time = DateFormat('h:mm a').format(inZone);
    return '$day$suffix $month - $time';
  }

  static String _ordinal(int n) {
    if (n >= 11 && n <= 13) return 'th';
    switch (n % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
