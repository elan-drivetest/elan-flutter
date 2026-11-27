part of 'account_deletion_bloc.dart';

enum AccountDeletionStatus {
  initial,
  deleting,
  deleted,

  /// The instructor still has a scheduled or in-progress ride.
  blockedActiveRide,
  error,
}

@freezed
class AccountDeletionState with _$AccountDeletionState {
  const factory AccountDeletionState({
    @Default(AccountDeletionStatus.initial) AccountDeletionStatus status,
    String? errorMessage,
  }) = _AccountDeletionState;
}
