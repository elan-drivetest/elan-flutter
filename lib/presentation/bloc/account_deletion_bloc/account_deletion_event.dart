part of 'account_deletion_bloc.dart';

@freezed
class AccountDeletionEvent with _$AccountDeletionEvent {
  /// Sent only after the instructor has confirmed in the dialog.
  const factory AccountDeletionEvent.delete() = _Delete;
}
