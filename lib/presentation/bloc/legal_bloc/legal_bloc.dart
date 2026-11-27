import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/legal_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/legal/legal_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'legal_event.dart';
part 'legal_state.dart';
part 'legal_bloc.freezed.dart';

/// Whether the instructor has accepted the current Privacy Policy, Terms of
/// Service and Provider Agreement, and records acceptance.
///
/// Fails **open** on the client: if `/legal/status` is missing (404 before the
/// backend deploy) or unreachable, nothing is gated here, so a client that
/// can't ask never strands an instructor. The binding gate is meant to be
/// server-side (403 `legalAcceptanceRequired` on ride accept and Stripe
/// onboarding), but it's behind the `legal_enforcement_enabled` setting, which
/// was OFF on 2026-11-27. Until it's on, this client gate is the only one.
@injectable
class LegalBloc extends Bloc<LegalEvent, LegalState> {
  final LegalRepository repository;

  LegalBloc(this.repository) : super(const LegalState()) {
    on<_Fetch>(_onFetch);
    on<_Accept>(_onAccept);
  }

  static bool _isCode(ErrorResponse e, String code) {
    final v = e.errors?.legal;
    return v == code || (v is List && v.contains(code));
  }

  /// The server's gate (403 on ride accept and Stripe onboarding). Callers
  /// should re-fetch, which re-opens the acceptance screen.
  static bool isAcceptanceRequired(ErrorResponse? e) =>
      e != null && _isCode(e, 'legalAcceptanceRequired');

  Future<void> _onFetch(_Fetch event, Emitter<LegalState> emit) async {
    emit(state.copyWith(status: LegalStatusCode.loading));
    final result = await repository.getStatus();
    result.fold(
      (l) => emit(state.copyWith(
        status: l.statusCode == 404
            ? LegalStatusCode.unavailable
            : LegalStatusCode.error,
        errorMessage: l.message,
      )),
      (r) => emit(state.copyWith(status: LegalStatusCode.loaded, legal: r)),
    );
  }

  Future<void> _onAccept(_Accept event, Emitter<LegalState> emit) async {
    final pending = state.legal?.pending ?? const <LegalDocument>[];
    if (pending.isEmpty || state.status == LegalStatusCode.accepting) return;

    emit(state.copyWith(status: LegalStatusCode.accepting, errorMessage: null));
    final result = await repository.accept(pending);
    await result.fold(
      (l) async {
        if (_isCode(l, 'legalVersionOutdated')) {
          // A document changed while the screen was open: show the new set.
          await _onFetch(const _Fetch(), emit);
          return;
        }
        emit(state.copyWith(
          status: LegalStatusCode.error,
          errorMessage: l.message,
        ));
      },
      (r) async =>
          emit(state.copyWith(status: LegalStatusCode.loaded, legal: r)),
    );
  }
}
