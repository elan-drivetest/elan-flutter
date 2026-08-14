import 'friendly_error_messages.dart';

/// A single, user-safe representation of any failure in the app.
///
/// [message] is always safe to show to a user. [code] and [statusCode] are
/// kept for logging / conditional UI (e.g. redirect to login on 401).
class AppError {
  /// User-friendly, display-ready message.
  final String message;

  /// Raw backend code/message (for logs & branching). May be null.
  final String? code;

  /// HTTP status if the failure came from the server.
  final int? statusCode;

  /// The field the error relates to, when the backend scoped it (e.g. `email`).
  final String? field;

  /// True when the failure was connectivity/timeout rather than a server reply.
  final bool isNetwork;

  const AppError({
    required this.message,
    this.code,
    this.statusCode,
    this.field,
    this.isNetwork = false,
  });

  /// Whether the user should be signed out / sent to login.
  bool get isAuth => statusCode == 401;

  factory AppError.network() => const AppError(
        message: FriendlyErrorMessages.network,
        isNetwork: true,
      );

  factory AppError.timeout() => const AppError(
        message: FriendlyErrorMessages.timeout,
        isNetwork: true,
      );

  factory AppError.generic([int? status]) => AppError(
        message: FriendlyErrorMessages.forStatus(status),
        statusCode: status,
      );

  AppError copyWith({String? message, String? code, int? statusCode, String? field}) =>
      AppError(
        message: message ?? this.message,
        code: code ?? this.code,
        statusCode: statusCode ?? this.statusCode,
        field: field ?? this.field,
        isNetwork: isNetwork,
      );

  @override
  String toString() =>
      'AppError(message: $message, code: $code, status: $statusCode, field: $field)';
}
