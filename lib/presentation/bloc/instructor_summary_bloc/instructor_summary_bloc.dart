import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/instructor_summary_response/instructor_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'instructor_summary_event.dart';
part 'instructor_summary_state.dart';
part 'instructor_summary_bloc.freezed.dart';

@injectable
class InstructorSummaryBloc
    extends Bloc<InstructorSummaryEvent, InstructorSummaryState> {
  final UserRepository repository;

  InstructorSummaryBloc(this.repository)
      : super(const InstructorSummaryState()) {
    on<_GetSummary>(_onGetSummary);
  }

  Future<void> _onGetSummary(
    _GetSummary event,
    Emitter<InstructorSummaryState> emit,
  ) async {
    emit(state.copyWith(status: InstructorSummaryStatus.loading));

    final result = await repository.getInstructorDashboardSummary();

    result.fold(
      (l) => emit(
        state.copyWith(
          status: InstructorSummaryStatus.error,
          errorResponse: l,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: InstructorSummaryStatus.success,
          summaryInfo: r,
        ),
      ),
    );
  }
}
