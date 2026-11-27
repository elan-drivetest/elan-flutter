import 'package:elan/core/styles.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/account_deletion_bloc/account_deletion_bloc.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// In-app account deletion (Google Play requirement).
///
/// Confirm → `DELETE /me` → `AuthEvent.accountDeleted()`. Navigation to login
/// is left to the router's redirect, which already reacts to
/// `AuthStatus.logout`.
class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountDeletionBloc>(),
      child: const _DeleteAccountView(),
    );
  }
}

class _DeleteAccountView extends StatelessWidget {
  const _DeleteAccountView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountDeletionBloc, AccountDeletionState>(
      listener: (context, state) {
        switch (state.status) {
          case AccountDeletionStatus.deleted:
            context.read<AuthBloc>().add(const AuthEvent.accountDeleted());
          case AccountDeletionStatus.blockedActiveRide:
            _snack(context,
                'Finish or transfer your upcoming rides before deleting your account.');
          case AccountDeletionStatus.error:
            _snack(
                context,
                state.errorMessage ??
                    'Could not delete your account. Please try again.');
          case AccountDeletionStatus.initial:
          case AccountDeletionStatus.deleting:
            break;
        }
      },
      builder: (context, state) {
        final busy = state.status == AccountDeletionStatus.deleting ||
            state.status == AccountDeletionStatus.deleted;
        return SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            onPressed: busy ? null : () => _confirm(context),
            icon: busy
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(Icons.delete_outline_rounded,
                    color: Colors.grey.shade500, size: 20),
            label: Text(
              busy ? 'Deleting account…' : 'Delete Account',
              style: sansMedium24(color: Colors.grey.shade600)
                  .copyWith(fontSize: 14),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete your account?'),
        content: const Text(
          'This permanently deletes your Elan Instructor account. Your profile, '
          'uploaded documents, vehicle details and ride location history will '
          'be deleted, and you will be signed out.\n\n'
          'Ride and payout records are kept as required for tax and legal '
          'purposes, and any earnings you are owed will still be paid. '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete account'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    context
        .read<AccountDeletionBloc>()
        .add(const AccountDeletionEvent.delete());
  }

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
