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

  String? cursor;

  UpcomingRideBloc(this.repository,) : super(const UpcomingRideState()) {
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

    result.fold(
      (l) async {
        emit(
            state.copyWith(status: UpcomingRideStatus.error, errorResponse: l));
        await Future.delayed(const Duration(milliseconds: 600));
        add(const UpcomingRideEvent.refreshData());
      },
      (r) async {
        emit(state.copyWith(status: UpcomingRideStatus.update));
        await Future.delayed(const Duration(milliseconds: 600));
        add(const UpcomingRideEvent.refreshData());
      },
    );
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

    result.fold(
      (l) async {
        emit(
            state.copyWith(status: UpcomingRideStatus.error, errorResponse: l));
        await Future.delayed(const Duration(milliseconds: 100));
        add(const UpcomingRideEvent.refreshData());
      },
      (r) async {
        emit(state.copyWith(status: UpcomingRideStatus.update));
        await Future.delayed(const Duration(milliseconds: 100));
        add(const UpcomingRideEvent.refreshData());
      },
    );
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
