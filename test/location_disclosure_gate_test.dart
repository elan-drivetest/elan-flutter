import 'package:dartz/dartz.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/location_request_service/location_request_service.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:flutter_foreground_task/models/notification_permission.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

/// Google Play's prominent-disclosure rule: no OS location prompt before the
/// in-app disclosure is accepted. These pin the gate in LocationBloc.

class _SpyLocationService implements LocationRequestService {
  int prompts = 0;
  bool batteryOk = false;

  @override
  Future<NotificationPermission> checkNotificationPermission() async =>
      NotificationPermission.granted;
  @override
  Future<bool> hasBackgroundPermission() async => false;
  @override
  Future<LocationPermission> checkPermission() async =>
      LocationPermission.denied;
  @override
  Future<LocationPermission> requestPermission() async {
    prompts++;
    return LocationPermission.whileInUse;
  }

  @override
  Future<bool> requestBackgroundPermission() async {
    prompts++;
    return true;
  }

  @override
  Future<bool> isIgnoringBatteryOptimizations() async => batteryOk;
  @override
  Future<bool> isLocationServiceEnabled() async => true;
  @override
  Future<Either<String?, Position>> getCurrentLocation() async =>
      left('no fix in tests');

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

class _MemoryCache extends CacheManager {
  final Map<String, String> store = {};
  @override
  Future<void> setBool(String key, bool value) async =>
      store[key] = value.toString();
  @override
  Future<bool?> getBool(String key) async =>
      store[key] == null ? null : store[key] == 'true';
}

void main() {
  late _SpyLocationService service;
  late CacheManagerImpl cache;

  setUp(() {
    service = _SpyLocationService();
    cache = CacheManagerImpl(_MemoryCache());
  });

  Future<List<LocationState>> run(LocationEvent event) async {
    final bloc = LocationBloc(service, cache);
    final seen = <LocationState>[];
    final sub = bloc.stream.listen(seen.add);
    bloc.add(event);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    await sub.cancel();
    await bloc.close();
    return seen;
  }

  test('without the disclosure, no OS prompt is shown', () async {
    final states = await run(const LocationEvent.checkAllPermissions());
    expect(states.last.status, LocationStatus.disclosureRequired);
    expect(service.prompts, 0);
  });

  test('the ride-start location check is gated too', () async {
    final states = await run(const LocationEvent.checkLocationAccess(
        isRideRequest: true, rideId: 7));
    expect(states.last.status, LocationStatus.disclosureRequired);
    expect(service.prompts, 0);
  });

  test('accepting records it and then runs the permission flow', () async {
    final states = await run(const LocationEvent.acceptDisclosure());
    expect(await cache.getLocationDisclosureAccepted(), isTrue);
    expect(service.prompts, greaterThan(0));
    expect(states.map((s) => s.status),
        isNot(contains(LocationStatus.disclosureRequired)));
  });

  test('battery optimisation no longer blocks; it only flags the state',
      () async {
    await cache.setLocationDisclosureAccepted();
    service.batteryOk = false;
    final states = await run(const LocationEvent.checkBackgroundPermissions());
    expect(states.last.status, LocationStatus.success);
    expect(states.last.batteryRestricted, isTrue);
  });
}
