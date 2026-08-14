import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:elan/data/location_request_service/location_request_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRequestService _locationRequestService;

  LocationBloc(this._locationRequestService) : super(LocationState.initial()) {
    on<CheckLocationAccess>(_onCheckLocationAccess, transformer: restartable());
    on<CheckBackgroundPermissions>(_onCheckBackgroundPermissions,
        transformer: restartable());
    on<CheckAllPermissions>(_onCheckAllPermissions);
  }

  Future<void> _onCheckLocationAccess(
    CheckLocationAccess event,
    Emitter<LocationState> emit,
  ) async {
    if (event.fromBackground) {
      await Future.delayed(const Duration(seconds: 2));
    }
    emit(state.copyWith(
      status: LocationStatus.loading,
    ));

    try {
      var permission = await _locationRequestService.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await _locationRequestService.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        emit(state.copyWith(status: LocationStatus.permissionDenied));
        return;
      }
      if (permission == LocationPermission.deniedForever) {
        emit(
            state.copyWith(status: LocationStatus.permissionPermanentlyDenied));
        return;
      }

      final gpsOn = await _locationRequestService.isLocationServiceEnabled();
      if (!gpsOn) {
        emit(state.copyWith(status: LocationStatus.gpsDisabled));
        return;
      }

      final result = await _locationRequestService.getCurrentLocation().timeout(
          Duration(seconds: event.fromBackground ? 20 : 10), onTimeout: () {
        return left<String?, Position>("Location timed out");
      });

      result.fold(
        (err) => emit(state.copyWith(
          status: LocationStatus.failure,
          errorMessage: err ?? "Failed to get location.",
        )),
        (location) => emit(state.copyWith(
          status: LocationStatus.success,
          location: location,
          shouldStart: event.isRideRequest,
          rideId: event.rideId,
        )),
      );
    } on TimeoutException {
      emit(state.copyWith(
        status: LocationStatus.failure,
        errorMessage: "Location timed out",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LocationStatus.failure,
        errorMessage: "Location unavailable right now. Please refresh to try again.",
      ));
    }
  }

  Future<void> _onCheckBackgroundPermissions(
    CheckBackgroundPermissions event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(
      status: LocationStatus.loading,
    ));

    try {
      // Step 1: Check and request notification permission
      final notify =
          await _locationRequestService.checkNotificationPermission();
      if (notify != NotificationPermission.granted) {
        final requested =
            await _locationRequestService.requestNotificationPermission();
        if (requested != NotificationPermission.granted) {
          emit(state.copyWith(
            status: LocationStatus.backgroundPermissionNotGranted,
            errorMessage: "Notification permission not granted.",
          ));
          return;
        }
      }

      // Step 2: Check and request background location permission ("Allow all the time")
      final hasBackground = await _locationRequestService.hasBackgroundPermission();
      if (!hasBackground) {
        // First ensure we have foreground permission
        var permission = await _locationRequestService.checkPermission();
        
        if (permission == LocationPermission.denied || 
            permission == LocationPermission.deniedForever) {
          permission = await _locationRequestService.requestPermission();
        }
        
        // If we have foreground permission, request background permission
        if (permission == LocationPermission.whileInUse) {
          final backgroundGranted = await _locationRequestService.requestBackgroundPermission();
          if (!backgroundGranted) {
            emit(state.copyWith(
              status: LocationStatus.backgroundPermissionNotGranted,
              errorMessage: "Background location permission not granted. Please enable 'Allow all the time' in location settings.",
            ));
            return;
          }
        } else if (permission != LocationPermission.always) {
          emit(state.copyWith(
            status: LocationStatus.backgroundPermissionNotGranted,
            errorMessage: "Location permission is required. Please grant location access first.",
          ));
          return;
        }
      }

      // Step 3: Request battery optimization exemption
      final ignored =
          await _locationRequestService.requestIgnoreBatteryOptimization();
      if (!ignored) {
        emit(state.copyWith(
          status: LocationStatus.backgroundPermissionNotGranted,
          errorMessage:
              "Battery optimizations not disabled / exact alarms not allowed.",
        ));
        return;
      }

      emit(state.copyWith(status: LocationStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: LocationStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCheckAllPermissions(
    CheckAllPermissions event,
    Emitter<LocationState> emit,
  ) async {
    // Run sequentially: background permissions first, then foreground location
    // access. Dispatching both at once caused concurrent permission dialogs
    // which can be silently dismissed on some platforms.
    await _onCheckBackgroundPermissions(
      const CheckBackgroundPermissions(),
      emit,
    );
    await _onCheckLocationAccess(
      const CheckLocationAccess(),
      emit,
    );
  }
}
