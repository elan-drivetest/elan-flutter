import 'dart:developer';
import 'package:battery_plus/battery_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elan/core/app_colors.dart';
import 'package:elan/core/extension/pretty_date_time.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/data/location_request_service/location_request_service.dart';
import 'package:elan/data/trace/location_service.dart';
import 'package:elan/domain/vehicle_request_response/vehicle_request_response.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart';
import 'package:elan/presentation/bloc/complete_ride_bloc/complete_ride_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/bloc/instructor_ride_bloc/instructor_ride_bloc.dart';
import 'package:elan/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:elan/presentation/bloc/instructor_summary_bloc/instructor_summary_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/open_setting_dialog.dart';
import 'package:elan/presentation/ui/dialog/location_dialog/permission_warning_dialog.dart';
import 'package:elan/presentation/ui/pages/dashboard_page/dialog/transfer_dialog.dart';
import 'package:elan/presentation/ui/widgets/home/active_ride_card.dart';
import 'package:elan/presentation/ui/widgets/home/dashboard_card_section.dart';
import 'package:elan/presentation/ui/widgets/home/ride_history_card.dart';
import 'package:elan/presentation/ui/widgets/home/total_earnings_card.dart';
import 'package:elan/presentation/ui/widgets/home/upcoming_ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elan/presentation/ui/extension/skeletonizer_extension.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ValueNotifier<bool> isServiceRunning = ValueNotifier(false);
  final _locationRequestService = getIt<LocationRequestService>();
  final _reasonController = TextEditingController();
  //String? timeZone;

  final battery = Battery();
  int batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    context.read<InstructorInfoBloc>().add(InstructorInfoEvent.getInfo());
    context.read<InstructorRideBloc>().add(InstructorRideEvent.requestData());
    context.read<StripeOnboardingBloc>().add(StripeOnboardingEvent.getInfo());
    context.read<UpcomingRideBloc>().add(UpcomingRideEvent.requestData());
    context.read<CompleteRideBloc>().add(CompleteRideEvent.requestData());
    // checkAllPermissions internally runs checkBackgroundPermissions sequentially
    context.read<LocationBloc>().add(const LocationEvent.checkAllPermissions());
    getInfo();
    _updateServiceStatus();
  }

  void getInfo() async {
    //timeZone = await FlutterNativeTimezone.getLocalTimezone();
    batteryLevel = await battery.batteryLevel;
  }

  void _updateServiceStatus() async {
    final locationService = LocationService.instance;
    final running = await locationService.isRunningService;

    if (mounted && isServiceRunning.value != running) {
      isServiceRunning.value = running;
    }

    if (running) {
      locationService.addLocationChangedCallback(_onLocationChanged);
    } else {
      locationService.removeLocationChangedCallback(_onLocationChanged);
    }
  }

  void _startTraceService() async {
    final locationService = LocationService.instance;

    if (await locationService.isRunningService) {
      log("ℹ️ Location Service already running");
      locationService.addLocationChangedCallback(_onLocationChanged);
      return;
    }
    log("🚀 Starting Tracking");
    await locationService.start();
    locationService.addLocationChangedCallback(_onLocationChanged);
  }

  void _stopTraceService() {
    final locationService = LocationService.instance;
    locationService.removeLocationChangedCallback(_onLocationChanged);
    locationService.stop();
    log("🛑 Tracking stopped.");
  }

  void _onLocationChanged(Position location) {
    log("📍 Location Changed: ${location.latitude}, ${location.longitude}");
  }

  @override
  void dispose() {
    _reasonController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<LocationBloc>()
                  .add(const LocationEvent.checkAllPermissions());

              //context.read<InstructorInfoBloc>().add(InstructorInfoEvent.getInfo());
              context
                  .read<InstructorRideBloc>()
                  .add(InstructorRideEvent.requestData());
              // context.read<StripeOnboardingBloc>().add(StripeOnboardingEvent.getInfo());
              context
                  .read<UpcomingRideBloc>()
                  .add(UpcomingRideEvent.refreshData());
              context
                  .read<CompleteRideBloc>()
                  .add(CompleteRideEvent.refreshData());
              context
                  .read<InstructorSummaryBloc>()
                  .add(const InstructorSummaryEvent.getSummary());
            },
            child: MultiBlocListener(
              listeners: [
                BlocListener<LocationBloc, LocationState>(
                  listener: (context, state) {
                    if (state.status == LocationStatus.success &&
                        state.location != null &&
                        state.rideId != null &&
                        state.shouldStart == true) {
                      context.read<InstructorRideBloc>().add(
                            InstructorRideEvent.start(
                              id: state.rideId,
                              lat: state.location?.latitude,
                              lot: state.location?.longitude,
                              accuracy: state.location?.accuracy,
                              speed: state.location?.speed,
                              bearing: state.location?.heading,
                              altitude: state.location?.altitude,
                              batteryLevel: batteryLevel,
                              timezone: "America/Toronto",
                            ),
                          );
                    }
                    if (state.status == LocationStatus.permissionDenied) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OpenSettingDialog(
                            open: () {
                              context.read<LocationBloc>().add(
                                  const LocationEvent.checkAllPermissions());
                            },
                            cancel: () {
                              Navigator.of(context).pop(false);
                            },
                            title: "Location Access Needed",
                            description:
                                "To start or stop rides and view your route on the map, Please enable location permission from your device settings.",
                            bTitle: "Enable Permission",
                          );
                        },
                      );
                    }
                    if (state.status ==
                        LocationStatus.permissionPermanentlyDenied) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OpenSettingDialog(
                            open: () {
                              openAppSettings();
                            },
                            cancel: () {
                              Navigator.of(context).pop(false);
                            },
                            title: "Location Permission Disabled",
                            description:
                                "To start or stop rides and view your route on the map, Please allow location access in your device settings to continue.",
                            bTitle: "Open App Settings",
                          );
                        },
                      );
                    }

                    if (state.status == LocationStatus.gpsDisabled) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PermissionWarningDialog(
                              close: () {
                                Navigator.of(context).pop(false);
                              },
                              message:
                                  "Location services are required to start or stop a ride and navigate the map. Please enable location in your device settings to continue.",
                            );
                          });
                    }

                    if (state.status == LocationStatus.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(state.errorMessage ??
                                'Location permission denied')),
                      );
                    }
                    if (state.status == LocationStatus.backgroundPermissionNotGranted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OpenSettingDialog(
                            open: () {
                              openAppSettings();
                            },
                            cancel: () {
                              Navigator.of(context).pop(false);
                            },
                            title: "Background Permission Needed",
                            description: state.errorMessage ??
                                "To track your rides properly, please allow location access all the time in your device settings.",
                            bTitle: "Open App Settings",
                          );
                        },
                      );
                    }
                  },
                ),
              ],
              child: CustomScrollView(
                slivers: [
                  BlocBuilder<InstructorInfoBloc, InstructorInfoState>(
                      builder: (context, state) {
                    if (state.status == InstructorInfoStatus.loading) {
                      return SliverMainAxisGroup(
                        slivers: [
                          const SliverPadding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                'Hey, Instructor 👋',
                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            sliver: SliverToBoxAdapter(
                              child: _buildProfileCompletion(
                                percentage: 100,
                                onTap: () {},
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: TotalEarningsCard(
                              walletBalance: '0.00',
                              availableBalance: '\$0.00',
                              withdrawn: '\$0.00',
                              totalRides: '0',
                            ),
                          ),
                        ],
                      ).withSliverSkeleton(enabled: true);
                    }
                    if (state.status == InstructorInfoStatus.error) {
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                              const SizedBox(height: 16),
                              Text(
                                state.errorResponse?.message ?? 'Failed to load profile',
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<InstructorInfoBloc>().add(InstructorInfoEvent.getInfo());
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50), foregroundColor: Colors.white),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state.status == InstructorInfoStatus.success) {
                      if (state.paymentStatus == PaymentInfoStatus.incomplete ||
                          state.licenseStatus == LicenseInfoStatus.incomplete ||
                          state.vehicleStatus == CarInfoStatus.incomplete) {
                        return SliverMainAxisGroup(slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                'Hey, ${state.userInfo?.fullName ?? "Instructor"} 👋',
                                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            sliver: SliverToBoxAdapter(
                              child: _buildProfileCompletion(
                                percentage: state.profileCompletePercentage,
                                onTap: () =>
                                    context.push(PagesName.profilePage.path),
                              ),
                            ),
                          ),
                          if (state.paymentStatus ==
                              PaymentInfoStatus.incomplete)
                            BlocConsumer<StripeOnboardingBloc,
                                StripeOnboardingState>(
                              listener: (context, state) {
                                if (state.status == StripeOnboardingStatus.update) {
                                  context.push(PagesName.stripeVerifyPage.path,
                                      extra: state.onboardUrlResponse?.onboardingUrl ?? "");
                                } else if (state.status == StripeOnboardingStatus.error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.errorResponse?.message ?? "Failed to initiate bank onboarding. Please try again."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return SliverPadding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  sliver: SliverToBoxAdapter(
                                    child: DashboardCardSection(
                                      title: 'Add A Bank To Get Paid',
                                      description: 'Secure Your Earnings By Linking Your Bank Account.',
                                      buttonText: 'Add Your Bank',
                                      buttonColor: const Color(0xFF2196F3),
                                      imageAsset: 'assets/bank_logo.png',
                                      isLoading: state.status == StripeOnboardingStatus.loading,
                                      onPressed: () {
                                        context.read<StripeOnboardingBloc>().add(StripeOnboardingEvent.onboardStripe());
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (state.vehicleStatus == CarInfoStatus.incomplete)
                            SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              sliver: SliverToBoxAdapter(
                                child: DashboardCardSection(
                                  title: 'Add Your Car To Get Rolling',
                                  description:
                                      'Start Receiving Ride Requests By Adding Your Vehicle Details.',
                                  buttonText: 'Add Your Car',
                                  buttonColor: const Color(0xFF4CAF50),
                                  imageAsset: 'assets/car_logo.png',
                                  onPressed: () {
                                    final String yearString =
                                        state.vehicleInfo?.year == null
                                            ? ""
                                            : "${state.vehicleInfo!.year}"
                                                .trim();

                                    final int? yearInt =
                                        int.tryParse(yearString);

                                    final vehicleRequest =
                                        VehicleRequestResponse(
                                      brand: state.vehicleInfo?.brand,
                                      model: state.vehicleInfo?.model,
                                      year:
                                          yearInt, // Always a String for backend compatibility
                                      color: state.vehicleInfo?.color,
                                      licensePlate:
                                          state.vehicleInfo?.licensePlate,
                                      registrationDocUrl:
                                          state.vehicleInfo?.registrationDocUrl,
                                      insuranceDocUrl:
                                          state.vehicleInfo?.insuranceDocUrl,
                                      vehicleImageUrl:
                                          state.vehicleInfo?.vehicleImageUrl,
                                    );

                                    // Navigate with go_router, passing the vehicleRequest as extra
                                    context.go(
                                      "${PagesName.dashboardPage.path}/${PagesName.addVehiclePage.path}",
                                      extra: vehicleRequest,
                                    );
                                  },
                                ),
                              ),
                            ),
                          if (state.licenseStatus ==
                              LicenseInfoStatus.incomplete)
                            SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              sliver: SliverToBoxAdapter(
                                child: DashboardCardSection(
                                  title: 'Add Your License Data',
                                  description:
                                      'Verify Your Skills With Your Driving License & Tax Docs.',
                                  buttonText: 'Add Your License',
                                  buttonColor: const Color(0xFF2196F3),
                                  imageAsset: 'assets/driving_license_logo.png',
                                  onPressed: () {
                                    context.go(
                                      "${PagesName.dashboardPage.path}/${PagesName.addLicensePage.path}",
                                      extra: state.instructorInfo,
                                    );
                                  },
                                ),
                              ),
                            ),
                        ]);
                      }
                      return SliverMainAxisGroup(
                        slivers: [
                          if (state.profileCompletePercentage != 100)
                            SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              sliver: SliverToBoxAdapter(
                                child: _buildProfileCompletion(
                                  percentage: state.profileCompletePercentage,
                                  onTap: () =>
                                      context.push(PagesName.profilePage.path),
                                ),
                              ),
                            ),
                          SliverToBoxAdapter(
                            child: BlocBuilder<InstructorSummaryBloc, InstructorSummaryState>(
                              builder: (context, summaryState) {
                                return Skeletonizer(
                                  enabled: summaryState.status == InstructorSummaryStatus.loading,
                                  child: TotalEarningsCard(
                                    walletBalance: '${state.instructorInfo?.walletBalance ?? 0}',
                                    availableBalance: '\$${summaryState.summaryInfo?.availableBalance ?? "0.00"}',
                                    withdrawn: '\$${summaryState.summaryInfo?.withdrawn ?? "0.00"}',
                                    totalRides: '${summaryState.summaryInfo?.totalCompletedRides ?? "0"}',
                                  ),
                                );
                              },
                            ),
                          ),
                          BlocConsumer<InstructorRideBloc, InstructorRideState>(
                              listener: (context, state) {
                            if (state.status == InstructorRideStatus.success &&
                                state.currentRide != null) {
                              _startTraceService();
                            }
                            if (state.status ==
                                    InstructorRideStatus.stopSuccess ||
                                state.status == InstructorRideStatus.error) {
                              _stopTraceService();
                            }
                            if (state.status == InstructorRideStatus.error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.errorResponse?.message ??
                                      "Failed to start ride. Please try again."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }, builder: (context, state) {
                            if (state.status == InstructorRideStatus.success) {
                              return SliverMainAxisGroup(slivers: [
                                SliverPadding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  sliver: SliverToBoxAdapter(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.directions_car_rounded,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          "Your Active Ride",
                                          style: sansMedium24(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: ActiveRideCard(
                                    onTap: () {
                                      context.push(
                                        "${PagesName.dashboardPage.path}/${PagesName.directionMapPage.path}",
                                        extra: state.currentRide,
                                      );
                                    },
                                    onStop: () async {
                                      try {
                                        // Get current location
                                        final position =
                                            await Geolocator.getCurrentPosition(
                                          desiredAccuracy:
                                              LocationAccuracy.high,
                                        );

                                        if (context.mounted) {
                                          context
                                              .read<InstructorRideBloc>()
                                              .add(
                                                InstructorRideEvent.stop(
                                                  rideId: state.currentRide?.id,
                                                  lat: position.latitude,
                                                  lot: position.longitude,
                                                ),
                                              );
                                        }
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Failed to get current location: $e'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    status: state.currentRide?.status ?? "",
                                    totalHours:
                                        state.currentRide?.totalHours ?? 0,
                                    hourlyRate:
                                        ((state.currentRide?.hourlyRate ?? 0) /
                                            100),
                                    totalDistance:
                                        state.currentRide?.totalDistance ?? 0,
                                  ),
                                )
                              ]);
                            }
                            return SliverToBoxAdapter();
                          }),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            sliver: SliverToBoxAdapter(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.directions_car_rounded,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Your Upcoming Rides',
                                    style: sansMedium24(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          BlocBuilder<UpcomingRideBloc, UpcomingRideState>(
                            builder: (context, state) {
                              if (state.status == UpcomingRideStatus.loading) {
                                return SliverList.separated(
                                  itemCount: 2,
                                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                                  itemBuilder: (context, index) {
                                    return UpcomingRideCard(
                                      onTap: () {},
                                      name: "Loading Name",
                                      rating: 5.0,
                                      time: "12:00 PM",
                                      pickupLocation: "Loading Address Long Long Long",
                                      dropOffLocation: "Loading Address Long Long Long",
                                      type: "Driving Test",
                                      phoneNumber: "1234567890",
                                      transfer: () {},
                                      start: () {},
                                    );
                                  },
                                ).withSliverSkeleton(enabled: true);
                              }

                              if (state.status == UpcomingRideStatus.error) {
                                return SliverPadding(
                                  padding: EdgeInsets.symmetric(vertical: 24.0),
                                  sliver: SliverToBoxAdapter(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(state.errorResponse?.message ??
                                            'Something went wrong'),
                                        const SizedBox(height: 12),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: LightModeColor
                                                .buttonBackground.color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<UpcomingRideBloc>()
                                                .add(UpcomingRideEvent
                                                    .refreshData());
                                          },
                                          child: Text(
                                            'Retry',
                                            style: sansDevanagariRegular14(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              if (state.status == UpcomingRideStatus.success) {
                                final rides = state.rides;
                                return SliverList.separated(
                                  itemCount: rides?.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16),
                                  itemBuilder: (context, index) {
                                    final ride = rides![index];
                                    return UpcomingRideCard(
                                      onTap: () {
                                        context.push(
                                          "${PagesName.dashboardPage.path}/${PagesName.upcomingRideMapPage.path}",
                                          extra: ride,
                                        );
                                      },
                                      name: ride.fullName ?? "",
                                      rating: 4.8,
                                      time: ride.testDate?.toDayMonthTime() ??
                                          "-:-",
                                      pickupLocation: ride.pickupAddress ?? "",
                                      dropOffLocation:
                                          ride.testCenterAddress ?? "",
                                      type: ride.testType ?? "",
                                      phoneNumber: ride.phoneNumber ?? "",
                                      transfer: () {
                                        final upcomingBloc =
                                            context.read<UpcomingRideBloc>();
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return BlocProvider.value(
                                                value: upcomingBloc,
                                                child: BlocListener<
                                                    UpcomingRideBloc,
                                                    UpcomingRideState>(
                                                  listener:
                                                      (context, upcomingState) {
                                                    if (upcomingState.status ==
                                                        UpcomingRideStatus
                                                            .update) {
                                                      _reasonController.clear();
                                                      Navigator.of(context).pop();
                                                      context
                                                          .read<
                                                              AvailableRideBloc>()
                                                          .add(AvailableRideEvent
                                                              .refreshData());
                                                      context
                                                          .read<
                                                              UpcomingRideBloc>()
                                                          .add(UpcomingRideEvent
                                                              .refreshData());
                                                    } else if (upcomingState.status == UpcomingRideStatus.error) {
                                                      Navigator.of(context).pop();
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text(upcomingState.errorResponse?.message ?? "Failed to transfer ride."),
                                                          backgroundColor: Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: TransferDialog(
                                                    reason: _reasonController,
                                                    submit: () {
                                                      upcomingBloc.add(
                                                          UpcomingRideEvent.transfer(
                                                              id: ride.id,
                                                              reason:
                                                                  _reasonController
                                                                      .text));
                                                    },
                                                    cancel: () {
                                                      Navigator.pop(
                                                          context, false);
                                                    },
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      start: () async {
                                        var hasBg =
                                            await _locationRequestService
                                                .hasBackgroundPermission();
                                        if (context.mounted) {
                                          if (hasBg == false) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext dContext) {
                                                return OpenSettingDialog(
                                                  open: () async {
                                                    try {
                                                      // Show a loading indicator or any UI feedback while waiting for the background permission request.
                                                      // You can replace this with any custom loading UI if desired.

                                                      // Await the background permission request
                                                      final granted =
                                                          await _locationRequestService
                                                              .requestBackgroundPermission();

                                                      if (granted) {
                                                        // If permission granted, close only the dialog (not the entire screen)
                                                        if (dContext.mounted &&
                                                            Navigator.canPop(
                                                                dContext)) {
                                                          Navigator.of(dContext)
                                                              .pop(false);
                                                        }
                                                      } else {
                                                        // If permission not granted, open settings for user to enable it manually
                                                        if (dContext.mounted &&
                                                            Navigator.canPop(
                                                                dContext)) {
                                                          Navigator.of(dContext)
                                                              .pop(false);
                                                        }
                                                        if (dContext.mounted) {
                                                          await openAppSettings();
                                                        }
                                                      }
                                                    } catch (e) {
                                                      // In case of an exception (e.g., network error), open the settings
                                                      if (dContext.mounted) {
                                                        Navigator.of(dContext)
                                                            .pop(false);
                                                        await openAppSettings();
                                                      }
                                                    }
                                                  },
                                                  cancel: () {
                                                    // Close only the dialog, not the home screen
                                                    Navigator.of(dContext)
                                                        .pop(false);
                                                  },
                                                  title:
                                                      "Background Location Permission Needed",
                                                  description: state
                                                          .errorResponse
                                                          ?.message ??
                                                      "",
                                                  bTitle: "Settings",
                                                );
                                              },
                                            );
                                          } else {
                                            context.read<LocationBloc>().add(
                                                LocationEvent
                                                    .checkLocationAccess(
                                                        isRideRequest: true,
                                                        rideId: ride.id));
                                          }
                                        }
                                      },
                                    );
                                  },
                                );
                              }
                              return SliverPadding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                sliver: SliverToBoxAdapter(
                                  child: Center(
                                      child: Text(
                                          'No Upcoming rides available.',
                                          style: sansDevanagariBold20(
                                              color: Theme.of(context)
                                                  .primaryColorDark))),
                                ),
                              );
                            },
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            sliver: SliverToBoxAdapter(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.history,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Your Ride History',
                                    style: sansMedium24(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          BlocBuilder<CompleteRideBloc, CompleteRideState>(
                            builder: (context, state) {
                              final rides = state.rides;

                              if (state.status == CompleteRideStatus.loading &&
                                  (rides == null || rides.isEmpty)) {
                                return SliverList.separated(
                                  itemCount: 2,
                                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                                  itemBuilder: (context, index) {
                                    return RideHistoryCard(
                                      name: "Loading Name",
                                      rating: 5.0,
                                      time: "12:00 PM",
                                      pickupLocation: "Loading Address Long Long Long",
                                      dropOffLocation: "Loading Address Long Long Long",
                                      type: "Driving Test",
                                      phoneNumber: "1234567890",
                                      transfer: () {},
                                      start: () {},
                                    );
                                  },
                                ).withSliverSkeleton(enabled: true);
                              }

                              if (state.status == CompleteRideStatus.error) {
                                return SliverPadding(
                                  padding: EdgeInsets.symmetric(vertical: 24.0),
                                  sliver: SliverToBoxAdapter(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(state.errorResponse?.message ??
                                            'Something went wrong'),
                                        const SizedBox(height: 12),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: LightModeColor
                                                .buttonBackground.color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CompleteRideBloc>()
                                                .add(CompleteRideEvent
                                                    .refreshData());
                                          },
                                          child: Text(
                                            'Retry',
                                            style: sansDevanagariRegular14(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              if (state.status == CompleteRideStatus.success &&
                                  (rides?.isNotEmpty == true)) {
                                return SliverList.separated(
                                  itemCount: rides?.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16),
                                  itemBuilder: (context, index) {
                                    final ride = rides![index];
                                    return RideHistoryCard(
                                      name: ride.customerName ?? "",
                                      rating: 4.8,
                                      time:
                                          ride.dateTime?.toDayMonthTime() ?? "",
                                      pickupLocation: ride.pickupLocation ?? "",
                                      dropOffLocation:
                                          ride.dropoffLocation ?? "",
                                      type: ride.testType ?? "",
                                      phoneNumber: "",
                                      transfer: () {},
                                      start: () {},
                                    );
                                  },
                                );
                              }

                              return SliverPadding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                sliver: SliverToBoxAdapter(
                                  child: Center(
                                      child: Text(
                                    'No rides has been completed yet.',
                                    style: sansDevanagariBold20(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  )),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return SliverToBoxAdapter();
                  }),
                ],
                // child: _withRideView(),
              ),
            ),
          ),
        ),
        ),
      );
  }



  Widget _buildEarningsStat(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Navigator.canPop(context) ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        onPressed: () => Navigator.of(context).pop(),
      ) : null,
      title: Image.asset("assets/eclan_color_logo.png", height: 32),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () => context.push(PagesName.profilePage.path),
            child: BlocBuilder<InstructorInfoBloc, InstructorInfoState>(
              builder: (context, state) {
                return Skeletonizer(
                  enabled: state.status == InstructorInfoStatus.loading,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[200],
                    child: ClipOval(
                      child: (state.userInfo?.photoUrl?.isNotEmpty ?? false)
                          ? CachedNetworkImage(
                              imageUrl: state.userInfo!.photoUrl!,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(strokeWidth: 2),
                              errorWidget: (context, url, error) => Icon(Icons.person,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 24),
                            )
                          : Icon(Icons.person,
                              color: Theme.of(context).primaryColorDark,
                              size: 24),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCompletion({
    required int percentage,
    required VoidCallback onTap,
  }) {
    final progress = (percentage.clamp(0, 100)) / 100;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF4CAF50),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile Completion',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$percentage%',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
