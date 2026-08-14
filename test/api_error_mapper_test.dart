import 'package:dio/dio.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/core/error/friendly_error_messages.dart';
import 'package:flutter_test/flutter_test.dart';

DioException _badResponse(dynamic body, int status) {
  final req = RequestOptions(path: '/');
  return DioException(
    requestOptions: req,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: req, data: body, statusCode: status),
  );
}

void main() {
  group('FriendlyErrorMessages.resolve', () {
    test('maps known codes', () {
      expect(FriendlyErrorMessages.resolve('notFound'),
          'We couldn\'t find an account with that email.');
      expect(FriendlyErrorMessages.resolve('otpExpired'),
          'This code has expired. Please request a new one.');
      expect(FriendlyErrorMessages.resolve('incorrectPassword'),
          'The email or password is incorrect.');
      expect(FriendlyErrorMessages.resolve('Booking already accepted'),
          'This booking has already been taken by another instructor.');
    });

    test('is case-insensitive', () {
      expect(FriendlyErrorMessages.resolve('NOTFOUND'),
          FriendlyErrorMessages.resolve('notFound'));
    });

    test('handles templated codes', () {
      expect(FriendlyErrorMessages.resolve('needLoginViaProvider:google'),
          contains('social sign-in'));
      expect(
          FriendlyErrorMessages.resolve('Unable to calculate distance: bad'),
          contains('calculate the ride distance'));
    });

    test('normalises class-validator messages', () {
      expect(FriendlyErrorMessages.resolve('email must be an email'),
          'Please enter a valid email address.');
      expect(FriendlyErrorMessages.resolve('password should not be empty'),
          'Password is required.');
      expect(
          FriendlyErrorMessages.resolve(
              'password must be longer than or equal to 6 characters'),
          'Password must be at least 6 characters.');
    });

    test('returns null for unknown', () {
      expect(FriendlyErrorMessages.resolve('some_random_code'), isNull);
    });
  });

  group('ApiErrorMapper.toAppError', () {
    test('field-scoped error keeps field + friendly message', () {
      final e = _badResponse({
        'errors': {
          'email': ['notFound']
        }
      }, 422);
      final err = ApiErrorMapper.toAppError(e);
      expect(err.field, 'email');
      expect(err.statusCode, 422);
      expect(err.message, 'We couldn\'t find an account with that email.');
      expect(err.code, 'notFound');
    });

    test('flat message body', () {
      final e = _badResponse({'message': 'Booking not found'}, 500);
      final err = ApiErrorMapper.toAppError(e);
      expect(err.message, 'This booking is no longer available.');
    });

    test('unknown code falls back to status text', () {
      final e = _badResponse({'message': 'weird_backend_thing'}, 403);
      final err = ApiErrorMapper.toAppError(e);
      expect(err.message, FriendlyErrorMessages.forStatus(403));
    });

    test('timeout -> friendly network copy', () {
      final e = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.receiveTimeout,
      );
      expect(ApiErrorMapper.toAppError(e).message,
          FriendlyErrorMessages.timeout);
    });

    test('connection error -> offline copy', () {
      final e = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.connectionError,
      );
      final err = ApiErrorMapper.toAppError(e);
      expect(err.isNetwork, isTrue);
      expect(err.message, FriendlyErrorMessages.network);
    });
  });

  group('ApiErrorMapper.humanizeBody', () {
    test('message is friendly; field lists stay raw for branching', () {
      final e = _badResponse({
        'errors': {
          'otp': ['otpExpired']
        }
      }, 422);
      final body = ApiErrorMapper.humanizeBody(e);
      expect(body['status_code'], 422);
      expect(body['message'], 'This code has expired. Please request a new one.');
      // Raw code preserved so UI branches (e.g. otpResendCooldown) keep working.
      expect((body['errors']['otp'] as List).first, 'otpExpired');
    });

    test('resolveField turns a raw code into friendly text', () {
      expect(ApiErrorMapper.resolveField('otpResendCooldown'),
          'Please wait a minute before requesting another code.');
    });

    test('message never leaks raw codes on unknown input', () {
      final e = _badResponse({'message': 'kaboom_internal'}, 500);
      final body = ApiErrorMapper.humanizeBody(e);
      expect(body['message'], isNot(contains('kaboom')));
    });
  });
}
