import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class EmailConfirmationBottomSheet extends StatelessWidget {
  final EmailConfirmationStatus status;
  final String? message;
  final VoidCallback? onRetry;
  final VoidCallback? onClose;

  const EmailConfirmationBottomSheet({
    super.key,
    required this.status,
    this.message,
    this.onRetry,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indicator bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // Icon
          _buildIcon(),
          const SizedBox(height: 16),

          // Title
          Text(
            _getTitle(),
            style: sansMedium24(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Message
          Text(
            message ?? _getDefaultMessage(),
            style: sansJpMedium14(color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Action buttons
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    switch (status) {
      case EmailConfirmationStatus.loading:
        return const SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Color(0xFF4CAF50),
          ),
        );
      case EmailConfirmationStatus.success:
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            size: 48,
            color: Color(0xFF4CAF50),
          ),
        );
      case EmailConfirmationStatus.error:
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.red,
          ),
        );
    }
  }

  String _getTitle() {
    switch (status) {
      case EmailConfirmationStatus.loading:
        return 'Verifying Email';
      case EmailConfirmationStatus.success:
        return 'Email Confirmed!';
      case EmailConfirmationStatus.error:
        return 'Verification Failed';
    }
  }

  String _getDefaultMessage() {
    switch (status) {
      case EmailConfirmationStatus.loading:
        return 'Please wait while we confirm your email address...';
      case EmailConfirmationStatus.success:
        return 'Your email has been successfully verified. You can now login to your account.';
      case EmailConfirmationStatus.error:
        return 'We couldn\'t verify your email. The link may be expired or invalid.';
    }
  }

  Widget _buildActionButtons(BuildContext context) {
    if (status == EmailConfirmationStatus.loading) {
      return const SizedBox.shrink();
    }

    if (status == EmailConfirmationStatus.success) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onClose?.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Continue to Login',
            style: sansJpMedium14(color: Colors.white).copyWith(fontSize: 16),
          ),
        ),
      );
    }

    // Error state - show retry and close buttons
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onRetry?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Try Again',
              style: sansJpMedium14(color: Colors.white).copyWith(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              onClose?.call();
            },
            child: Text(
              'Close',
              style: sansJpMedium14(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

enum EmailConfirmationStatus {
  loading,
  success,
  error,
}
