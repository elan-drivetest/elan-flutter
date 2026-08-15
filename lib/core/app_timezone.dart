/// The IANA timezone the backend expects for ride timestamps.
///
/// Elan operates in a single Canadian region, so one constant is enough — but
/// Canada spans six zones, so this must be revisited before launching outside
/// the current operating province.
///
/// Note this is an **IANA** identifier. Do not use `DateTime.now().timeZoneName`
/// as a substitute: that returns an abbreviation ("EDT"/"EST") which the
/// backend does not accept, and which silently differs from the value the
/// ride-start endpoint receives.
const String kDefaultIanaTimezone = 'America/Toronto';

/// Prefers the timezone the server attached to the ride, falling back to the
/// app default. Use this everywhere a timezone is sent to the API so all call
/// sites agree on one format.
String resolveTimezone(String? rideTimezone) {
  final value = rideTimezone?.trim();
  return (value == null || value.isEmpty) ? kDefaultIanaTimezone : value;
}
