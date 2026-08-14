import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// App-wide logger. Debug-only: no output in release builds, so logs never
/// leak to production and cost nothing at runtime.
///
/// Replaces raw `print`/`debugPrint`. Prefer [e] for failures so the error and
/// stack trace are attached instead of string-interpolated.
class AppLog {
  const AppLog._();

  static void d(Object? message, {String name = 'elan'}) {
    if (kDebugMode) developer.log('$message', name: name);
  }

  static void e(
    Object? message, {
    Object? error,
    StackTrace? stack,
    String name = 'elan',
  }) {
    if (kDebugMode) {
      developer.log('$message', name: name, error: error, stackTrace: stack);
    }
  }
}
