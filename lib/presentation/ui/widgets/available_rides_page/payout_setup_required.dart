import 'package:elan/core/app_colors.dart';
import 'package:elan/core/payout_readiness.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Shown in place of the job board when accepting would be rejected anyway.
///
/// Replaces a list of jobs the instructor cannot take with the one action that
/// unblocks them. See [PayoutReadiness] for why only two states get here.
class PayoutSetupRequired extends StatelessWidget {
  const PayoutSetupRequired({super.key, required this.readiness});

  final PayoutReadiness readiness;

  bool get _isPending => readiness == PayoutReadiness.pendingVerification;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: RideCardColors.link.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isPending ? Icons.hourglass_top : Icons.account_balance,
                size: 34,
                color: RideCardColors.link,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isPending ? 'Payouts under review' : 'Set up payouts first',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _isPending
                  ? 'Stripe is still reviewing your account. Jobs appear here '
                      'as soon as payouts are enabled — nothing else is needed '
                      'from you unless Stripe asks.'
                  : 'Rides are hidden until you can be paid for them. Connect '
                      'your bank through Stripe and the job board opens up.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<StripeOnboardingBloc, StripeOnboardingState>(
              builder: (context, state) {
                final busy = state.status == StripeOnboardingStatus.loading;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: busy
                        ? null
                        : () => context
                            .read<StripeOnboardingBloc>()
                            .add(StripeOnboardingEvent.onboardStripe()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RideCardColors.link,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: busy
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            _isPending
                                ? 'Review payout details'
                                : 'Set up payouts',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => context.push(PagesName.profilePage.path),
              child: Text(
                'Go to profile',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
