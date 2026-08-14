import 'package:elan/core/styles.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/generate_referral_code_bloc/generate_referral_code_bloc.dart';
import 'package:elan/presentation/ui/pages/referral_code_page/tab/enter_referral_code_tab.dart';
import 'package:elan/presentation/ui/pages/referral_code_page/tab/your_referral_code_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferralCodePage extends StatefulWidget {
  const ReferralCodePage({super.key});

  @override
  State<ReferralCodePage> createState() => _ReferralCodePageState();
}

class _ReferralCodePageState extends State<ReferralCodePage>
    with SingleTickerProviderStateMixin {
  final String referralCode = 'SCS15115CSVS511';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<GenerateReferralCodeBloc>().add(const GenerateReferralCodeEvent.getReferralCodes());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerateReferralCodeBloc, GenerateReferralCodeState>(
      listener: (context, state) {
        if (state.status == GenerateReferralCodeStatus.actionLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            useRootNavigator: true,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == GenerateReferralCodeStatus.generateSuccess) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop(); // close loader
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Referral code generated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state.status == GenerateReferralCodeStatus.generateError) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop(); // close loader
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorResponse?.message ?? 'Failed to generate code'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          leading: Navigator.canPop(context) ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            onPressed: () => Navigator.of(context).pop(),
          ) : null,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Referral Code',
            style: sansMedium24(color: Colors.black87).copyWith(fontSize: 20),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Your Codes'),
                      Tab(text: 'Enter Code'),
                    ],
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey.shade600,
                    labelStyle: sansJpMedium14(color: Colors.black87).copyWith(fontWeight: FontWeight.w600),
                    unselectedLabelStyle: sansJpMedium14(color: Colors.grey.shade600),
                    dividerColor: Colors.transparent,
                    padding: const EdgeInsets.all(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    YourReferralCodeTab(referralCode: referralCode),
                    const EnterReferralCodeTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
