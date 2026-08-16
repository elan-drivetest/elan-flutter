import 'dart:convert';

/// One GPS breadcrumb, queued for `POST /v1/rides/location-tracking`.
///
/// Modelled as plain Dart rather than freezed because this lives in the
/// background isolate, which has no DI and no generated-code dependencies — and
/// because it must serialise to a compact string for the offline buffer.
///
/// [timestamp] is **capture time**. The server orders the ride's track by it and
/// sums the distance from that ordering (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §8.5),
/// so a point buffered offline for ten minutes must still say when it happened.
class LocationPing {
  const LocationPing({
    required this.rideSessionId,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.speed,
    required this.bearing,
    required this.altitude,
    required this.batteryLevel,
    required this.timezone,
    required this.timestamp,
  });

  final int rideSessionId;
  final double latitude;
  final double longitude;
  final double accuracy;
  final double speed;
  final double bearing;
  final double altitude;
  final int batteryLevel;
  final String timezone;
  final DateTime timestamp;

  Map<String, dynamic> toJson() => {
        'ride_session_id': rideSessionId,
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracy,
        'speed': speed,
        'bearing': bearing,
        'altitude': altitude,
        'battery_level': batteryLevel,
        'timezone': timezone,
        'timestamp': timestamp.toUtc().toIso8601String(),
      };

  static LocationPing? fromJson(Map<String, dynamic> j) {
    final id = j['ride_session_id'];
    final ts = j['timestamp'];
    if (id is! int || ts is! String) return null;
    final parsed = DateTime.tryParse(ts);
    if (parsed == null) return null;

    double d(dynamic v) => v is num ? v.toDouble() : 0;

    return LocationPing(
      rideSessionId: id,
      latitude: d(j['latitude']),
      longitude: d(j['longitude']),
      accuracy: d(j['accuracy']),
      speed: d(j['speed']),
      bearing: d(j['bearing']),
      altitude: d(j['altitude']),
      batteryLevel: j['battery_level'] is int ? j['battery_level'] as int : 100,
      timezone: (j['timezone'] as String?) ?? 'UTC',
      timestamp: parsed,
    );
  }

  static String encodeList(List<LocationPing> pings) =>
      jsonEncode(pings.map((p) => p.toJson()).toList());

  /// Tolerant of a corrupt or partially-written buffer: bad entries are skipped
  /// rather than losing the whole queue.
  static List<LocationPing> decodeList(String? raw) {
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map>()
          .map((e) => LocationPing.fromJson(Map<String, dynamic>.from(e)))
          .whereType<LocationPing>()
          .toList();
    } catch (_) {
      return const [];
    }
  }
}
