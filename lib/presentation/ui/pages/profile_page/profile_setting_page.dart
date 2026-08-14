import 'package:cached_network_image/cached_network_image.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/ui/extension/skeletonizer_extension.dart';
import 'package:elan/presentation/ui/pages/profile_page/bottom_sheet/car_details_edit_sheet.dart';
import 'package:elan/presentation/ui/pages/profile_page/bottom_sheet/instructor_edit_sheet.dart';
import 'package:elan/presentation/ui/pages/profile_page/bottom_sheet/license_edit_sheet.dart';
import 'package:elan/presentation/ui/widgets/profile_setting_page/bank_details_section.dart';
import 'package:elan/presentation/ui/widgets/profile_setting_page/delete_account_button.dart';
import 'package:elan/presentation/ui/widgets/profile_setting_page/logout_button.dart';
import 'package:elan/presentation/ui/widgets/profile_setting_page/profile_settings_card.dart';
import 'package:elan/presentation/ui/widgets/profile_setting_page/profile_summary_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';

import 'bottom_sheet/bank_details_edit_sheet.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool _isActionDialogShowing = false;

  @override
  void initState() {
    context.read<InstructorInfoBloc>().add(InstructorInfoEvent.getInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Navigator.canPop(context) ? IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ) : null,
        title: Text('Profile Settings', style: sansMedium24(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context
                .read<InstructorInfoBloc>()
                .add(InstructorInfoEvent.getInfo());
          },
          child: MultiBlocListener(
            listeners: [
              BlocListener<FileUploadBloc, FileUploadState>(
                listener: (context, state) {
                  if (state.status == FileUploadStatus.loading) {
                    _isActionDialogShowing = true;
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      useRootNavigator: true,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.status == FileUploadStatus.success) {
                    if (_isActionDialogShowing) {
                      _isActionDialogShowing = false;
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    final params = {
                      "photo_url": state.response?.url ?? "",
                    };
                    context
                        .read<InstructorInfoBloc>()
                        .add(InstructorInfoEvent.updateInfo(params: params));
                  } else if (state.status == FileUploadStatus.error) {
                    if (_isActionDialogShowing) {
                      _isActionDialogShowing = false;
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorResponse?.message ?? 'Failed to upload photo'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
              BlocListener<InstructorInfoBloc, InstructorInfoState>(
                listener: (context, state) {
                  if (state.status == InstructorInfoStatus.actionLoading) {
                    _isActionDialogShowing = true;
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      useRootNavigator: true,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.status == InstructorInfoStatus.updateSuccess) {
                    if (_isActionDialogShowing) {
                      _isActionDialogShowing = false;
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state.status == InstructorInfoStatus.error) {
                    if (_isActionDialogShowing) {
                      _isActionDialogShowing = false;
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (state.errorResponse != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorResponse!.message ?? 'An error occurred'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),
              BlocListener<StripeOnboardingBloc, StripeOnboardingState>(
                listener: (context, state) {
                  if (state.status == StripeOnboardingStatus.success) {
                    context.read<InstructorInfoBloc>().add(const InstructorInfoEvent.getInfo());
                  } else if (state.status == StripeOnboardingStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorResponse?.message ?? 'Failed to update Stripe account'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: BlocBuilder<InstructorInfoBloc, InstructorInfoState>(
                      builder: (context, state) {
                    return SliverToBoxAdapter(
                      child: _ProfileHeaderCard(
                        imageUrl: state.userInfo?.photoUrl ?? "",
                        onEditPhoto: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'jpeg', 'png'],
                          );
                          if (context.mounted && result != null) {
                            context.read<FileUploadBloc>().add(
                                FileUploadEvent.send(
                                    file: result.files.single));
                          }
                        },
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            ProfileSummaryCard(
                              title: 'Instructor Details',
                              icon: Icons.person,
                              data: {
                                'Name': state.userInfo?.fullName ?? '',
                                'Email': state.userInfo?.email ?? '',
                                'Phone': state.userInfo?.phoneNumber ?? '',
                                'Address': state.userInfo?.address ?? '',
                              },
                              onEdit: () {
                                final instructorInfoBloc =
                                    context.read<InstructorInfoBloc>();
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) => BlocProvider.value(
                                    value: instructorInfoBloc,
                                    child: InstructorEditSheet(
                                      name: state.userInfo?.fullName ?? '',
                                      mail: state.userInfo?.email ?? '',
                                      phone: state.userInfo?.phoneNumber ?? '',
                                      address: state.userInfo?.address ?? '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ProfileSummaryCard(
                              title: 'Car Details',
                              icon: Icons.directions_car,
                              isComplete: state.vehicleStatus == CarInfoStatus.complete,
                              data: {
                                'Brand': state.vehicleInfo?.brand ?? '',
                                'Model': state.vehicleInfo?.model ?? '',
                                'Year': "${state.vehicleInfo?.year ?? ''}",
                                'Color': state.vehicleInfo?.color ?? '',
                                'License Plate': state.vehicleInfo?.licensePlate ?? '',
                              },
                              onEdit: () {
                                final instructorInfoBloc =
                                    context.read<InstructorInfoBloc>();
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) => BlocProvider.value(
                                    value: instructorInfoBloc,
                                    child: CarDetailsEditSheet(
                                      carBrand: state.vehicleInfo?.brand ?? '',
                                      carModel: state.vehicleInfo?.model ?? "",
                                      carYear:
                                          "${state.vehicleInfo?.year ?? ''}",
                                      carColor: state.vehicleInfo?.color ?? '',
                                      licensePlate:
                                          state.vehicleInfo?.licensePlate ?? '',
                                      vehicleRegistration: state.vehicleInfo
                                              ?.registrationDocUrl ??
                                          '',
                                      vehicleInsurance:
                                          state.vehicleInfo?.insuranceDocUrl ??
                                              '',
                                      carImage:
                                          state.vehicleInfo?.vehicleImageUrl ??
                                              '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            ProfileSummaryCard(
                              title: 'License Details',
                              icon: Icons.badge,
                              isComplete: state.licenseStatus == LicenseInfoStatus.complete,
                              data: {
                                'License No': state.instructorInfo?.licenseNumber ?? '',
                                'Validity Date': state.instructorInfo?.licenseValidityDate != null 
                                    ? "${state.instructorInfo!.licenseValidityDate!.year}-${state.instructorInfo!.licenseValidityDate!.month.toString().padLeft(2, '0')}-${state.instructorInfo!.licenseValidityDate!.day.toString().padLeft(2, '0')}"
                                    : '',
                                'Driving School': state.instructorInfo?.drivingSchoolName ?? '',
                              },
                              onEdit: () {
                                final instructorInfoBloc =
                                    context.read<InstructorInfoBloc>();
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) => BlocProvider.value(
                                    value: instructorInfoBloc,
                                    child: LicenseEditSheet(
                                      taxInfoDocUrl:
                                          state.instructorInfo?.taxInfoDocUrl ??
                                              "",
                                      workEligibilityDocUrl: state
                                              .instructorInfo
                                              ?.workEligibilityDocUrl ??
                                          "",
                                      instructorLicenseUrl: state.instructorInfo
                                              ?.instructorLicenseUrl ??
                                          "",
                                      drivingLicenseUrl: state.instructorInfo
                                              ?.drivingLicenseUrl ??
                                          "",
                                      licenseValidityDate: state.instructorInfo
                                              ?.licenseValidityDate
                                              ?.toIso8601String() ??
                                          "",
                                      licenseNumber:
                                          state.instructorInfo?.licenseNumber ??
                                              "",
                                      drivingSchoolName: state.instructorInfo
                                              ?.drivingSchoolName ??
                                          "",
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            ProfileSummaryCard(
                              title: 'Bank Details',
                              icon: Icons.credit_card,
                              isComplete: state.paymentStatus == PaymentInfoStatus.complete,
                              data: {
                                'Payment Status': state.paymentStatus == PaymentInfoStatus.complete ? 'Complete' : 'Incomplete',
                                'Account Type': state.instructorInfo?.stripeAccountType ?? '-',
                                'Country': state.instructorInfo?.stripeCountry ?? '-',
                              },
                              onEdit: () {
                                final instructorInfoBloc =
                                    context.read<InstructorInfoBloc>();
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) => BlocProvider.value(
                                    value: instructorInfoBloc,
                                    child: BankDetailsEditSheet(
                                      paymentStatus: state.paymentStatus,
                                      stripeAccountType: state.instructorInfo?.stripeAccountType,
                                      stripeAccountStatus: state.instructorInfo?.stripeAccountStatus,
                                      stripeAccountId: state.instructorInfo?.stripeAccountId,
                                      stripeCountry: state.instructorInfo?.stripeCountry,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            const LogoutButton(),
                            const SizedBox(height: 12),
                            const DeleteAccountButton(),
                          ],
                        ),
                      ).withSkeleton(
                          enabled:
                              state.status == InstructorInfoStatus.loading),
                    );
                  }),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                // SliverPadding(
                //   padding: const EdgeInsets.all(16.0),
                //   sliver: SliverToBoxAdapter(
                //     child: BankDetailsSection(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Drop this helper widget in the same file ---
class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard({
    required this.imageUrl,
    required this.content,
    this.onEditPhoto,
    this.avatarSize = 96,
    super.key,
  });

  final String imageUrl;
  final Widget content;
  final VoidCallback? onEditPhoto;
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    final overlap = avatarSize / 2; // how much the avatar overlaps the card

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Card pushed down to make room for the overlapping avatar
        Padding(
          padding: EdgeInsets.only(top: overlap),
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16 + overlap, 16, 16),
              child: content,
            ),
          ),
        ),

        // Avatar + small edit button
        SizedBox(
          height: avatarSize,
          width: avatarSize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Avatar
              Container(
                height: avatarSize,
                width: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(strokeWidth: 2)),
                          errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColorDark,
                              size: 40),
                        )
                      : Icon(Icons.person,
                          color: Theme.of(context).primaryColorDark, size: 40),
                ),
              ),

              // Edit button (bottom-right of avatar)
              Positioned(
                right: 0,
                bottom: 4,
                child: Material(
                  color: Theme.of(context).primaryColorDark,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onEditPhoto,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
