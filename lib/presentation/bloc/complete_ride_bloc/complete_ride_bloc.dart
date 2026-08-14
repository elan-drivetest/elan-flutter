import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/complete_ride_response/complete_ride_response.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'complete_ride_event.dart';
part 'complete_ride_state.dart';
part 'complete_ride_bloc.freezed.dart';
part 'complete_ride_bloc.g.dart';

@injectable
class CompleteRideBloc extends Bloc<CompleteRideEvent, CompleteRideState> {
  final UserRepository repository;

  String? cursor;

  CompleteRideBloc(this.repository) : super(const CompleteRideState()) {
    on<_RequestData>(_onRequestData);
    on<_RefreshData>(_onRefreshData);
  }

  Future<void> _onRequestData(
      _RequestData event,
      Emitter<CompleteRideState> emit,
      ) async {
    if (state.hasReachedMax) return;

    if (state.status == CompleteRideStatus.initial ||
        state.status == CompleteRideStatus.error) {
      emit(state.copyWith(status: CompleteRideStatus.loading));
    } else if (state.status == CompleteRideStatus.success) {
      emit(state.copyWith(status: CompleteRideStatus.paginating));
    }

    final result = await repository.getCompletedRides(cursor: cursor, limit: 5);

    result.fold(
          (l) {
        emit(
          state.copyWith(
            errorResponse: l,
            hasReachedMax: false,
            status: CompleteRideStatus.error,
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

        emit(
          state.copyWith(
            rides: updatedRides,
            hasReachedMax: !hasMore,
            status: CompleteRideStatus.success,
          ),
        );

        cursor = nextCursor;
      },
    );
  }

  Future<void> _onRefreshData(
      _RefreshData event,
      Emitter<CompleteRideState> emit,
      ) async {
    cursor = null;
    emit(const CompleteRideState());
    await Future.delayed(const Duration(milliseconds: 100));
    add(const CompleteRideEvent.requestData());
  }
}
