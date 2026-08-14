import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/direction_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'direction_event.dart';
part 'direction_state.dart';
part 'direction_bloc.freezed.dart';

@injectable
class DirectionBloc extends Bloc<DirectionEvent, DirectionState> {
  final DirectionRepository repository;

  DirectionBloc(this.repository) : super(const DirectionState()) {
    on<_FetchDirections>(_onFetchDirections);
  }

  Future<void> _onFetchDirections(
    _FetchDirections event,
    Emitter<DirectionState> emit,
  ) async {
    log('🎯 DirectionBloc: Received fetchDirections event');
    log('📍 Origin: ${event.origin.latitude}, ${event.origin.longitude}');
    log('📍 Destination: ${event.destination.latitude}, ${event.destination.longitude}');

    emit(state.copyWith(status: DirectionStatus.loading));
    log('⏳ DirectionBloc: State changed to loading');

    final result = await repository.getDirections(
      origin: event.origin,
      destination: event.destination,
    );

    result.fold(
      (l) {
        log('❌ DirectionBloc: Error fetching directions');
        log('❌ Error message: ${l.message}');
        log('❌ Error details: $l');
        emit(state.copyWith(status: DirectionStatus.error, error: l));
      },
      (r) {
        log('✅ DirectionBloc: Successfully fetched directions');
        log('📍 Route points received: ${r.points.length}');
        log('📏 Distance: ${r.distance}');
        log('⏱️ Duration: ${r.duration}');
        if (r.points.isNotEmpty) {
          log('📍 First point: ${r.points.first.latitude}, ${r.points.first.longitude}');
          log('📍 Last point: ${r.points.last.latitude}, ${r.points.last.longitude}');
        }
        emit(state.copyWith(
          status: DirectionStatus.success,
          routePoints: r.points,
          distance: r.distance,
          duration: r.duration,
        ));
      },
    );
  }
}
