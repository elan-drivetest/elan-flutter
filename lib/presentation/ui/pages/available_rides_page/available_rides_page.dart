import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/core/payout_readiness.dart';
import 'package:elan/core/booking_time.dart';
import 'package:elan/core/ride_availability.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:elan/core/ride_earnings.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elan/presentation/bloc/available_ride_bloc/available_ride_bloc.dart';
import 'package:elan/presentation/bloc/earnings_summary_bloc/earnings_summary_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:elan/presentation/bloc/upcoming_ride_bloc/upcoming_ride_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/widgets/available_rides_page/payout_setup_required.dart';
import 'package:elan/presentation/ui/widgets/available_rides_page/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:elan/presentation/ui/extension/skeletonizer_extension.dart';

class AvailableRidesPage extends StatefulWidget {
  const AvailableRidesPage({super.key});

  @override
  State<AvailableRidesPage> createState() => _AvailableRidesPageState();
}

class _AvailableRidesPageState extends State<AvailableRidesPage> {
  Timer? _debounce;

  @override
  void initState() {
    context
        .read<EarningsSummaryBloc>()
        .add(const EarningsSummaryEvent.getEarningsSummary());
    context
        .read<AvailableRideBloc>()
        .add(const AvailableRideEvent.requestData());
    // Needed to grey out jobs on dates already committed to — the server allows
    // one booking per instructor per calendar date (§10).
    context.read<UpcomingRideBloc>().add(UpcomingRideEvent.requestData());
    // Every accept 400s until payouts are enabled (§10), so find out before
    // showing a board full of jobs that cannot be taken. The dashboard also
    // asks on its own initState; this covers arriving here directly.
    context.read<StripeOnboardingBloc>().add(StripeOnboardingEvent.getInfo());
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Image.asset("assets/eclan_color_logo.png", height: 32),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                context.push(PagesName.profilePage.path);
              },
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
                                    const CircularProgressIndicator(
                                        strokeWidth: 2),
                                errorWidget: (context, url, error) => Icon(
                                    Icons.person,
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
      ),
      body: SafeArea(
        child: BlocBuilder<StripeOnboardingBloc, StripeOnboardingState>(
          // Only the readiness matters here. Rebuilding on every status change
          // would also fire for the onboarding-URL flow this bloc shares.
          buildWhen: (previous, current) =>
              previous.payoutReadiness != current.payoutReadiness,
          builder: (context, stripeState) {
            if (!stripeState.payoutReadiness.canAccept) {
              return CustomScrollView(
                slivers: [
                  PayoutSetupRequired(readiness: stripeState.payoutReadiness),
                ],
              );
            }

            // Listen only to refresh the list after accept/error — SnackBar is
            // shown by RideMapPage's bottom sheet to avoid showing it twice.
            return BlocListener<UpcomingRideBloc, UpcomingRideState>(
              listener: (context, state) {
                if (state.status == UpcomingRideStatus.actionLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    useRootNavigator: true,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.status == UpcomingRideStatus.update) {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Close loading dialog
                  context
                      .read<AvailableRideBloc>()
                      .add(const AvailableRideEvent.refreshData());
                } else if (state.status == UpcomingRideStatus.error) {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Close loading dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorResponse?.message ??
                          "Failed to accept ride."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<AvailableRideBloc>()
                      .add(const AvailableRideEvent.refreshData());
                },
                child: CustomScrollView(
                  slivers: [
                    // Search bar
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverToBoxAdapter(
                        child: TextField(
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false)
                              _debounce!.cancel();
                            _debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              context.read<AvailableRideBloc>().add(
                                  AvailableRideEvent.searchData(query: value));
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: Colors.grey.shade500),
                            hintText: 'Search by driver location',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFF4CAF50), width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Filter chip / header
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.directions_car,
                                      size: 18, color: Color(0xFF4CAF50)),
                                  SizedBox(width: 8),
                                  Text('All Available Rides',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4CAF50))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Rides content
                    BlocBuilder<AvailableRideBloc, AvailableRideState>(
                      builder: (context, state) {
                        final rides = state.rides;

                        // Loading (initial)
                        if (state.status == AvailableRideStatus.loading &&
                            (rides == null || rides.isEmpty)) {
                          return SliverPadding(
                            padding: const EdgeInsets.all(16.0),
                            sliver: SliverList.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == 3 ? 0 : 16),
                                  child: RideCard(
                                    driverName: 'Loading Name',
                                    rating: 5.0,
                                    pickupLocation:
                                        'Loading Address Long Long Long',
                                    testCenterName: 'Loading Test Centre',
                                    testCenterAddress:
                                        'Loading Test Center Address',
                                    phoneNumber: '1234567890',
                                    time: 'Mon, 1 Jan at 00:00',
                                    roundTripKm: 40.0,
                                    price: r'$00.00',
                                    type: state.rides?[index].testType ?? "",
                                    onTap: () {},
                                    onAccept: () {},
                                  ),
                                );
                              },
                            ),
                          ).withSliverSkeleton(enabled: true);
                        }

                        // Error
                        if (state.status == AvailableRideStatus.error) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.error_outline,
                                      size: 48, color: Colors.redAccent),
                                  const SizedBox(height: 16),
                                  Text(
                                      state.errorResponse?.message ??
                                          'Something went wrong',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87)),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<AvailableRideBloc>().add(
                                          const AvailableRideEvent
                                              .refreshData());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4CAF50),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        // Empty
                        if (rides == null || rides.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.inbox_outlined,
                                      size: 64, color: Colors.grey.shade400),
                                  const SizedBox(height: 16),
                                  Text('No rides available right now.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600)),
                                ],
                              ),
                            ),
                          );
                        }

                        // List
                        return SliverPadding(
                          padding: const EdgeInsets.all(16.0),
                          sliver: SliverList.builder(
                            itemCount: rides.length,
                            itemBuilder: (context, index) {
                              final ride = rides[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: index == rides.length - 1 ? 0 : 16),
                                child: RideCard(
                                  driverName: ride.fullName ?? 'Unknown',
                                  rating: 4.8,
                                  // Shape decides whether a pickup leg is
                                  // drawn at all. Passing an empty string used
                                  // to render a "Pickup" label over nothing on
                                  // every meet-at-centre job.
                                  meetAtCentre: ride.isMeetAtCentre,
                                  // The distance `ride_price` was actually
                                  // computed from. Without it on the card the
                                  // price has no visible basis in a list.
                                  roundTripKm: ride.roundTripDistanceKm,
                                  pickupLocation: ride.pickupAddress ?? '',
                                  // Was also passed as `dropOffLocation`, so
                                  // the card printed this address twice.
                                  testCenterName: ride.testCenterName ?? '',
                                  testCenterAddress:
                                      ride.testCenterAddress ?? '',
                                  phoneNumber: ride.phoneNumber ?? "",
                                  // Rendered in the booking's timezone, not the
                                  // device's — a Vancouver instructor must not
                                  // see a Toronto test at the wrong hour.
                                  time: BookingTime.dayMonthTime(
                                      ride.testDate, ride.timezone),
                                  price: RideEarnings.estimate(
                                          ridePriceCents: ride.ridePrice)
                                      .amount,
                                  type: ride.testType ?? "",
                                  dateUnavailable: RideAvailability.clashes(
                                    ride,
                                    context
                                            .watch<UpcomingRideBloc>()
                                            .state
                                            .rides ??
                                        const <Ride>[],
                                  ),
                                  onTap: () {
                                    context.go(
                                      '${PagesName.availableRidesPage.path}/${PagesName.rideMapPage.path}',
                                      extra: ride,
                                    );
                                  },
                                  onAccept: () {
                                    context.read<UpcomingRideBloc>().add(
                                        UpcomingRideEvent.accept(id: ride.id));
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
