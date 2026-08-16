import 'package:dartz/dartz.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/cache/key.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/accept_response/accept_response.dart';
import 'package:elan/domain/ride_response/ride_response.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regression cover for the accept flow.
///
/// `_onAcceptRide` writes the new ride-session id to the cache and *then*
/// emits. That `await` is what made an unawaited `result.fold(...)` fatal: the
/// handler returned before the callback resumed, so the `emit` landed after
/// completion and bloc asserted —
/// `emit was called after an event handler completed normally`. The `update`
/// state never arrived, and because the job board dismisses its loading dialog
/// on `update`, the screen locked up behind a spinner.
///
/// The assertion fires asynchronously, so it is not enough to check that
/// nothing threw: these tests assert the state actually arrives.

/// Forwards every un-stubbed member to `noSuchMethod` so the fake only has to
/// declare what the accept flow touches — `UserRepository` has ~30 members.
class _FakeUserRepository implements UserRepository {
  _FakeUserRepository({required this.acceptResult});

  final Either<ErrorResponse, AcceptResponse> acceptResult;
  int acceptCalls = 0;

  @override
  Future<Either<ErrorResponse, AcceptResponse>> acceptRide(
      {required int? id}) async {
    acceptCalls++;
    return acceptResult;
  }

  /// The handler schedules a refresh after emitting; it must not blow up.
  @override
  Future<Either<ErrorResponse, RideResponse>> getUpcomingRides(
          {required int? limit}) async =>
      right(const RideResponse(data: []));

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

/// Keeps writes in memory. Subclasses rather than implements so the real
/// `CacheManagerImpl` can be exercised unchanged.
class _FakeCacheManager extends CacheManager {
  final Map<String, String> written = {};

  @override
  Future<void> setInt(String key, String value) async => written[key] = value;

  @override
  Future<int?> getInt(String key) async => int.tryParse(written[key] ?? '');

  @override
  Future<void> remove(String key) async => written.remove(key);
}

void main() {
  late _FakeCacheManager cache;

  UpcomingRideBloc blocFor(_FakeUserRepository repo) =>
      UpcomingRideBloc(repo, CacheManagerImpl(cache));

  setUp(() => cache = _FakeCacheManager());

  /// Collects statuses for [window]. Long enough for the emit, short enough to
  /// finish before the handler's 600 ms refresh resets the state.
  Future<List<UpcomingRideStatus>> statusesAfterAccept(
    UpcomingRideBloc bloc, {
    Duration window = const Duration(milliseconds: 300),
  }) async {
    final seen = <UpcomingRideStatus>[];
    final sub = bloc.stream.listen((s) => seen.add(s.status));
    bloc.add(const UpcomingRideEvent.accept(id: 412));
    await Future.delayed(window);
    await sub.cancel();
    return seen;
  }

  group('accept succeeds', () {
    test('emits update after the cache write — not swallowed by the fold',
        () async {
      final repo = _FakeUserRepository(
        acceptResult: right(const AcceptResponse(id: 88, bookingId: 412)),
      );
      final bloc = blocFor(repo);

      final seen = await statusesAfterAccept(bloc);

      expect(repo.acceptCalls, 1);
      expect(
        seen,
        containsAllInOrder([
          UpcomingRideStatus.actionLoading,
          UpcomingRideStatus.update,
        ]),
        reason: 'update is what dismisses the job board loading dialog; '
            'if the fold is not awaited this emit never lands',
      );

      await bloc.close();
    });

    test('records the ride-session id, not the booking id', () async {
      // /location-tracking and /stop both take the session id. Posting the
      // booking id here put the wrong `ride_session_id` on every breadcrumb.
      final repo = _FakeUserRepository(
        acceptResult: right(const AcceptResponse(id: 88, bookingId: 412)),
      );
      final bloc = blocFor(repo);

      await statusesAfterAccept(bloc);

      expect(cache.written[Key.rideSessionId.keyValue], '88');
      await bloc.close();
    });

    test('a response with no id still reaches update', () async {
      // The cache write is skipped, but the instructor must not be left
      // staring at a spinner because of it.
      final repo = _FakeUserRepository(
        acceptResult: right(const AcceptResponse()),
      );
      final bloc = blocFor(repo);

      final seen = await statusesAfterAccept(bloc);

      expect(seen, contains(UpcomingRideStatus.update));
      expect(cache.written, isEmpty);
      await bloc.close();
    });
  });

  group('accept fails', () {
    test('emits error so the dialog is dismissed and the reason shown',
        () async {
      final repo = _FakeUserRepository(
        acceptResult: left(const ErrorResponse(
          statusCode: 400,
          message: 'Finish setting up your payout account.',
        )),
      );
      final bloc = blocFor(repo);

      final seen = await statusesAfterAccept(bloc);

      expect(
        seen,
        containsAllInOrder([
          UpcomingRideStatus.actionLoading,
          UpcomingRideStatus.error,
        ]),
      );
      expect(cache.written, isEmpty);
      await bloc.close();
    });
  });

  group('closing mid-flight', () {
    test('does not throw when the bloc closes during the refresh delay',
        () async {
      // The instructor can navigate away in the 600 ms between the emit and
      // the queued refresh; `add` on a closed bloc throws without the guard.
      final repo = _FakeUserRepository(
        acceptResult: right(const AcceptResponse(id: 88)),
      );
      final bloc = blocFor(repo);

      bloc.add(const UpcomingRideEvent.accept(id: 412));
      await Future.delayed(const Duration(milliseconds: 150));
      await bloc.close();

      // Outlive the handler's own 600 ms timer.
      await Future.delayed(const Duration(milliseconds: 700));
    });
  });
}
