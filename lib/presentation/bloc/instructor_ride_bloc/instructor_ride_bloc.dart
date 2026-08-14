import 'package:bloc/bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/repository/user_repository.dart';
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
        emit(state.copyWith(status: InstructorRideStatus.stopSuccess));
        await Future.delayed(const Duration(milliseconds: 1000));
        add(const InstructorRideEvent.requestData());
      },
    );
  }

  Future<void> _onStartRide(
    _Start event,
    Emitter<InstructorRideState> emit,
  ) async {
    emit(state.copyWith(status: InstructorRideStatus.loading));
    await cacheManagerImpl.setTrackableRideId(rideId: event.id.toString());
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
      (_) async {
        emit(state.copyWith(status: InstructorRideStatus.startSuccess));
        await Future.delayed(const Duration(milliseconds: 1000));
        // refresh ride data after successful start
        add(const InstructorRideEvent.requestData());
      },
    );
  }
}
