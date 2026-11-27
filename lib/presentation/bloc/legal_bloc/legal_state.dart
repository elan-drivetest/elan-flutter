part of 'legal_bloc.dart';

enum LegalStatusCode {
  initial,
  loading,
  loaded,
  accepting,

  /// The endpoint doesn't exist on this backend yet (404). Don't gate.
  unavailable,
  error,
}

@freezed
class LegalState with _$LegalState {
  const LegalState._();

  const factory LegalState({
    @Default(LegalStatusCode.initial) LegalStatusCode status,
    LegalStatus? legal,
    String? errorMessage,
  }) = _LegalState;

  /// True only when the server positively says something is unaccepted.
  bool get mustAccept => legal != null && !legal!.allAccepted;
}
