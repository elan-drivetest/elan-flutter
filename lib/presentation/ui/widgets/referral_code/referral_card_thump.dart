import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:elan/domain/referral_code_summary_response/referral_code_summary_response.dart';

class ReferralCardThump extends StatelessWidget {
  const ReferralCardThump({
    super.key,
    this.bottomView,
    this.titleText,
    this.amountText,
    this.subtitleText,
    this.peerClaim,
  });

  final Widget? bottomView;
  final String? titleText;
  final String? amountText;
  final String? subtitleText;
  final PeerClaim? peerClaim;

  @override
  Widget build(BuildContext context) {
    final displayTitle = titleText ?? (peerClaim != null ? 'Claim code and ' : 'Invite a friend and ');
    final displayAmount = amountText ?? (peerClaim != null ? 'get ৳${peerClaim!.bonusAmount ?? 0}' : 'get \$100 CAD');
    final displaySubtitle = subtitleText ?? (peerClaim != null ? ' credited to your account' : ' credited to both of your accounts');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFF4D8B55),
              image: DecorationImage(
                image: AssetImage('assets/image_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: sansMedium24(
                      color: Colors.white,
                    ).copyWith(height: 1.3),
                    children: [
                      TextSpan(text: displayTitle),
                      TextSpan(
                        text: displayAmount,
                        style: const TextStyle(
                          color: Color(0xFF90EE90), // A lighter, softer green that looks good on dark background
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: displaySubtitle),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Terms & Conditions Applied',
                  style: sansDevanagariMedium12(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: peerClaim != null ? _buildPeerClaimView(peerClaim!) : bottomView,
          ),
        ],
      ),
    );
  }

  Widget _buildPeerClaimView(PeerClaim code) {
    final int minRides = code.minRidesRequired ?? 5;
    final int completedRides = code.ridesAfterClaim ?? 0;
    final int remainingRides =
        (minRides - completedRides) > 0 ? (minRides - completedRides) : 0;
    final double progress = minRides > 0 ? (completedRides / minRides).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF4D8B55).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.directions_car, size: 20, color: Color(0xFF4D8B55)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Complete $minRides rides to redeem",
                style: sansDevanagariMedium16(color: Colors.black87),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: sansJpMedium14(color: Colors.grey.shade600),
            ),
            Text(
              '$completedRides / $minRides Rides',
              style: sansJpMedium14(color: Colors.black87).copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4D8B55)),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/car_logo.png',
              width: 32,
              height: 14,
              fit: BoxFit.fill,
              color: remainingRides > 0 ? Colors.grey : null, // greyed out if not unlocked
            ),
            const SizedBox(width: 8),
            Text(
              remainingRides > 0
                  ? "$remainingRides more rides to get your prize!"
                  : "Prize Unlocked! 🎉",
              style: sansDevanagariMedium16(
                color: remainingRides > 0 ? Colors.grey.shade700 : const Color(0xFF4D8B55),
              ).copyWith(fontWeight: remainingRides <= 0 ? FontWeight.bold : null),
            ),
          ],
        ),
      ],
    );
  }
}
