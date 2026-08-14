import 'package:intl/intl.dart';

extension PrettyDateTime on DateTime {
  /// Formats to: 19th August - 10:00 AM
  /// Set [useLocal] to false to keep UTC.
  /// Set [longMonth] to false to use 'Aug' instead of 'August'.
  String toDayMonthTime({bool useLocal = true, bool longMonth = true}) {
    final dt = useLocal ? toLocal() : this;
    final day = dt.day;
    final suffix = _ordinal(day);
    final month = DateFormat(longMonth ? 'MMMM' : 'MMM').format(dt);
    final time = DateFormat('h:mm a').format(dt);
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

extension PrettyIsoString on String {
  /// Parses this ISO8601 string and formats as: 19th August - 10:00 AM
  /// Falls back to the original string if parsing fails.
  String toDayMonthTime({bool useLocal = true, bool longMonth = true}) {
    try {
      final dt = DateTime.parse(this);
      return dt.toDayMonthTime(useLocal: useLocal, longMonth: longMonth);
    } catch (_) {
      return this;
    }
  }
}
