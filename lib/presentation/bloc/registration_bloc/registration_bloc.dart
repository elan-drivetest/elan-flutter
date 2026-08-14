import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/domain/register_error_response/register_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'registration_event.dart';
part 'registration_state.dart';
part 'registration_bloc.freezed.dart';
part 'registration_bloc.g.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthRepository repository;

  RegistrationBloc(this.repository) : super(const RegistrationState()) {
    on<_Send>(_onSend);
  }

  Future<void> _onSend(
    _Send event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(status: RegistrationStatus.loading));

    final result = await repository.register(
      fields: {
        "full_name": event.fullName,
        "email": event.email,
        "password": event.password,
        "phone_number": event.phoneNumber,
        "address": event.address,
        "driving_school_name": event.drivingSchoolName,
        "license_number": event.licenseNumber,
        "license_validity_date": event.licenseValidityDate,
        if (event.referralCode != null && event.referralCode!.isNotEmpty)
          "referral_code": event.referralCode!,
      },
    );

    result.fold(
      (RegisterErrorResponse error) {
        emit(
          state.copyWith(
            status: RegistrationStatus.error,
            errorResponse: error,
          ),
        );
      },
      (response) {
        final data = response.data;
        emit(
          state.copyWith(
            status: RegistrationStatus.success,
            message: data?['message']?.toString(),
            phoneHint: data?['phone_hint']?.toString(),
          ),
        );
      },
    );
  }
}
