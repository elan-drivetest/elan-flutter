import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/trace/location_ping.dart';

/// Durable FIFO buffer for GPS breadcrumbs.
///
/// Every point now contributes to the distance the ride reports, so a point
/// dropped because the instructor drove through a dead zone is distance the
/// instructor is never credited with recording. Points are therefore persisted
/// before any upload is attempted, and only removed once the server has taken
/// them.
///
/// Persisted through [CacheManagerImpl] because the background isolate has no
/// DI and already owns one — see `CLAUDE.md` on the isolate's hand-built stack.
class LocationPingQueue {
  LocationPingQueue(this._cache);

  final CacheManagerImpl _cache;

  /// ~2.8 hours at a 10 s cadence. Long enough to cover a road test spent
  /// entirely offline; bounded so a stuck queue cannot grow without limit.
  static const int maxPoints = 1000;

  /// Uploaded per flush. Small enough that a flush finishes between ticks even
  /// on a slow connection, large enough to drain a backlog in minutes.
  static const int flushBatchSize = 25;

  List<LocationPing>? _memo;

  Future<List<LocationPing>> _load() async {
    _memo ??= LocationPing.decodeList(await _cache.getPendingLocationPings());
    return _memo!;
  }

  Future<void> _persist(List<LocationPing> pings) async {
    _memo = pings;
    await _cache.setPendingLocationPings(
        rawJson: LocationPing.encodeList(pings));
  }

  Future<int> get length async => (await _load()).length;

  /// Queue a point, dropping the oldest if the cap is reached.
  ///
  /// Dropping the oldest keeps the most recent track contiguous — the tail is
  /// what the instructor is currently driving, and a gap at the start is easier
  /// to reason about than a gap in the middle.
  Future<void> add(LocationPing ping) async {
    final pings = [...await _load(), ping];
    if (pings.length > maxPoints) {
      final overflow = pings.length - maxPoints;
      pings.removeRange(0, overflow);
      AppLog.d('📍 ping queue full — dropped $overflow oldest point(s)');
    }
    await _persist(pings);
  }

  /// Uploads queued points oldest-first via [send], stopping at the first
  /// failure so ordering is preserved and nothing is lost.
  ///
  /// Returns the number successfully sent.
  Future<int> flush(
    Future<bool> Function(LocationPing ping) send, {
    int? limit,
  }) async {
    final pings = [...await _load()];
    if (pings.isEmpty) return 0;

    final batch = pings.take(limit ?? flushBatchSize).toList();
    var sent = 0;

    for (final ping in batch) {
      final ok = await send(ping);
      if (!ok) break; // keep this point and everything after it
      sent++;
    }

    if (sent > 0) {
      await _persist(pings.sublist(sent));
    }
    return sent;
  }

  Future<void> clear() => _persist(const []);
}
