import 'package:injectable/injectable.dart';
import 'cache_manager.dart';
import 'key.dart';

@lazySingleton
class CacheManagerImpl {
  final CacheManager _cache;

  CacheManagerImpl(this._cache);

  Future<void> clean() async {
    await _cache.clearAll();
  }

  // Future<String?> getToken() => _cache.getString(Key.token.keyValue);
  //
  // Future<void> setToken({required String? token}) async {
  //   if (token != null) {
  //     await _cache.setString(Key.token.keyValue, token);
  //   } else if (await _cache.containsKey(Key.token.keyValue)) {
  //     await _cache.remove(Key.token.keyValue);
  //   }
  // }

  /// The **ride session** id — what `/rides/location-tracking` and `/rides/stop`
  /// expect. Read by the background isolate on every tracking tick.
  ///
  /// This must never hold a booking id. It did: `_onStartRide` used to write
  /// the booking id here, so every breadcrumb between Start and the next
  /// dashboard refresh was posted under the wrong `ride_session_id`.
  Future<int?> getTrackableRideId() =>
      _cache.getInt(Key.rideSessionId.keyValue);
  Future<void> setTrackableRideId({required String rideId}) =>
      _cache.setInt(Key.rideSessionId.keyValue, rideId);
  Future<void> clearTrackableRideId() =>
      _cache.remove(Key.rideSessionId.keyValue);

  Future<String?> getPricingConfig() =>
      _cache.getString(Key.pricingConfig.keyValue);
  Future<void> setPricingConfig({required String rawJson}) =>
      _cache.setString(Key.pricingConfig.keyValue, rawJson);

  Future<String?> getPendingLocationPings() =>
      _cache.getString(Key.pendingLocationPings.keyValue);
  Future<void> setPendingLocationPings({required String rawJson}) =>
      _cache.setString(Key.pendingLocationPings.keyValue, rawJson);

  /// The booking being driven — a fast path, not the only copy.
  ///
  /// `/rides/current` carries `booking_id` but none of these details (§8.8), so
  /// an empty cache is recoverable: re-fetch the booking by id.
  Future<String?> getActiveBooking() =>
      _cache.getString(Key.activeBooking.keyValue);
  Future<void> setActiveBooking({required String rawJson}) =>
      _cache.setString(Key.activeBooking.keyValue, rawJson);
  Future<void> clearActiveBooking() =>
      _cache.remove(Key.activeBooking.keyValue);
}
