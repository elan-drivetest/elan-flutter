import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';

class CookieRefreshInterceptor extends Interceptor {
  final PersistCookieJar cookieJar;
  late Dio _dio;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  CookieRefreshInterceptor(this.cookieJar);

  void bindDio(Dio dio) {
    _dio = dio;
  }

  bool _isLoggingOut = false;

  /// The server has spoken about *this session*, as opposed to failing to
  /// answer. Only these end it.
  static bool _isRejection(int? statusCode) =>
      statusCode == 401 || statusCode == 403;

  void _handleUnauthorized() async {
    if (_isLoggingOut) return;
    _isLoggingOut = true;

    log('⚠️ Unauthorized! Clearing session and redirecting to login.');
    try {
      await cookieJar.deleteAll();
    } catch (e) {
      log('⚠️ Error clearing cookies: $e');
    }
    // Drop the marker too, or the next launch would restore a session the
    // server has already rejected (see Key.hasSession).
    try {
      await getIt<CacheManagerImpl>().clearHasSession();
    } catch (e) {
      log('⚠️ Error clearing session marker: $e');
    }
    getIt<AuthBloc>().add(const AuthEvent.logout());

    // Navigation is handled by the BlocListener in splash_page / global redirect.
    // Calling router.go() here causes a race condition with GoRouter's redirect chain.

    // Reset flag after a delay to allow the app to transition
    Future.delayed(const Duration(seconds: 3), () {
      _isLoggingOut = false;
    });
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == 401;
    final isRefresh =
        err.requestOptions.path.contains(ApiEndpoints.refreshCookieUrl);

    if (!is401 || isRefresh) {
      if (is401 && isRefresh) {
        _handleUnauthorized();
      }
      return handler.next(err);
    }

    try {
      if (_isRefreshing) {
        await _refreshCompleter?.future;
      } else {
        _isRefreshing = true;
        _refreshCompleter = Completer<void>();

        log('🔄 Interceptor refresh');

        final res = await _dio.post(
          ApiEndpoints.refreshCookieUrl,
          options: Options(
            validateStatus: (s) => s != null && s < 500,
          ),
        );

        if (res.statusCode == 200) {
          log('✅ Interceptor refresh success');
          _refreshCompleter?.complete();
        } else {
          log('⚠️ Refresh failed (${res.statusCode})');
          _refreshCompleter?.complete();
          // validateStatus lets anything under 500 through, so this branch sees
          // 4xx as well as the 401 we care about. A 429 or a transient 4xx is
          // not a reason to destroy the session.
          if (_isRejection(res.statusCode)) {
            _handleUnauthorized();
          }
          return handler.next(err);
        }
      }

      final retry = await _dio.fetch(err.requestOptions);
      return handler.resolve(retry);
    } catch (e) {
      _refreshCompleter?.complete();
      // Only a rejection ends the session. This used to call
      // _handleUnauthorized() for *any* thrown error, so one dropped
      // connection during a retry deleted the cookies and signed the
      // instructor out mid-session.
      if (e is DioException && _isRejection(e.response?.statusCode)) {
        _handleUnauthorized();
      } else {
        log('⚠️ Refresh could not complete (${e.runtimeType}); keeping session');
      }
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }
}
