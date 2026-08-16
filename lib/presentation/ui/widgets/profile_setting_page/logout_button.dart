import 'package:elan/core/styles.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.logout) {
          context.go(PagesName.loginPage.path);
        } else if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to logout. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEvent.logout());
          },
          icon:
              Icon(Icons.logout_rounded, color: Colors.red.shade700, size: 20),
          label: Text(
            'Logout',
            style:
                sansMedium24(color: Colors.red.shade700).copyWith(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade50,
            foregroundColor: Colors.red.shade700,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
