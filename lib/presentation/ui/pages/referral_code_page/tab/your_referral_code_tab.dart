import 'package:elan/core/extension/money.dart';
import 'package:elan/core/extension/pricing_config_extension.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/domain/referral_code_response/referral_code_response.dart';
import 'package:elan/presentation/bloc/generate_referral_code_bloc/generate_referral_code_bloc.dart';
import 'package:elan/presentation/ui/widgets/referral_code/referral_card_thump.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elan/presentation/ui/extension/skeletonizer_extension.dart';
class YourReferralCodeTab extends StatelessWidget {
  const YourReferralCodeTab({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    final bloc = context.read<GenerateReferralCodeBloc>();
    bloc.add(const GenerateReferralCodeEvent.refreshData());
    
    await Future.delayed(const Duration(milliseconds: 100));
    
    if (bloc.state.status == GenerateReferralCodeStatus.paginating || 
        bloc.state.status == GenerateReferralCodeStatus.loading) {
      await bloc.stream.firstWhere((state) => 
        state.status != GenerateReferralCodeStatus.paginating &&
        state.status != GenerateReferralCodeStatus.loading
      );
    }
  }

  /// Wraps a non-scrollable [child] so that [RefreshIndicator] can detect the
  /// pull gesture even on empty / error / loading states.
  Widget _scrollableCenter(BuildContext context, Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pricing = context.pricing;
    return BlocBuilder<GenerateReferralCodeBloc, GenerateReferralCodeState>(
      builder: (context, state) {
        // Show loading indicator
        if (state.status == GenerateReferralCodeStatus.loading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: ReferralCardThump(
                    bottomView: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            // Skeleton placeholder only — never a real-looking
                            // code, which users would try to copy and share.
                            '••••••••',
                            style: sansDevanagariBold32(color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFe8f5e9),
                              foregroundColor: const Color(0xFF4D8B55),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              minimumSize: const Size(0, 36),
                            ),
                            icon: const Icon(Icons.copy_rounded, size: 16),
                            label: Text(
                              'Copy',
                              style: sansJpMedium14(color: const Color(0xFF4D8B55)).copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: Text(
                    'All Referral Codes',
                    style: sansMedium24(color: Colors.black),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
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
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '••••••••',
                                      style: sansDevanagariBold32(
                                        color: Colors.black87,
                                      ).copyWith(fontSize: 22),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                                    ),
                                    child: Text(
                                      'UNKNOWN',
                                      style: sansJpMedium14(
                                        color: Colors.grey,
                                      ).copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Divider(color: Colors.grey.shade100, height: 1),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                Icons.attach_money,
                                'Amount',
                                '\$000.00',
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.directions_car,
                                'Rides Required',
                                '0',
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.check_circle_outline,
                                'Rides Completed',
                                '0',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 3,
                  ),
                ),
              ],
            ),
          ).withSkeleton(enabled: true);
        }

        // Show error message
        if (state.status == GenerateReferralCodeStatus.error) {
          return _scrollableCenter(
            context,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  state.errorResponse?.message ?? 'Failed to load referral codes',
                  style: sansJpMedium14(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _onRefresh(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4D8B55),
                  ),
                  child: Text('Retry', style: sansJpMedium14(color: Colors.white)),
                ),
              ],
            ),
          );
        }

        final data = state.data ?? [];

        // Show empty state (also pull-to-refreshable)
        if (data.isEmpty) {
          return _scrollableCenter(
            context,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_add_alt_1_outlined, size: 48, color: Colors.grey),
                const SizedBox(height: 16),
                Text('No referral codes found', style: sansJpMedium14(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(
                  'Pull down to refresh',
                  style: sansJpMedium14(color: Colors.grey).copyWith(fontSize: 12),
                ),
              ],
            ),
          );
        }

        // Show referral codes list
        return RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: ReferralCardThump(
                  bottomView: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          data.first.code ?? '—',
                          style: sansDevanagariBold32(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                          // Copy is disabled unless the server actually gave us
                          // a code — no placeholder is ever copyable.
                          onPressed: (data.first.code ?? '').isNotEmpty
                              ? () {
                            final code = data.first.code!;
                            Clipboard.setData(ClipboardData(text: code));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Referral code copied to clipboard!'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Color(0xFF4D8B55),
                              ),
                            );
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFe8f5e9),
                            foregroundColor: const Color(0xFF4D8B55),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            minimumSize: const Size(0, 36),
                          ),
                          icon: const Icon(Icons.copy_rounded, size: 16),
                          label: Text(
                            'Copy',
                            style: sansJpMedium14(color: const Color(0xFF4D8B55)).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Text(
                  'All Referral Codes',
                  style: sansMedium24(color: Colors.black),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final code = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
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
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    code.code ?? 'N/A',
                                    style: sansDevanagariBold32(
                                      color: Colors.black87,
                                    ).copyWith(fontSize: 22),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(code.status).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: _getStatusColor(code.status).withValues(alpha: 0.2)),
                                  ),
                                  child: Text(
                                    code.status?.toUpperCase() ?? 'UNKNOWN',
                                    style: sansJpMedium14(
                                      color: _getStatusColor(code.status),
                                    ).copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Divider(color: Colors.grey.shade100, height: 1),
                            const SizedBox(height: 16),
                            _buildInfoRow(
                              Icons.attach_money,
                              'Amount',
                              (code.amount ??
                                      pricing
                                          .referralPriceFor(code.referralType))
                                  .toCadLabel,
                            ),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              Icons.directions_car,
                              'Rides Required',
                              '${code.minRidesRequired ?? pricing.referralMinRides}',
                            ),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              Icons.check_circle_outline,
                              'Rides Completed',
                              '${code.ridesCompletedCount ?? 0}',
                            ),
                            if (code.usedAt != null) ...[
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.calendar_today,
                                'Used At',
                                code.usedAt ?? 'N/A',
                              ),
                            ],
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {
                                    if (code.code != null) {
                                      Clipboard.setData(
                                        ClipboardData(text: code.code!),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Code ${code.code} copied to clipboard!',
                                          ),
                                          duration: const Duration(seconds: 2),
                                          backgroundColor: const Color(0xFF4D8B55),
                                        ),
                                      );
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    foregroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                  ),
                                  icon: const Icon(Icons.copy, size: 16),
                                  label: Text(
                                    'Copy',
                                    style: sansJpMedium14(
                                      color: Colors.black87,
                                    ).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _shareReferralCode(context, code);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4D8B55),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    elevation: 0,
                                  ),
                                  icon: const Icon(Icons.share, size: 16),
                                  label: Text(
                                    'Share',
                                    style: sansJpMedium14(
                                      color: Colors.white,
                                    ).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: data.length,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
            ),
          ),
        );
      },
    );
  }

  void _shareReferralCode(BuildContext context, ReferralCode code) {
    final pricing = context.pricingOnce;
    final message = '''
🎁 Use my referral code: ${code.code ?? 'N/A'}

💰 Earn ${(code.amount ?? pricing.referralPriceFor(code.referralType)).toCadLabel}
🚗 Complete ${code.minRidesRequired ?? pricing.referralMinRides} rides to redeem
📊 Status: ${code.status?.toUpperCase() ?? 'UNKNOWN'}

Join now and start earning!
''';

    // Show share options bottom sheet
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Share Referral Code',
              style: sansMedium24(color: Colors.black),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.copy, color: Color(0xFF4D8B55)),
              title: Text(
                'Copy Message',
                style: sansJpMedium14(color: Colors.black),
              ),
              onTap: () {
                Clipboard.setData(ClipboardData(text: message));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message copied to clipboard!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF4D8B55),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Color(0xFF4D8B55)),
              title: Text(
                'Share via Message',
                style: sansJpMedium14(color: Colors.black),
              ),
              subtitle: Text(
                'Opens messaging app',
                style: sansJpMedium14(color: Colors.grey).copyWith(fontSize: 12),
              ),
              onTap: () {
                // Copy to clipboard as fallback
                Clipboard.setData(ClipboardData(text: message));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message copied! Paste it in your messaging app.'),
                    duration: Duration(seconds: 3),
                    backgroundColor: Color(0xFF4D8B55),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF4D8B55)),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: sansJpMedium14(color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: sansJpMedium14(color: Colors.black),
        ),
      ],
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'used':
        return Colors.blue;
      case 'expired':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildShareButton(IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF4D8B55)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(44, 36),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF4D8B55)),
    );
  }
}
