import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'date_picker_state.freezed.dart';

@freezed
class DatePickerState with _$DatePickerState {
  const factory DatePickerState({
    PickerDateRange? selectedRange,
    DateTime? selectedDate,
  }) = _DatePickerState;
}
