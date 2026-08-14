import 'package:bloc/bloc.dart';
import 'package:elan/core/extension/profile_complete_check.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'instructor_info_event.dart';
part 'instructor_info_state.dart';
part 'instructor_info_bloc.freezed.dart';
part 'instructor_info_bloc.g.dart';

@injectable
class InstructorInfoBloc
    extends Bloc<InstructorInfoEvent, InstructorInfoState> {
  final UserRepository repository;

  InstructorInfoBloc(this.repository) : super(const InstructorInfoState()) {
    on<_GetInfo>(_onGetInfo);
    on<_UpdateInfo>(_onUpdateInfo);
    on<_UpdateVehicleInfo>(_onUpdateVehicleInfo);
  }

  Future<void> _onGetInfo(
    _GetInfo event,
    Emitter<InstructorInfoState> emit,
  ) async {
    emit(state.copyWith(status: InstructorInfoStatus.loading));

    final result = await repository.getInstructorInfo();

    result.fold(
      (l) => emit(
        state.copyWith(
          status: InstructorInfoStatus.error,
          errorResponse: l,
        ),
      ),
      (r) => _emitSuccessFromResponse(emit, r),
    );
  }

  Future<void> _onUpdateInfo(
    _UpdateInfo event,
    Emitter<InstructorInfoState> emit,
  ) async {
    emit(state.copyWith(status: InstructorInfoStatus.actionLoading));

    final result = await repository.updateInstructorInfo(params: event.params);

    result.fold(
      (l) async {
        emit(
          state.copyWith(
            status: InstructorInfoStatus.error,
            errorResponse: l,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 100));
        add(const InstructorInfoEvent.getInfo());
      },
      (r) async {
        emit(state.copyWith(status: InstructorInfoStatus.updateSuccess));
        await Future.delayed(const Duration(milliseconds: 100));
        add(const InstructorInfoEvent.getInfo());
      },
    );
  }

  Future<void> _onUpdateVehicleInfo(
    _UpdateVehicleInfo event,
    Emitter<InstructorInfoState> emit,
  ) async {
    emit(state.copyWith(status: InstructorInfoStatus.actionLoading));

    final result = await repository.updateVehicleInfo(params: event.params);

    result.fold(
      (l) async {
        emit(
          state.copyWith(
            status: InstructorInfoStatus.error,
            errorResponse: l,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 100));
        add(const InstructorInfoEvent.getInfo());
      },
      (r) async {
        emit(state.copyWith(status: InstructorInfoStatus.updateSuccess));
        await Future.delayed(const Duration(milliseconds: 100));
        add(const InstructorInfoEvent.getInfo());
      },
    );
  }

  void _emitSuccessFromResponse(
    Emitter<InstructorInfoState> emit,
    InstructorResponse r,
  ) {
    final instructor = r.instructor;
    final vehicle = r.vehicle;

    emit(state.copyWith(
      status: InstructorInfoStatus.success,
      profileCompletePercentage: instructor?.profileCompletionPercentage ?? 0,
      userInfo: r.user,
      instructorInfo: instructor,
      vehicleInfo: vehicle,
      licenseStatus: (instructor?.isLicenseIncomplete ?? true)
          ? LicenseInfoStatus.incomplete
          : LicenseInfoStatus.complete,
      paymentStatus: (instructor?.isPaymentInfoIncomplete ?? true)
          ? PaymentInfoStatus.incomplete
          : PaymentInfoStatus.complete,
      vehicleStatus: (vehicle?.isVehicleInfoIncomplete ?? true)
          ? CarInfoStatus.incomplete
          : CarInfoStatus.complete,
    ));
  }
}
