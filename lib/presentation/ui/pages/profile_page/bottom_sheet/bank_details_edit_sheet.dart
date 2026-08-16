import 'package:elan/core/styles.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankDetailsEditSheet extends StatelessWidget {
  final String? stripeCountry;
  final String? stripeAccountType;
  final String? stripeAccountStatus;
  final String? stripeAccountId;
  final PaymentInfoStatus paymentStatus;

  const BankDetailsEditSheet({
    super.key,
    required this.stripeAccountType,
    required this.stripeAccountStatus,
    required this.stripeAccountId,
    required this.stripeCountry,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                "Bank Details",
                style: sansMedium24(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Stripe account information",
                style: sansDevanagariRegular14(color: Colors.grey[600]!),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              _infoTile("Country", stripeCountry),
              const SizedBox(height: 12),
              _infoTile("Account Type", stripeAccountType),
              const SizedBox(height: 12),
              _infoTile("Account Status", stripeAccountStatus),
              const SizedBox(height: 12),
              _infoTile("Account ID", stripeAccountId),
              const SizedBox(height: 24),
              if (paymentStatus == PaymentInfoStatus.incomplete)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4D8B55),
                    fixedSize: const Size(double.maxFinite, 54),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<StripeOnboardingBloc>()
                        .add(StripeOnboardingEvent.onboardStripe());
                  },
                  child:
                      BlocBuilder<StripeOnboardingBloc, StripeOnboardingState>(
                          builder: (context, state) {
                    if (state.status == StripeOnboardingStatus.loading) {
                      return const Center(
                          child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ));
                    }
                    return Text(
                      "Update",
                      style: sansMedium24(color: Colors.white)
                          .copyWith(fontSize: 16),
                    );
                  }),
                ),
              if (paymentStatus == PaymentInfoStatus.complete)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    fixedSize: const Size(double.maxFinite, 54),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Close",
                    style: sansMedium24(color: Colors.white)
                        .copyWith(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: sansDevanagariBold14(color: Colors.grey[600]!),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Text(
            value?.isNotEmpty == true ? value! : "-",
            style: sansMedium24(color: Colors.black87).copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
