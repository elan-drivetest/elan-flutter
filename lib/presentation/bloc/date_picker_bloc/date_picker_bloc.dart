import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:injectable/injectable.dart';
import 'date_picker_event.dart';
import 'date_picker_state.dart';

@injectable
class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(const DatePickerState()) {
    on<UpdateRangeSelection>((event, emit) {
      // Important: Only emit if new value is different
      AppLog.d("check_range ->${event.range.startDate?.toIso8601String()} == ${event.range.endDate?.toIso8601String()}");
      if (event.range != state.selectedRange) {
        emit(state.copyWith(selectedRange: event.range));
      }
    });
    on<UpdateSingleDateSelection>(
            (event, emit) => emit(state.copyWith(selectedDate: event.selectedDate)));
  }
}
