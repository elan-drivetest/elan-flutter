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
          onPressed: () {
            // For now, we reuse the logout event as the delete account API is not yet implemented
            context.read<AuthBloc>().add(const AuthEvent.logout());
          },
          icon: Icon(Icons.delete_outline_rounded, color: Colors.grey.shade500, size: 20),
          label: Text(
            'Delete Account',
            style: sansMedium24(color: Colors.grey.shade600).copyWith(fontSize: 14),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}