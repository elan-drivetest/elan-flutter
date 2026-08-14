import 'dart:convert';

import 'package:dio/dio.dart';

import 'app_error.dart';
import 'friendly_error_messages.dart';

/// Translates raw transport/backend failures into user-friendly form.
///
/// Two entry points:
///  * [toAppError] — for new call sites that want a single [AppError] object.
///  * [humanizeBody] — returns a friendly-ized JSON map that can be fed into
///    the app's existing `*ErrorResponse.fromJson`, so friendly text lands in
///    `message` AND in per-field `errors[...]` lists with no model changes.
class ApiErrorMapper {
  const ApiErrorMapper._();

  /// Map any [DioException] to a display-ready [AppError].
  static AppError toAppError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppError.timeout();
      case DioExceptionType.connectionError:
        return AppError.network();
      case DioExceptionType.cancel:
        return const AppError(message: 'Request cancelled.');
      case DioExceptionType.badCertificate:
        return const AppError(
            message: 'A secure connection couldn\'t be established.');
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        if (err.response == null && _isLikelyNetwork(err)) {
          return AppError.network();
        }
        return _fromResponse(
          err.response?.data,
          err.response?.statusCode,
        );
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  /// Produce a JSON body for the existing typed error models.
  ///
  /// The top-level `message` is always friendly / display-ready. The per-field
  /// `errors[...]` lists are kept as the RAW backend codes on purpose, because
  /// some call sites branch on them (e.g. `userIsNotActive`, `otpResendCooldown`).
  /// Resolve those to friendly text at display time with
  /// [FriendlyErrorMessages.resolve] (see [resolveField]).
  static Map<String, dynamic> humanizeBody(DioException err) {
    final appError = toAppError(err);
    final status = err.response?.statusCode ?? appError.statusCode ?? 0;

    final map = _asMap(err.response?.data);
    final result = <String, dynamic>{
      'status_code': status,
      'statusCode': status,
      'message': appError.message,
    };

    // Pass field errors through untouched (raw codes) so callers can branch
    // on them; display code resolves them to friendly text.
    final rawErrors = map?['errors'];
    if (rawErrors is Map) {
      final passthrough = <String, dynamic>{};
      rawErrors.forEach((key, value) {
        final list = _normalizeList(value);
        if (list.isNotEmpty) passthrough[key.toString()] = list;
      });
      if (passthrough.isNotEmpty) result['errors'] = passthrough;
    }

    return result;
  }

  /// Resolve a raw field code (as stored in `errors[...]`) to friendly text.
  /// Returns null when [raw] is null/empty so callers can fall back.
  static String? resolveField(String? raw) => FriendlyErrorMessages.resolve(raw);

  // ---- internals ----

  static AppError _fromResponse(dynamic data, int? status) {
    final map = _asMap(data);

    if (map != null) {
      // Field-scoped errors: `{ "errors": { "email": ["notFound"] } }`.
      final errors = map['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final field = errors.keys.first.toString();
        final rawList = _normalizeList(errors[field]);
        final rawCode = rawList.isNotEmpty ? rawList.first : null;
        final friendly = FriendlyErrorMessages.resolve(rawCode) ??
            FriendlyErrorMessages.forStatus(status);
        return AppError(
          message: friendly,
          code: rawCode,
          field: field,
          statusCode: status,
        );
      }

      // Flat message: `{ "message": "Booking not found" }`.
      final rawMessage = map['message']?.toString();
      final friendly = FriendlyErrorMessages.resolve(rawMessage) ??
          FriendlyErrorMessages.forStatus(status);
      return AppError(
        message: friendly,
        code: rawMessage,
        statusCode: status,
      );
    }

    // Non-JSON / plain string body.
    if (data is String && data.trim().isNotEmpty) {
      final friendly = FriendlyErrorMessages.resolve(data) ??
          FriendlyErrorMessages.forStatus(status);
      return AppError(message: friendly, code: data, statusCode: status);
    }

    return AppError.generic(status);
  }

  static Map<String, dynamic>? _asMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return data.map((k, v) => MapEntry(k.toString(), v));
    if (data is String && data.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map) {
          return decoded.map((k, v) => MapEntry(k.toString(), v));
        }
      } catch (_) {}
    }
    return null;
  }

  static List<String> _normalizeList(dynamic value) {
    if (value == null) return const [];
    if (value is String) return value.trim().isEmpty ? const [] : [value];
    if (value is List) {
      return value
          .where((e) => e != null)
          .map((e) => e.toString())
          .where((e) => e.trim().isNotEmpty)
          .toList();
    }
    return [value.toString()];
  }

  static bool _isLikelyNetwork(DioException err) {
    final msg = err.message?.toLowerCase() ?? '';
    return err.error is Exception &&
        (msg.contains('socket') ||
            msg.contains('network') ||
            msg.contains('failed host lookup') ||
            msg.contains('connection'));
  }
}
