import 'package:dartz/dartz.dart';
import 'package:elan/data/repository/legal_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/legal/legal_status.dart';
import 'package:elan/presentation/bloc/legal_bloc/legal_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Instructors must accept the Privacy Policy, Terms of Service and Provider
/// Agreement before doing business. The server is the binding gate; these pin
/// the client's behaviour against Forge's contract.

LegalStatus _status({required bool privacyAccepted}) => LegalStatus.fromJson({
      'all_accepted': privacyAccepted,
      'required': [
        {
          'document': 'privacy_policy',
          'version': 'v1.1',
          'url': 'https://www.elanroadtestrental.ca/privacy',
          'accepted': privacyAccepted,
        },
        {
          'document': 'terms_of_service',
          'version': 'v1',
          'url': 'https://www.elanroadtestrental.ca/terms',
          'accepted': true,
        },
      ],
    });

class _FakeRepo implements LegalRepository {
  Either<ErrorResponse, LegalStatus> statusResult =
      right(_status(privacyAccepted: false));
  Either<ErrorResponse, LegalStatus> acceptResult =
      right(_status(privacyAccepted: true));
  List<LegalDocument>? accepted;
  int statusCalls = 0;

  @override
  Future<Either<ErrorResponse, LegalStatus>> getStatus() async {
    statusCalls++;
    return statusResult;
  }

  @override
  Future<Either<ErrorResponse, LegalStatus>> accept(
      List<LegalDocument> documents) async {
    accepted = documents;
    return acceptResult;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

void main() {
  late _FakeRepo repo;
  setUp(() => repo = _FakeRepo());

  Future<LegalState> settle(LegalBloc bloc, LegalEvent event) async {
    bloc.add(event);
    return bloc.stream.firstWhere((s) =>
        s.status != LegalStatusCode.loading &&
        s.status != LegalStatusCode.accepting);
  }

  test('parses the wire shape, including the "required" key', () {
    final s = _status(privacyAccepted: false);
    expect(s.documents, hasLength(2));
    expect(s.pending.single.document, 'privacy_policy');
    expect(s.pending.single.title, 'Privacy Policy');
  });

  test('an unaccepted document means the instructor must accept', () async {
    final bloc = LegalBloc(repo);
    final s = await settle(bloc, const LegalEvent.fetch());
    expect(s.status, LegalStatusCode.loaded);
    expect(s.mustAccept, isTrue);
    await bloc.close();
  });

  test('a 404 (endpoint not deployed) never gates the instructor', () async {
    repo.statusResult =
        left(const ErrorResponse(statusCode: 404, message: 'Not found'));
    final bloc = LegalBloc(repo);
    final s = await settle(bloc, const LegalEvent.fetch());
    expect(s.status, LegalStatusCode.unavailable);
    expect(s.mustAccept, isFalse);
    await bloc.close();
  });

  test('accepting sends only the pending documents at the server version',
      () async {
    final bloc = LegalBloc(repo);
    await settle(bloc, const LegalEvent.fetch());
    final s = await settle(bloc, const LegalEvent.accept());
    expect(repo.accepted!.map((d) => '${d.document}@${d.version}'),
        ['privacy_policy@v1.1']);
    expect(s.mustAccept, isFalse);
    await bloc.close();
  });

  test('a 409 legalVersionOutdated re-fetches instead of showing an error',
      () async {
    final bloc = LegalBloc(repo);
    await settle(bloc, const LegalEvent.fetch());
    repo.acceptResult = left(ErrorResponse.fromJson(const {
      'status_code': 409,
      'message': 'Conflict',
      'errors': {
        'legal': ['legalVersionOutdated']
      },
    }));
    final s = await settle(bloc, const LegalEvent.accept());
    expect(s.status, LegalStatusCode.loaded);
    expect(repo.statusCalls, 2);
    await bloc.close();
  });
}
