import 'package:elan/core/booking_time.dart';
import 'package:elan/domain/common/ride/ride.dart';

/// The "one booking per calendar date" rule, evaluated client-side.
///
/// Both self-accept and admin-assign reject a second job on a date the
/// instructor already has, **regardless of time** — a 9 AM test and a 5 PM test
/// on the same day cannot both be held (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §10).
///
/// The server enforces this; the app previously let the instructor tap Accept
/// and read a 400 afterwards. Greying the card is the friendlier half of the
/// same rule — the request is still the source of truth.
///
/// **Dates are compared in the booking's own timezone**, not the device's. A
/// test at 9 PM Toronto time is 6 PM in Vancouver but still the same calendar
/// date to the backend, and an instructor travelling would otherwise see the
/// wrong jobs greyed out.
class RideAvailability {
  const RideAvailability._();

  /// Calendar dates already committed to, from the instructor's accepted rides.
  static Set<String> takenDates(Iterable<Ride> accepted) => {
        for (final r in accepted)
          if (r.testDate != null) _dateKey(r)!,
      };

  /// Whether [candidate] collides with a date already held.
  ///
  /// A booking the instructor already holds does not collide with itself, so
  /// ids are compared before dates.
  static bool clashes(Ride candidate, Iterable<Ride> accepted) {
    final key = _dateKey(candidate);
    if (key == null) return false;

    for (final held in accepted) {
      if (held.id != null && held.id == candidate.id) continue;
      if (_dateKey(held) == key) return true;
    }
    return false;
  }

  /// `yyyy-mm-dd` in the booking's timezone.
  static String? _dateKey(Ride ride) {
    final date = ride.testDate;
    if (date == null) return null;
    return BookingTime.format(
      date,
      ride.timezone,
      pattern: 'yyyy-MM-dd',
      showZoneWhenDifferent: false,
    );
  }
}
