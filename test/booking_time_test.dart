import 'package:elan/core/booking_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 14 Sep 2026 13:05 UTC. Toronto is UTC-4 in September (EDT), Vancouver
  // UTC-7 (PDT), so the same instant is 9:05 AM in Toronto and 6:05 AM in
  // Vancouver — a three-hour disagreement on "when is my test".
  final utc = DateTime.utc(2026, 9, 14, 13, 5);

  group('format — renders in the booking zone, not the device zone', () {
    test('Toronto', () {
      expect(
        BookingTime.format(utc, 'America/Toronto',
            showZoneWhenDifferent: false),
        '14 Sep 2026 9:05 AM',
      );
    });

    test('Vancouver — same instant, different wall clock', () {
      expect(
        BookingTime.format(utc, 'America/Vancouver',
            showZoneWhenDifferent: false),
        '14 Sep 2026 6:05 AM',
      );
    });

    test('St John\'s — the half-hour offset Canada actually has', () {
      expect(
        BookingTime.format(utc, 'America/St_Johns',
            showZoneWhenDifferent: false),
        '14 Sep 2026 10:35 AM',
      );
    });

    test('honours DST — January is EST, not EDT', () {
      final winter = DateTime.utc(2026, 1, 14, 13, 5);
      expect(
        BookingTime.format(winter, 'America/Toronto',
            showZoneWhenDifferent: false),
        '14 Jan 2026 8:05 AM',
      );
    });
  });

  group('fallbacks never throw on a render path', () {
    test('null date', () {
      expect(BookingTime.format(null, 'America/Toronto'), 'N/A');
      expect(BookingTime.dayMonthTime(null, 'America/Toronto'), '-:-');
    });

    test('null or blank zone falls back to the default', () {
      expect(
        BookingTime.format(utc, null, showZoneWhenDifferent: false),
        BookingTime.format(utc, BookingTime.defaultZone,
            showZoneWhenDifferent: false),
      );
      expect(
        BookingTime.format(utc, '   ', showZoneWhenDifferent: false),
        BookingTime.format(utc, BookingTime.defaultZone,
            showZoneWhenDifferent: false),
      );
    });

    test('an unrecognised zone falls back rather than throwing', () {
      expect(
        () => BookingTime.format(utc, 'Mars/Olympus_Mons'),
        returnsNormally,
      );
      expect(
        BookingTime.format(utc, 'Mars/Olympus_Mons',
            showZoneWhenDifferent: false),
        BookingTime.format(utc, BookingTime.defaultZone,
            showZoneWhenDifferent: false),
      );
    });
  });

  group('dayMonthTime — matches the existing card style', () {
    test('formats with an ordinal day', () {
      expect(
        BookingTime.dayMonthTime(utc, 'America/Toronto'),
        '14th September - 9:05 AM',
      );
    });

    test('ordinals', () {
      String at(int day) => BookingTime.dayMonthTime(
            DateTime.utc(2026, 9, day, 16, 0),
            'America/Toronto',
          );
      expect(at(1), startsWith('1st'));
      expect(at(2), startsWith('2nd'));
      expect(at(3), startsWith('3rd'));
      expect(at(4), startsWith('4th'));
      expect(at(11), startsWith('11th')); // not 11st
      expect(at(12), startsWith('12th'));
      expect(at(13), startsWith('13th'));
      expect(at(21), startsWith('21st'));
    });

    test('uses the booking zone, so the DAY can differ from UTC', () {
      // 01:30 UTC on the 15th is still 9:30 PM on the 14th in Toronto.
      final lateUtc = DateTime.utc(2026, 9, 15, 1, 30);
      expect(
        BookingTime.dayMonthTime(lateUtc, 'America/Toronto'),
        '14th September - 9:30 PM',
      );
    });
  });
}
