import 'package:bloc/bloc.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'upcoming_ride_event.dart';
part 'upcoming_ride_state.dart';
part 'upcoming_ride_bloc.freezed.dart';
part 'upcoming_ride_bloc.g.dart';

@injectable
class UpcomingRideBloc extends Bloc<UpcomingRideEvent, UpcomingRideState> {
  final UserRepository repository;
  final CacheManagerImpl cacheManagerImpl;

  String? cursor;

  UpcomingRideBloc(this.repository, this.cacheManagerImpl)
      : super(const UpcomingRideState()) {
    on<_RequestData>(_onRequestData);
    on<_RefreshData>(_onRefreshData);

    on<_Accept>(_onAcceptRide);
    on<_Transfer>(_onTransferRide);
  }

  Future<void> _onAcceptRide(
    _Accept event,
    Emitter<UpcomingRideState> emit,
  ) async {
    emit(state.copyWith(status: UpcomingRideStatus.actionLoading));

    final result = await repository.acceptRide(id: event.id);

    // `fold` MUST be awaited. Its callbacks are async, so it returns a future;
    // dropping that future ends the handler immediately and any `emit` after an
    // `await` inside a callback then fires post-completion, which bloc asserts
    // on. That is not hypothetical here: the success branch writes to the cache
    // before it emits, so accepting a ride threw
    // `emit was called after an event handler completed normally`, the `update`
    // state never arrived, and the job board's loading dialog — which is
    // dismissed on `update` — sat there forever.
    await result.fold(
      (l) async {
        if (emit.isDone) return;
        emit(
            state.copyWith(status: UpcomingRideStatus.error, errorResponse: l));
      },
      (r) async {
        // The accept response is the new RideSession (§8.2). Only its id is
        // worth keeping — it is what /location-tracking and /stop expect. The
        // booking id used to be cached alongside it because no RideSession
        // response returned one; every response carries `booking_id` now
        // (§14.4 fixed), so there is no link left for the app to hold.
        final sessionId = r.id;
        if (sessionId != null) {
          await cacheManagerImpl.setTrackableRideId(
            rideId: sessionId.toString(),
          );
        }
        if (emit.isDone) return;
        emit(state.copyWith(status: UpcomingRideStatus.update));
      },
    );

    await _refreshAfter(const Duration(milliseconds: 600));
  }

  /// Re-fetch the list once the UI has had time to react to the terminal state.
  ///
  /// Hoisted out of the fold branches so the delay runs inside the handler
  /// rather than in a future nobody holds — and guarded on [isClosed], because
  /// the instructor can navigate away during it.
  Future<void> _refreshAfter(Duration delay) async {
    await Future.delayed(delay);
    if (isClosed) return;
    add(const UpcomingRideEvent.refreshData());
  }

  Future<void> _onTransferRide(
    _Transfer event,
    Emitter<UpcomingRideState> emit,
  ) async {
    emit(state.copyWith(status: UpcomingRideStatus.actionLoading));

    final result = await repository.transferRide(
      id: event.id,
      reason: event.reason,
    );

    // Same shape as accept. This one happens to emit before its first `await`,
    // so it works today — but only by accident of statement order.
    await result.fold(
      (l) async {
        if (emit.isDone) return;
        emit(
            state.copyWith(status: UpcomingRideStatus.error, errorResponse: l));
      },
      (r) async {
        if (emit.isDone) return;
        emit(state.copyWith(status: UpcomingRideStatus.update));
      },
    );

    await _refreshAfter(const Duration(milliseconds: 100));
  }

  Future<void> _onRequestData(
    _RequestData event,
    Emitter<UpcomingRideState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.status == UpcomingRideStatus.initial ||
        state.status == UpcomingRideStatus.error) {
      emit(state.copyWith(status: UpcomingRideStatus.loading));
    }

    final result = await repository.getUpcomingRides(limit: 50);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorResponse: l,
            hasReachedMax: false,
            status: UpcomingRideStatus.error,
          ),
        );
      },
      (r) {
        final items = r.data ?? [];
        final nextCursor = r.meta?.nextCursor;
        final hasMore = r.meta?.hasNextPage ?? false;

        final updatedRides = [
          ...?state.rides,
          ...items,
        ];

        if (updatedRides.isNotEmpty) {
          emit(
            state.copyWith(
              rides: updatedRides,
              hasReachedMax: !hasMore,
              status: UpcomingRideStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              rides: updatedRides,
              hasReachedMax: !hasMore,
              status: UpcomingRideStatus.empty,
            ),
          );
        }

        cursor = nextCursor;
      },
    );
  }

  Future<void> _onRefreshData(
    _RefreshData event,
    Emitter<UpcomingRideState> emit,
  ) async {
    cursor = null;
    emit(const UpcomingRideState());
    await Future.delayed(const Duration(milliseconds: 100));
    add(const UpcomingRideEvent.requestData());
  }
}
