import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/cache/key.dart';
import 'package:elan/data/trace/location_ping.dart';
import 'package:elan/data/trace/location_ping_queue.dart';
import 'package:flutter_test/flutter_test.dart';

/// In-memory stand-in for secure storage, so the queue can be tested without a
/// platform channel.
class _FakeCache implements CacheManager {
  final Map<String, String> store = {};

  @override
  Future<String?> getString(String key) async => store[key];

  @override
  Future<void> setString(String key, String value) async => store[key] = value;

  @override
  Future<void> remove(String key) async => store.remove(key);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

LocationPing _ping(int second, {int session = 88}) => LocationPing(
      rideSessionId: session,
      latitude: 43.5 + second / 10000,
      longitude: -80.2,
      accuracy: 6,
      speed: 14.2,
      bearing: 271,
      altitude: 338,
      batteryLevel: 84,
      timezone: 'America/Toronto',
      timestamp: DateTime.utc(2026, 9, 14, 13, 0, second),
    );

void main() {
  late _FakeCache raw;
  late LocationPingQueue queue;

  setUp(() {
    raw = _FakeCache();
    queue = LocationPingQueue(CacheManagerImpl(raw as CacheManager));
  });

  group('serialisation', () {
    test('a ping round-trips, capture time included', () {
      final original = _ping(5);
      final decoded = LocationPing.decodeList(
        LocationPing.encodeList([original]),
      ).single;

      expect(decoded.rideSessionId, original.rideSessionId);
      expect(decoded.timestamp.toUtc(), original.timestamp.toUtc());
      expect(decoded.latitude, closeTo(original.latitude, 1e-9));
      expect(decoded.batteryLevel, 84);
    });

    test('a corrupt buffer degrades to empty rather than throwing', () {
      expect(LocationPing.decodeList('not json'), isEmpty);
      expect(LocationPing.decodeList('{"not":"a list"}'), isEmpty);
      expect(LocationPing.decodeList(null), isEmpty);
    });

    test('bad entries are skipped, good ones survive', () {
      final good = LocationPing.encodeList([_ping(1)]);
      final mixed = good.replaceFirst('[', '[{"ride_session_id":"nope"},');
      expect(LocationPing.decodeList(mixed).length, 1);
    });
  });

  group('durability', () {
    test('points are persisted, not just held in memory', () async {
      await queue.add(_ping(1));
      // A fresh queue over the same storage — simulates a process death.
      final reborn = LocationPingQueue(CacheManagerImpl(raw as CacheManager));
      expect(await reborn.length, 1);
    });

    test('the buffer is capped, dropping oldest', () async {
      for (var i = 0; i < LocationPingQueue.maxPoints + 5; i++) {
        await queue.add(_ping(i));
      }
      expect(await queue.length, LocationPingQueue.maxPoints);

      // The retained tail must be the most recent points.
      final kept = LocationPing.decodeList(
        raw.store[Key.pendingLocationPings.keyValue],
      );
      expect(kept.last.timestamp.second,
          _ping(LocationPingQueue.maxPoints + 4).timestamp.second);
    });
  });

  group('flush preserves order and loses nothing', () {
    test('sends oldest first', () async {
      for (var i = 0; i < 3; i++) {
        await queue.add(_ping(i));
      }
      final sentOrder = <int>[];
      await queue.flush((p) async {
        sentOrder.add(p.timestamp.second);
        return true;
      });
      expect(sentOrder, [0, 1, 2]);
      expect(await queue.length, 0);
    });

    test('stops at the first failure and keeps the remainder', () async {
      for (var i = 0; i < 5; i++) {
        await queue.add(_ping(i));
      }
      var calls = 0;
      final sent = await queue.flush((p) async {
        calls++;
        return calls <= 2; // third call fails
      });

      expect(sent, 2);
      expect(await queue.length, 3, reason: 'unsent points must survive');

      // And the survivors are the right ones, still in order.
      final remaining =
          LocationPing.decodeList(raw.store[Key.pendingLocationPings.keyValue]);
      expect(remaining.map((p) => p.timestamp.second), [2, 3, 4]);
    });

    test('a total failure keeps everything', () async {
      await queue.add(_ping(1));
      final sent = await queue.flush((_) async => false);
      expect(sent, 0);
      expect(await queue.length, 1);
    });

    test('flushing an empty queue is a no-op', () async {
      expect(await queue.flush((_) async => true), 0);
    });

    test('a flush is batched, not unbounded', () async {
      for (var i = 0; i < LocationPingQueue.flushBatchSize + 10; i++) {
        await queue.add(_ping(i));
      }
      final sent = await queue.flush((_) async => true);
      expect(sent, LocationPingQueue.flushBatchSize);
      expect(await queue.length, 10);
    });
  });
}
