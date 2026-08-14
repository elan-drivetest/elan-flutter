import 'package:bloc/bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/referral_code_response/referral_code_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'generate_referral_code_event.dart';
part 'generate_referral_code_state.dart';
part 'generate_referral_code_bloc.freezed.dart';
part 'generate_referral_code_bloc.g.dart';

@injectable
class GenerateReferralCodeBloc
    extends Bloc<GenerateReferralCodeEvent, GenerateReferralCodeState> {
  final UserRepository repository;

  String? cursor;

  GenerateReferralCodeBloc(this.repository)
      : super(const GenerateReferralCodeState()) {
    on<_GetReferralCodes>(_onGetReferralCodes);
    on<_RefreshData>(_onRefreshData);
    on<_GenerateReferralCode>(_onGenerateReferralCode);
  }

  Future<void> _onGenerateReferralCode(
    _GenerateReferralCode event,
    Emitter<GenerateReferralCodeState> emit,
  ) async {
    AppLog.d('✨ Generating referral code with amount: ${event.amount}');
    emit(state.copyWith(status: GenerateReferralCodeStatus.actionLoading));

    final result = await repository.generateReferralCode(amount: event.amount);

    result.fold(
      (l) {
        AppLog.d('❌ Generate referral code failed: ${l.message}');
        emit(
          state.copyWith(
            errorResponse: l,
            status: GenerateReferralCodeStatus.generateError,
          ),
        );
      },
      (r) {
        AppLog.d('✅ Referral code generated successfully');
        emit(state.copyWith(status: GenerateReferralCodeStatus.generateSuccess));
        add(const GenerateReferralCodeEvent.refreshData());
      },
    );
  }

  Future<void> _onGetReferralCodes(
    _GetReferralCodes event,
    Emitter<GenerateReferralCodeState> emit,
  ) async {
    AppLog.d('📥 GetReferralCodes event triggered. Current status: ${state.status}, hasReachedMax: ${state.hasReachedMax}');
    if (state.hasReachedMax) return;

    if (state.data == null || state.data!.isEmpty) {
      if (state.status == GenerateReferralCodeStatus.initial ||
          state.status == GenerateReferralCodeStatus.error) {
        emit(state.copyWith(status: GenerateReferralCodeStatus.loading));
      }
    } else if (state.status == GenerateReferralCodeStatus.success) {
      emit(state.copyWith(status: GenerateReferralCodeStatus.paginating));
    }

    final result =
        await repository.getGenerateReferralCodes(cursor: cursor, limit: 50); // increased limit to 50 for now

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorResponse: l,
            hasReachedMax: false,
            status: GenerateReferralCodeStatus.error,
          ),
        );
      },
      (r) {
        final items = r.data ?? [];
        final hasMore = r.meta?.hasNextPage ?? false;

        final updatedData = [
          if (cursor != null) ...?state.data,
          ...items,
        ];

        emit(
          state.copyWith(
            data: updatedData,
            hasReachedMax: !hasMore,
            status: GenerateReferralCodeStatus.success,
          ),
        );

        cursor = r.meta?.nextCursor;
      },
    );
  }

  Future<void> _onRefreshData(
    _RefreshData event,
    Emitter<GenerateReferralCodeState> emit,
  ) async {
    AppLog.d('🔄 RefreshData event triggered');
    cursor = null;
    emit(state.copyWith(hasReachedMax: false));
    AppLog.d('🔄 Calling getReferralCodes for refresh...');
    add(const GenerateReferralCodeEvent.getReferralCodes());
  }
}
