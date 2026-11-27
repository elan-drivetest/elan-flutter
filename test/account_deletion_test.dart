import 'package:cookie_jar/cookie_jar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/cache/cache_manager.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/cache/key.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/data/service/cookie_refresh_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/presentation/bloc/account_deletion_bloc/account_deletion_bloc.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// In-app account deletion is a Google Play requirement. The button used to
/// dispatch a plain logout, which deleted nothing.

class _FakeAuthRepository implements AuthRepository {
  Either<ErrorResponse, Response<dynamic>> deleteResult = right(_status(204));
  int deleteCalls = 0;

  @override
  Future<Either<ErrorResponse, Response<dynamic>>> deleteAccount() async {
    deleteCalls++;
    return deleteResult;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

/// In-memory stand-in for the secure-storage-backed [CacheManager].
class _MemoryCache extends CacheManager {
  final Map<String, String> store = {};

  @override
  Future<void> setString(String key, String value) async => store[key] = value;
  @override
  Future<void> setInt(String key, String value) async => store[key] = value;
  @override
  Future<void> setBool(String key, bool value) async =>
      store[key] = value.toString();
  @override
  Future<String?> getString(String key) async => store[key];
  @override
  Future<int?> getInt(String key) async =>
      store[key] == null ? null : int.tryParse(store[key]!);
  @override
  Future<bool?> getBool(String key) async =>
      store[key] == null ? null : store[key] == 'true';
  @override
  Future<void> remove(String key) async => store.remove(key);
  @override
  Future<void> clearAll() async => store.clear();
}

class _SpyRefresh implements CookieRefreshService {
  int stopCalls = 0;
  @override
  void stopPeriodicRefresh() => stopCalls++;
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeJar implements PersistCookieJar {
  bool deleted = false;
  @override
  Future<void> deleteAll() async => deleted = true;
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

Response<dynamic> _status(int code) =>
    Response(requestOptions: RequestOptions(path: '/'), statusCode: code);

void main() {
  late _FakeAuthRepository repo;
  late _MemoryCache cache;
  late CacheManagerImpl cacheImpl;

  setUp(() {
    repo = _FakeAuthRepository();
    cache = _MemoryCache();
    cacheImpl = CacheManagerImpl(cache);
  });

  Future<AccountDeletionState> deleteAndSettle() async {
    final bloc = AccountDeletionBloc(repo, cacheImpl);
    bloc.add(const AccountDeletionEvent.delete());
    final settled = await bloc.stream
        .firstWhere((s) => s.status != AccountDeletionStatus.deleting);
    await bloc.close();
    return settled;
  }

  group('AccountDeletionBloc', () {
    test('a 204 from DELETE /me ends in deleted', () async {
      final s = await deleteAndSettle();
      expect(s.status, AccountDeletionStatus.deleted);
      expect(repo.deleteCalls, 1);
    });

    test('a server error surfaces its message and keeps the account',
        () async {
      repo.deleteResult = left(const ErrorResponse(
          statusCode: 500, message: 'Something went wrong on our side.'));
      final s = await deleteAndSettle();
      expect(s.status, AccountDeletionStatus.error);
      expect(s.errorMessage, 'Something went wrong on our side.');
    });

    test('a 422 hasActiveRides from the server reads as blocked, not error',
        () async {
      repo.deleteResult = left(const ErrorResponse(
          statusCode: 422,
          message: 'Unprocessable',
          errors: Errors(account: 'hasActiveRides')));
      final s = await deleteAndSettle();
      expect(s.status, AccountDeletionStatus.blockedActiveRide);
    });

    test('...including the list form humanizeBody actually produces',
        () async {
      repo.deleteResult = left(ErrorResponse.fromJson(const {
        'status_code': 422,
        'message': 'Unprocessable',
        'errors': {
          'account': ['hasActiveRides']
        },
      }));
      final s = await deleteAndSettle();
      expect(s.status, AccountDeletionStatus.blockedActiveRide);
    });

    test('is refused while a ride is being tracked, without calling the API',
        () async {
      await cacheImpl.setTrackableRideId(rideId: '42');
      final s = await deleteAndSettle();
      expect(s.status, AccountDeletionStatus.blockedActiveRide);
      expect(repo.deleteCalls, 0);
    });
  });

  group('AuthEvent.accountDeleted', () {
    test('wipes account data and cookies but keeps the onboarding flag',
        () async {
      await cacheImpl.setHasSession();
      await cacheImpl.setHasSeenOnboarding();
      await cacheImpl.setActiveBooking(rawJson: '{"customer":"pii"}');
      await cacheImpl.setPendingLocationPings(rawJson: '[]');

      final jar = _FakeJar();
      final refresh = _SpyRefresh();
      final bloc = AuthBloc(_FakeAuthRepository(), jar, refresh, cacheImpl);
      bloc.add(const AuthEvent.accountDeleted());
      final s =
          await bloc.stream.firstWhere((s) => s.status == AuthStatus.logout);
      await bloc.close();

      expect(s.status, AuthStatus.logout);
      expect(jar.deleted, isTrue);
      expect(refresh.stopCalls, 1);
      expect(await cacheImpl.getHasSession(), isFalse);
      expect(await cacheImpl.getActiveBooking(), isNull);
      expect(cache.store[Key.pendingLocationPings.keyValue], isNull);
      expect(await cacheImpl.getHasSeenOnboarding(), isTrue);
    });
  });
}
