import 'package:elan/core/styles.dart';
import 'package:elan/presentation/bloc/referral_summary_bloc/referral_summary_bloc.dart';
import 'package:elan/presentation/ui/widgets/referral_code/referral_card_thump.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elan/presentation/ui/extension/skeletonizer_extension.dart';

class EnterReferralCodeTab extends StatefulWidget {
  const EnterReferralCodeTab({super.key});

  @override
  State<EnterReferralCodeTab> createState() => _EnterReferralCodeTabState();
}

class _EnterReferralCodeTabState extends State<EnterReferralCodeTab>
    with AutomaticKeepAliveClientMixin {
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ReferralSummaryBloc, ReferralSummaryState>(
      listener: (context, state) {
        if (state.status == ReferralSummaryStatus.claimSuccess) {
          _codeController.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Referral code claimed successfully!"),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state.status == ReferralSummaryStatus.claimError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.errorResponse?.message ?? "Failed to claim code"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            final bloc = context.read<ReferralSummaryBloc>();
            bloc.add(const ReferralSummaryEvent.fetchSummary());

            await Future.delayed(const Duration(milliseconds: 100));

            if (bloc.state.status == ReferralSummaryStatus.loading) {
              await bloc.stream.firstWhere(
                  (state) => state.status != ReferralSummaryStatus.loading);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                if (state.summaryResponse?.peerClaim == null)
                  SliverToBoxAdapter(
                    child: ReferralCardThump(
                      bottomView: Column(
                        children: [
                          TextFormField(
                            controller: _codeController,
                            decoration: InputDecoration(
                              hintText: 'Add Your Referral Code',
                              hintStyle: sansDevanagariRegular16(
                                  color: Colors.grey.shade700),
                              prefixIcon: const Icon(Icons.share),
                              errorStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: state.status ==
                                    ReferralSummaryStatus.claimLoading
                                ? null
                                : () {
                                    if (_codeController.text.isNotEmpty) {
                                      context.read<ReferralSummaryBloc>().add(
                                          ReferralSummaryEvent
                                              .claimReferralCode(
                                                  code: _codeController.text));
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4D8B55),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: state.status ==
                                    ReferralSummaryStatus.claimLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2, color: Colors.white),
                                  )
                                : Text(
                                    'Add code',
                                    style: sansJpMedium14(
                                      color: Colors.white,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                if (state.summaryResponse?.peerClaim != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ReferralCardThump(
                        peerClaim: state.summaryResponse!.peerClaim!,
                      ),
                    ),
                  ),
                if (state.status == ReferralSummaryStatus.loading &&
                    state.summaryResponse?.peerClaim == null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ReferralCardThump(
                        peerClaim: state.summaryResponse?.peerClaim,
                      ).withSkeleton(enabled: true),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
