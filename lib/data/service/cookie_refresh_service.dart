import 'dart:async';
import 'dart:developer';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CookieRefreshService {
  final AuthRepository _authRepository;
  Timer? _refreshTimer;
  bool _isRefreshing = false;

  CookieRefreshService(this._authRepository);

  /// Start periodic cookie refresh every 14 minutes
  void startPeriodicRefresh() {
    // Cancel any existing timer
    stopPeriodicRefresh();

    log('🔄 Starting periodic cookie refresh (every 14 minutes)');

    // Start the timer
    _refreshTimer = Timer.periodic(const Duration(minutes: 14), (_) async {
      await _refreshCookies();
    });

    // Also do an immediate refresh to ensure cookies are fresh
    _refreshCookies();
  }

  /// Stop the periodic refresh timer
  void stopPeriodicRefresh() {
    if (_refreshTimer != null) {
      log('🛑 Stopping periodic cookie refresh');
      _refreshTimer?.cancel();
      _refreshTimer = null;
    }
  }

  /// Manually trigger a cookie refresh
  Future<void> _refreshCookies() async {
    if (_isRefreshing) {
      log('⏳ Cookie refresh already in progress, skipping...');
      return;
    }

    _isRefreshing = true;
    
    try {
      log('🔄 Refreshing authentication cookies...');
      final result = await _authRepository.refresh();
      
      result.fold(
        (error) {
          log('❌ Cookie refresh failed: ${error.message}');
        },
        (response) {
          log('✅ Cookies refreshed successfully at ${DateTime.now()}');
        },
      );
    } catch (e) {
      log('❌ Cookie refresh error: $e');
    } finally {
      _isRefreshing = false;
    }
  }

  /// Dispose the service
  void dispose() {
    stopPeriodicRefresh();
  }
}
