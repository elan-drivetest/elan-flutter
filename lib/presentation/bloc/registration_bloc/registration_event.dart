part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.send({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String address,
    required String drivingSchoolName,
    required String licenseNumber,
    required String licenseValidityDate,
    String? referralCode,
  }) = _Send;
}