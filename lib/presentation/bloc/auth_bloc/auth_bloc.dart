import 'package:bloc/bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/data/service/cookie_refresh_service.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';

/// Owns the session.
///
/// The rule this bloc enforces: **only the server ends a session.** Auth lives
/// in httpOnly cookies the app cannot read, so the only way to test a session
/// is to spend a request on it — and that request can fail for reasons that say
/// nothing about whether the instructor is signed in. Treating those failures
/// as a logout is what made the app sign people out every time they reopened it
/// on a weak connection.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final PersistCookieJar cookieJar;
  final CookieRefreshService cookieRefreshService;
  final CacheManagerImpl cacheManager;

  AuthBloc(
    this.repository,
    this.cookieJar,
    this.cookieRefreshService,
    this.cacheManager,
  ) : super(const AuthState()) {
    on<_Login>(_onLogin);
    on<_Refresh>(_onRefresh);
    on<_Logout>(_onLogout);
    on<_SessionEstablished>(_onSessionEstablished);
  }

  /// Status codes that are a statement about *this session* rather than about
  /// the network. Everything else — 0 (no response, stamped by
  /// [ApiErrorMapper]), timeouts, 5xx — means we failed to ask.
  static bool _isSessionRejected(int? statusCode) =>
      statusCode == 401 || statusCode == 403;

  /// Adopt a session the server has just handed us.
  Future<void> _adoptSession() async {
    await cacheManager.setHasSession();
    cookieRefreshService.startPeriodicRefresh();
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await repository.login(
      email: event.email,
      password: event.password,
    );

    await result.fold(
      (l) async {
        if (emit.isDone) return;
        emit(state.copyWith(
            status: AuthStatus.error,
            errorResponse: l,
            statusCode: l.statusCode));
      },
      (r) async {
        if (r.statusCode != 200) {
          if (emit.isDone) return;
          emit(state.copyWith(status: AuthStatus.error));
          return;
        }
        await _adoptSession();
        if (emit.isDone) return;
        emit(state.copyWith(
            status: AuthStatus.success, statusCode: r.statusCode));
      },
    );
  }

  /// Dumps what the cookie jar is actually holding for the API host.
  ///
  /// Debug-only (`AppLog` no-ops in release). This exists because "signed out
  /// on relaunch" has two very different causes that look identical from the
  /// UI — the cookies were not persisted, or they were persisted and the server
  /// rejected them — and the expiry printed here separates them immediately. A
  /// refresh cookie whose `expires` is seconds rather than weeks after login
  /// points at the server's cookie maxAge, not at the app.
  Future<void> _logStoredCookies() async {
    try {
      final cookies =
          await cookieJar.loadForRequest(Uri.parse(ApiEndpoints.baseUrl));
      if (cookies.isEmpty) {
        AppLog.d('auth: no cookies stored for ${ApiEndpoints.baseUrl}');
        return;
      }
      for (final c in cookies) {
        AppLog.d('auth: cookie ${c.name} expires=${c.expires} '
            'maxAge=${c.maxAge} secure=${c.secure}');
      }
    } catch (e) {
      AppLog.d('auth: could not read cookie jar -> $e');
    }
  }

  Future<void> _onRefresh(_Refresh event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.loading));

    await _logStoredCookies();
    final result = await repository.refresh();

    await result.fold(
      (l) async {
        // The session is only over if the server said so. Anything else and we
        // fall back to the marker: a device that has signed in before keeps its
        // session, and the first genuinely rejected request will end it via
        // CookieRefreshInterceptor.
        if (_isSessionRejected(l.statusCode)) {
          AppLog.d('auth: server rejected the session (${l.statusCode})');
          await cacheManager.clearHasSession();
          if (emit.isDone) return;
          emit(state.copyWith(
              status: AuthStatus.refreshFailed, statusCode: l.statusCode));
          return;
        }

        AppLog.d('auth: refresh failed with ${l.statusCode} (not a rejection)');
        final hasSession = await cacheManager.getHasSession();
        if (emit.isDone) return;
        emit(state.copyWith(
          status: hasSession
              ? AuthStatus.restoredUnverified
              : AuthStatus.refreshFailed,
          statusCode: l.statusCode,
        ));
      },
      (r) async {
        if (r.statusCode != 200) {
          await cacheManager.clearHasSession();
          if (emit.isDone) return;
          emit(state.copyWith(status: AuthStatus.refreshFailed));
          return;
        }
        // Previously the periodic refresh only started after an interactive
        // login, so a session restored at launch never had one — the app then
        // leaned entirely on 401-and-retry for the rest of the run.
        await _adoptSession();
        if (emit.isDone) return;
        emit(state.copyWith(
            status: AuthStatus.success, statusCode: r.statusCode));
      },
    );
  }

  Future<void> _onSessionEstablished(
      _SessionEstablished event, Emitter<AuthState> emit) async {
    await _adoptSession();
    if (emit.isDone) return;
    emit(state.copyWith(status: AuthStatus.success, statusCode: 200));
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState());

    cookieRefreshService.stopPeriodicRefresh();
    await cacheManager.clearHasSession();

    // Best-effort: tell the server, but do not let its answer decide whether
    // the instructor gets logged out locally. Emitting `error` here — which is
    // what this used to do when the call failed — left them staring at a
    // logout button that did nothing, because the router only leaves the app
    // on `logout` or `refreshFailed`. Tapping logout always logs you out.
    final result = await repository.logOut();
    try {
      await cookieJar.deleteAll();
    } catch (_) {}

    if (emit.isDone) return;
    final statusCode = result.fold((l) => l.statusCode, (r) => r.statusCode);
    emit(state.copyWith(status: AuthStatus.logout, statusCode: statusCode));
  }
}
