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

  Future<int?> getTrackableRideId() =>
      _cache.getInt(Key.rideSessionId.keyValue);
  Future<void> setTrackableRideId({required String rideId}) =>
      _cache.setInt(Key.rideSessionId.keyValue, rideId);
  Future<void> clearTrackableRideId() =>
      _cache.remove(Key.rideSessionId.keyValue);
}
