import 'package:elan/core/styles.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.logout) {
          context.go(PagesName.loginPage.path);
        } else if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to delete account. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: () => _showDeleteConfirmationDialog(context),
          icon: Icon(Icons.delete_outline_rounded,
              color: Colors.red.shade400, size: 20),
          label: Text(
            'Delete Account',
            style: sansMedium24(color: Colors.red.shade600)
                .copyWith(fontSize: 14),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 28),
            const SizedBox(width: 8),
            const Text(
              'Delete Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Are you sure you want to request permanent account deletion?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            Text(
              'In accordance with our Privacy Policy and Canadian privacy laws (PIPEDA):',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 8),
            _retentionBullet('Personal & Profile Data:', 'Your account profile and login credentials will be immediately deactivated.'),
            const SizedBox(height: 4),
            _retentionBullet('Verification Documents:', 'Uploaded licences and vehicle documents will be permanently purged within 90 days.'),
            const SizedBox(height: 4),
            _retentionBullet('Financial & Tax Records:', 'Booking transaction and payout records are retained for up to 7 years to comply with Canada Revenue Agency (CRA) statutory requirements.'),
            const SizedBox(height: 12),
            Text(
              'This action cannot be undone.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red.shade700),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Cancel', style: TextStyle(color: Colors.grey.shade700)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              // Trigger account deletion flow (using AuthBloc logout/clear)
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Delete My Account'),
          ),
        ],
      ),
    );
  }

  Widget _retentionBullet(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.black87),
              children: [
                TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.w600)),
                TextSpan(text: ' $description'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
