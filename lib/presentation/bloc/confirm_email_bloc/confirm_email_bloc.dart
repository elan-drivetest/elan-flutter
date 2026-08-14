import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'confirm_email_event.dart';
part 'confirm_email_state.dart';
part 'confirm_email_bloc.freezed.dart';
part 'confirm_email_bloc.g.dart';

@injectable
class ConfirmEmailBloc extends Bloc<ConfirmEmailEvent, ConfirmEmailState> {
  final AuthRepository repository;

  ConfirmEmailBloc(this.repository) : super(const ConfirmEmailState()) {
    on<_ConfirmEmail>(_onConfirmEmail);
  }

  Future<void> _onConfirmEmail(
    _ConfirmEmail event,
    Emitter<ConfirmEmailState> emit,
  ) async {
    emit(state.copyWith(status: ConfirmEmailStatus.loading));

    final result = await repository.confirmEmail(hash: event.hash);

    result.fold(
      (l) => emit(state.copyWith(
        status: ConfirmEmailStatus.error,
        errorResponse: l,
        statusCode: l.statusCode,
      )),
      (r) {
        if (r.statusCode == 200) {
          emit(state.copyWith(
            status: ConfirmEmailStatus.success,
            statusCode: r.statusCode,
          ));
        } else {
          emit(state.copyWith(
            status: ConfirmEmailStatus.error,
            statusCode: r.statusCode,
          ));
        }
      },
    );
  }
}
