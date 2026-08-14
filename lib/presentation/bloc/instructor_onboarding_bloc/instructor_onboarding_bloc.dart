import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'instructor_onboarding_event.dart';
part 'instructor_onboarding_state.dart';
part 'instructor_onboarding_bloc.freezed.dart';
part 'instructor_onboarding_bloc.g.dart';

@injectable
class InstructorOnboardingBloc extends Bloc<InstructorOnboardingEvent, InstructorOnboardingState> {
  final UserRepository repository;

  InstructorOnboardingBloc(this.repository) : super(const InstructorOnboardingState()) {
    on<_GetInfo>(_onGetInfo);
    on<_OnboardVehicle>(_onOnboardVehicle);
  }

  Future<void> _onGetInfo(_GetInfo event, Emitter<InstructorOnboardingState> emit) async {
    emit(state.copyWith(status: InstructorOnboardingStatus.loading));

    final result = await repository.getInstructorInfo();

    result.fold(
          (l) => emit(state.copyWith(
          status: InstructorOnboardingStatus.error,
          errorResponse: l)),
          (r) => emit(state.copyWith(
          status: InstructorOnboardingStatus.success,
          response: r)),
    );
  }

  Future<void> _onOnboardVehicle(_OnboardVehicle event, Emitter<InstructorOnboardingState> emit) async {
    emit(state.copyWith(status: InstructorOnboardingStatus.loading));

    final result = await repository.updateVehicleInfo(params: event.params);

    result.fold(
      (l) => emit(state.copyWith(
          status: InstructorOnboardingStatus.error,
          errorResponse: l)),
      (_) async {
        // Refresh instructor info after vehicle onboarding
        final infoResult = await repository.getInstructorInfo();
        infoResult.fold(
          (l) => emit(state.copyWith(
              status: InstructorOnboardingStatus.error,
              errorResponse: l)),
          (r) => emit(state.copyWith(
              status: InstructorOnboardingStatus.success,
              response: r)),
        );
      },
    );
  }
}

