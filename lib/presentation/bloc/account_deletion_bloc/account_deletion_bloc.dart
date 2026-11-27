import 'package:bloc/bloc.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_deletion_event.dart';
part 'account_deletion_state.dart';
part 'account_deletion_bloc.freezed.dart';

/// Deletes the instructor's account (`DELETE /v1/auth/instructor/me`).
///
/// Google Play requires in-app account deletion. This bloc owns only the
/// request; on [AccountDeletionStatus.deleted] the UI hands off to
/// `AuthEvent.accountDeleted()`, which tears the local session down, so
/// session teardown keeps a single owner.
///
/// Deletion is refused while the instructor still has rides: locally when one
/// is being tracked on this device (no request is sent), and by the server
/// (422 `errors.account == "hasActiveRides"`) when any ride is scheduled or in
/// progress. Either way a customer would be left without their vehicle.
@injectable
class AccountDeletionBloc
    extends Bloc<AccountDeletionEvent, AccountDeletionState> {
  final AuthRepository repository;
  final CacheManagerImpl cacheManager;

  AccountDeletionBloc(this.repository, this.cacheManager)
      : super(const AccountDeletionState()) {
    on<_Delete>(_onDelete);
  }

  /// `ApiErrorMapper.humanizeBody` normalises every field error to a list, so
  /// the wire value `"hasActiveRides"` arrives as `["hasActiveRides"]`.
  static bool _hasActiveRides(Object? code) =>
      code == 'hasActiveRides' ||
      (code is List && code.contains('hasActiveRides'));

  Future<void> _onDelete(
      _Delete event, Emitter<AccountDeletionState> emit) async {
    if (state.status == AccountDeletionStatus.deleting) return;

    if (await cacheManager.getTrackableRideId() != null) {
      emit(state.copyWith(status: AccountDeletionStatus.blockedActiveRide));
      return;
    }

    emit(state.copyWith(
        status: AccountDeletionStatus.deleting, errorMessage: null));

    final result = await repository.deleteAccount();
    result.fold(
      (l) => emit(_hasActiveRides(l.errors?.account)
          ? state.copyWith(status: AccountDeletionStatus.blockedActiveRide)
          : state.copyWith(
              status: AccountDeletionStatus.error,
              errorMessage: l.message,
            )),
      (r) {
        final code = r.statusCode ?? 0;
        emit(code >= 200 && code < 300
            ? state.copyWith(status: AccountDeletionStatus.deleted)
            : state.copyWith(status: AccountDeletionStatus.error));
      },
    );
  }
}
