import 'package:bloc/bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'dart:convert';

import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/ride_session/ride_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'instructor_ride_event.dart';
part 'instructor_ride_state.dart';
part 'instructor_ride_bloc.freezed.dart';
part 'instructor_ride_bloc.g.dart';

@injectable
class InstructorRideBloc
    extends Bloc<InstructorRideEvent, InstructorRideState> {
  final UserRepository repository;
  final CacheManagerImpl cacheManagerImpl;

  InstructorRideBloc(this.repository, this.cacheManagerImpl)
      : super(const InstructorRideState()) {
    on<_RequestData>(_onRequestData);
    on<_Stop>(_onStopRide);
    on<_Start>(_onStartRide);
  }

  Future<void> _onRequestData(
    _RequestData event,
    Emitter<InstructorRideState> emit,
  ) async {
    emit(state.copyWith(status: InstructorRideStatus.loading));

    final result = await repository.getCurrentActiveRide();

    result.fold(
          (l) {
        // No active ride (backend returns "" or 404)
        if (l.statusCode == 404 ||
            (l.message?.toLowerCase().contains('no active ride') ?? false)) {
          emit(state.copyWith(
            currentRide: null,
            status: InstructorRideStatus.empty, // 👈 add this enum
            errorResponse: null,
          ));
          return;
        }

        // Real error case
        emit(state.copyWith(
          errorResponse: l,
          status: InstructorRideStatus.error,
        ));
      },
          (r) {
        AppLog.d("check_ride -> ${r.id}");
        cacheManagerImpl.setTrackableRideId(
          rideId: r.id.toString(),
        );

        emit(state.copyWith(
          currentRide: r,
          status: InstructorRideStatus.success,
          errorResponse: null,
        ));
      },
    );
  }

  Future<void> _onStopRide(
    _Stop event,
    Emitter<InstructorRideState> emit,
  ) async {
    emit(state.copyWith(status: InstructorRideStatus.loading));

    final result = await repository.stopRide(
      id: event.rideId,
      lat: event.lat, lon: event.lot, // assuming 'lot' is longitude
    );

    await result.fold(
      (l) async {
        emit(state.copyWith(
            status: InstructorRideStatus.error, errorResponse: l));
        await Future.delayed(const Duration(milliseconds: 100));
        add(const InstructorRideEvent.requestData());
      },
      (r) async {
        await cacheManagerImpl.clearTrackableRideId();
        await cacheManagerImpl.clearActiveBooking();
        emit(state.copyWith(status: InstructorRideStatus.stopSuccess));
        await Future.delayed(const Duration(milliseconds: 1000));
        add(const InstructorRideEvent.requestData());
      },
    );
  }

  /// Pulls the ride-session id out of a `/rides/start` response body.
  ///
  /// Tolerant of shape because the endpoint returns a raw `Response` here, and
  /// `id` arrives as an int while every decimal on the same object arrives as a
  /// string (§12.2) — so don't assume the type.
  static int? _sessionIdOf(dynamic data) {
    if (data is! Map) return null;
    final raw = data['id'];
    if (raw is int) return raw;
    if (raw is num) return raw.toInt();
    return int.tryParse(raw?.toString() ?? '');
  }

  Future<void> _onStartRide(
    _Start event,
    Emitter<InstructorRideState> emit,
  ) async {
    emit(state.copyWith(status: InstructorRideStatus.loading));

    // `event.id` is the BOOKING id — that is what /rides/start takes. It used
    // to be written straight into the ride-session cache key, so the background
    // tracker then posted it as `ride_session_id` on every breadcrumb until the
    // next dashboard refresh happened to overwrite it. The session id is only
    // knowable from the start response, so it is recorded after the call.
    final booking = event.booking;
    if (booking != null) {
      try {
        await cacheManagerImpl.setActiveBooking(
          rawJson: jsonEncode(booking.toJson()),
        );
      } catch (e) {
        AppLog.e('Failed to cache the active booking', error: e);
      }
    }

    final result = await repository.startRide(
      bookingId: event.id!,
      latitude: event.lat!,
      longitude: event.lot!, // ✅ fixed
      accuracy: event.accuracy ?? 0.0,
      speed: event.speed ?? 0.0,
      bearing: event.bearing ?? 0.0,
      altitude: event.altitude ?? 0.0,
      batteryLevel: event.batteryLevel ?? 0,
      timezone: event.timezone ?? DateTime.now().timeZoneName,
    );

    await result.fold(
      (error) async {
        await cacheManagerImpl.clearTrackableRideId();
        await cacheManagerImpl.clearActiveBooking();
        emit(
          state.copyWith(
            status: InstructorRideStatus.error,
            errorResponse: error,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 100));
        // refresh ride data after successful start
        add(const InstructorRideEvent.requestData());
      },
      (response) async {
        // /rides/start returns the RideSession (§8.4). Its `id` is the only
        // thing location tracking may use, so capture it here rather than
        // waiting for the next /rides/current poll to correct the cache.
        final sessionId = _sessionIdOf(response.data);
        if (sessionId != null) {
          await cacheManagerImpl.setTrackableRideId(
            rideId: sessionId.toString(),
          );
        } else {
          // Shouldn't happen, but tracking with a stale id is worse than not
          // tracking — requestData() below will repopulate it from /current.
          AppLog.e('start response carried no session id: ${response.data}');
          await cacheManagerImpl.clearTrackableRideId();
        }
        emit(state.copyWith(status: InstructorRideStatus.startSuccess));
        await Future.delayed(const Duration(milliseconds: 1000));
        // refresh ride data after successful start
        add(const InstructorRideEvent.requestData());
      },
    );
  }
}
