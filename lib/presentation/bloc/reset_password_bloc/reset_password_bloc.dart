import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/public_repository.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';
part 'reset_password_bloc.g.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final PublicRepository repository;

  ResetPasswordBloc(this.repository) : super(const ResetPasswordState()) {
    on<_Reset>(_onReset);
    on<_SubmitNewPassword>(_onSubmitNewPassword);
  }

  Future<void> _onReset(_Reset event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await repository.forgetPassword(email: event.email);

    result.fold(
      (l) => emit(
          state.copyWith(status: ResetPasswordStatus.error, errorResponse: l)),
      (r) {
        final data = r.data;
        emit(state.copyWith(
          status: ResetPasswordStatus.success,
          statusCode: r.statusCode,
          message: data?['message']?.toString(),
          phoneHint: data?['phone_hint']?.toString(),
        ));
      },
    );
  }

  Future<void> _onSubmitNewPassword(_SubmitNewPassword event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await repository.submitNewPassword(hash: event.hash, newPassword: event.password);

    result.fold(
      (l) => emit(
          state.copyWith(status: ResetPasswordStatus.error, errorResponse: l)),
      (r) {
        emit(state.copyWith(
          status: ResetPasswordStatus.success,
          statusCode: r.statusCode,
        ));
      },
    );
  }
}
