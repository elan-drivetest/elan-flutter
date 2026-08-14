import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'available_ride_event.dart';
part 'available_ride_state.dart';
part 'available_ride_bloc.freezed.dart';
part 'available_ride_bloc.g.dart';

@injectable
class AvailableRideBloc extends Bloc<AvailableRideEvent, AvailableRideState> {
  final UserRepository repository;

  String? cursor;
  String? currentQuery;

  AvailableRideBloc(this.repository) : super(const AvailableRideState()) {
    on<_RequestData>(_onRequestData);
    on<_RefreshData>(_onRefreshData);
    on<_SearchData>(_onSearchData);
  }

  Future<void> _onRequestData(
      _RequestData event,
      Emitter<AvailableRideState> emit,
      ) async {
    if (state.hasReachedMax) return;

    if (state.status == AvailableRideStatus.initial ||
        state.status == AvailableRideStatus.error) {
      // First load — replace the whole view with a full-screen spinner.
      emit(state.copyWith(status: AvailableRideStatus.loading));
    } else if (state.status == AvailableRideStatus.success) {
      // Subsequent pages — keep existing items visible, show a bottom spinner.
      emit(state.copyWith(status: AvailableRideStatus.paginating));
    }

    final result = (currentQuery != null && currentQuery!.isNotEmpty)
        ? await repository.searchAvailableRides(
            limit: 5, cursor: cursor, query: currentQuery!)
        : await repository.getAvailableRides(cursor: cursor, limit: 5);

    result.fold(
          (l) {
        emit(
          state.copyWith(
            errorResponse: l,
            hasReachedMax: false,
            status: AvailableRideStatus.error,
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
            status: AvailableRideStatus.success,
          ),
        );

        cursor = nextCursor;
      },
    );
  }

  Future<void> _onRefreshData(
      _RefreshData event,
      Emitter<AvailableRideState> emit,
      ) async {
    cursor = null;

    emit(const AvailableRideState());
    await Future.delayed(const Duration(milliseconds: 100));
    add(const AvailableRideEvent.requestData());
  }


  Future<void> _onSearchData(
    _SearchData event,
    Emitter<AvailableRideState> emit,
  ) async {
    cursor = null;
    currentQuery = event.query;
    emit(const AvailableRideState());
    add(const AvailableRideEvent.requestData());
  }
}
