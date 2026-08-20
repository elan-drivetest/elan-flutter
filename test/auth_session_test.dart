import 'package:cookie_jar/cookie_jar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/cache/key.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/data/service/cookie_refresh_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/refresh_error_response/refresh_error_response.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Cover for "stay logged in".
///
/// The reported bug was that instructors were signed out every time they closed
/// the app. Auth lives in httpOnly cookies the app cannot read, so the only way
/// to check a session is to spend a request — and the old code routed *every*
/// failure of that request to the login screen. Opening the app on a weak
/// connection therefore logged you out, permanently, because the interceptor
/// deleted the cookies on the way past.
///
/// The rule these pin down: only a 401/403 ends a session. Everything else is a
/// failure to ask, and a device with a stored session keeps it.

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository(this.refreshResult);

  final Either<RefreshErrorResponse, Response<dynamic>> refreshResult;
  int refreshCalls = 0;

  @override
  Future<Either<RefreshErrorResponse, Response<dynamic>>> refresh() async {
    refreshCalls++;
    return refreshResult;
  }

  /// Defaults to failing, because the interesting case is logging out while
  /// the server is unreachable.
  Either<ErrorResponse, Response<dynamic>> logOutResult = left(
      const ErrorResponse(statusCode: 0, message: 'No internet connection.'));
  int logOutCalls = 0;

  @override
  Future<Either<ErrorResponse, Response<dynamic>>> logOut() async {
    logOutCalls++;
    return logOutResult;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

class _FakeCacheManager extends CacheManager {
  final Map<String, String> written = {};

  @override
  Future<void> setBool(String key, bool value) async =>
      written[key] = value.toString();

  @override
  Future<bool?> getBool(String key) async {
    final v = written[key];
    if (v == null) return null;
    return v == 'true';
  }

  @override
  Future<void> remove(String key) async => written.remove(key);
}

/// Records whether the periodic refresh was armed, without running a timer.
class _SpyCookieRefreshService implements CookieRefreshService {
  int startCalls = 0;
  int stopCalls = 0;

  @override
  void startPeriodicRefresh() => startCalls++;

  @override
  void stopPeriodicRefresh() => stopCalls++;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeCookieJar implements PersistCookieJar {
  bool deleted = false;

  @override
  Future<void> deleteAll() async => deleted = true;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

Response<dynamic> _ok() =>
    Response(requestOptions: RequestOptions(path: '/'), statusCode: 200);

void main() {
  late _FakeCacheManager cache;
  late _SpyCookieRefreshService refreshService;
  late _FakeCookieJar jar;

  setUp(() {
    cache = _FakeCacheManager();
    refreshService = _SpyCookieRefreshService();
    jar = _FakeCookieJar();
  });

  AuthBloc blocFor(Either<RefreshErrorResponse, Response<dynamic>> result) =>
      AuthBloc(_FakeAuthRepository(result), jar, refreshService,
          CacheManagerImpl(cache));

  String? marker() => cache.written[Key.hasSession.keyValue];

  Future<AuthState> refreshAndSettle(AuthBloc bloc) async {
    bloc.add(const AuthEvent.refresh());
    await bloc.stream.firstWhere((s) => s.status != AuthStatus.loading);
    return bloc.state;
  }

  group('refresh succeeds', () {
    test('signs in, records the marker and arms the periodic refresh',
        () async {
      // The periodic refresh used to be started only by an interactive login,
      // so a session restored at launch never had one for the whole run.
      final bloc = blocFor(right(_ok()));

      final state = await refreshAndSettle(bloc);

      expect(state.status, AuthStatus.success);
      expect(state.status.isAuthenticated, isTrue);
      expect(marker(), 'true');
      expect(refreshService.startCalls, 1);

      await bloc.close();
    });
  });

  group('the server rejects the session', () {
    for (final code in [401, 403]) {
      test('$code ends it and drops the marker', () async {
        cache.written[Key.hasSession.keyValue] = 'true';
        final bloc = blocFor(left(RefreshErrorResponse(statusCode: code)));

        final state = await refreshAndSettle(bloc);

        expect(state.status, AuthStatus.refreshFailed);
        expect(state.status.isAuthenticated, isFalse);
        expect(marker(), isNull,
            reason: 'a rejected session must not be restored next launch');
        expect(refreshService.startCalls, 0);

        await bloc.close();
      });
    }
  });

  group('the request failed without an answer', () {
    // ApiErrorMapper stamps status_code 0 when there was no response at all.
    for (final code in [0, 500, 502, 503]) {
      test('$code keeps a stored session', () async {
        cache.written[Key.hasSession.keyValue] = 'true';
        final bloc = blocFor(left(RefreshErrorResponse(statusCode: code)));

        final state = await refreshAndSettle(bloc);

        expect(state.status, AuthStatus.restoredUnverified);
        expect(state.status.isAuthenticated, isTrue,
            reason: 'this is the whole bug — a network blip is not a logout');
        expect(marker(), 'true');

        await bloc.close();
      });
    }

    test('a null status code is also not a rejection', () async {
      cache.written[Key.hasSession.keyValue] = 'true';
      final bloc = blocFor(left(const RefreshErrorResponse()));

      expect(
          (await refreshAndSettle(bloc)).status, AuthStatus.restoredUnverified);

      await bloc.close();
    });

    test('with no stored session it still goes to login', () async {
      // Fresh install, or someone who has genuinely never signed in here.
      final bloc = blocFor(left(const RefreshErrorResponse(statusCode: 0)));

      final state = await refreshAndSettle(bloc);

      expect(state.status, AuthStatus.refreshFailed);
      expect(state.status.isAuthenticated, isFalse);

      await bloc.close();
    });
  });

  group('a non-200 success response', () {
    test('is treated as a failed refresh', () async {
      cache.written[Key.hasSession.keyValue] = 'true';
      final bloc = blocFor(right(Response(
          requestOptions: RequestOptions(path: '/'), statusCode: 204)));

      final state = await refreshAndSettle(bloc);

      expect(state.status, AuthStatus.refreshFailed);
      expect(marker(), isNull);

      await bloc.close();
    });
  });

  group('sessionEstablished', () {
    test('adopts the cookies the OTP endpoint just issued', () async {
      // Signup verification ends with issueAuthCookies server-side, so there is
      // nothing to fetch — the bloc only has to record and arm.
      final bloc = blocFor(right(_ok()));

      bloc.add(const AuthEvent.sessionEstablished());
      final state =
          await bloc.stream.firstWhere((s) => s.status != AuthStatus.initial);

      expect(state.status, AuthStatus.success);
      expect(marker(), 'true');
      expect(refreshService.startCalls, 1);

      await bloc.close();
    });
  });

  group('logout', () {
    test('always ends the session locally, even if the call fails', () async {
      // Emitting `error` here used to leave the instructor stuck: the router
      // only leaves the app on `logout` or `refreshFailed`, so a logout tapped
      // while offline did nothing at all.
      cache.written[Key.hasSession.keyValue] = 'true';
      final repo = _FakeAuthRepository(right(_ok()));
      final bloc = AuthBloc(repo, jar, refreshService, CacheManagerImpl(cache));

      bloc.add(const AuthEvent.logout());
      final state =
          await bloc.stream.firstWhere((s) => s.status == AuthStatus.logout);

      expect(state.status, AuthStatus.logout);
      expect(marker(), isNull);
      expect(jar.deleted, isTrue);
      expect(refreshService.stopCalls, 1);
      expect(repo.logOutCalls, 1, reason: 'the server is still told');

      await bloc.close();
    });
  });
}
