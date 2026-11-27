part of 'legal_bloc.dart';

@freezed
class LegalEvent with _$LegalEvent {
  const factory LegalEvent.fetch() = _Fetch;

  /// Accepts every pending document at its server-reported version.
  const factory LegalEvent.accept() = _Accept;
}
