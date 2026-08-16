import 'package:bloc/bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/repository/direction_repository.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/common/ride/ride_leg.dart';
import 'package:elan/domain/common/ride/ride_shape.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'ride_route_event.dart';
part 'ride_route_state.dart';
part 'ride_route_bloc.freezed.dart';

/// Builds every leg of a ride, so the map can show the journey rather than one
/// anonymous line.
///
/// `DirectionBloc` fetches a single origin→destination pair, which is why the
/// old map could only ever draw one segment and had to guess — from a 200 m
/// distance check — whether that segment meant "drive to the customer" or
/// "drive to the test centre". This assembles the legs explicitly instead
/// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §3, §11).
///
/// Legs are fetched concurrently and failures are per-leg: if the return leg
/// cannot be routed, the pickup run is still drawn.
@injectable
class RideRouteBloc extends Bloc<RideRouteEvent, RideRouteState> {
  final DirectionRepository repository;

  RideRouteBloc(this.repository) : super(const RideRouteState()) {
    on<_Build>(_onBuild);
  }

  Future<void> _onBuild(_Build event, Emitter<RideRouteState> emit) async {
    emit(state.copyWith(status: RideRouteStatus.loading));

    final ride = event.ride;
    final origin = event.currentPosition;

    // Both ride lists carry the centre's coordinates now (§14.2 fixed), so
    // [event.testCentre] is only an override for a caller that already has a
    // better fix — not the recovery path it used to be.
    final centre = event.testCentre ??
        ((ride.testCenterLatitude != null && ride.testCenterLongitude != null)
            ? LatLng(ride.testCenterLatitude!, ride.testCenterLongitude!)
            : null);

    final pickup = (ride.pickupLatitude != null && ride.pickupLongitude != null)
        ? LatLng(ride.pickupLatitude!, ride.pickupLongitude!)
        : null;

    // Shape B has no pickup run and no return — only the drive to the centre.
    final isMeetAtCentre = ride.isMeetAtCentre;
    final firstStop = isMeetAtCentre ? centre : (pickup ?? centre);

    final requests = <(RideLegKind, LatLng, LatLng)>[
      if (origin != null && firstStop != null)
        (RideLegKind.deadhead, origin, firstStop),
      if (!isMeetAtCentre && pickup != null && centre != null) ...[
        (RideLegKind.pickupRun, pickup, centre),
        (RideLegKind.returnRun, centre, pickup),
      ],
    ];

    if (requests.isEmpty) {
      AppLog.d('RideRouteBloc: nothing routable for booking ${ride.id}');
      emit(state.copyWith(
        status: RideRouteStatus.error,
        error: const ErrorResponse(
          message: 'Route unavailable — this booking has no coordinates yet.',
        ),
      ));
      return;
    }

    final results = await Future.wait(
      requests.map((r) async {
        final (kind, from, to) = r;
        final res =
            await repository.getDirections(origin: from, destination: to);
        return res.fold(
          (err) {
            AppLog.d('RideRouteBloc: ${kind.name} failed — ${err.message}');
            return null;
          },
          (data) => RideLeg(
            kind: kind,
            points: data.points,
            distanceText: data.distance,
            durationText: data.duration,
          ),
        );
      }),
    );

    final legs = results.whereType<RideLeg>().toList();

    emit(state.copyWith(
      status: legs.isEmpty ? RideRouteStatus.error : RideRouteStatus.success,
      legs: legs,
      error: legs.isEmpty
          ? const ErrorResponse(message: 'Could not calculate the route.')
          : null,
    ));
  }
}
