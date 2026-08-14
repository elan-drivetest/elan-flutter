import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'date_picker_event.freezed.dart';

@freezed
class DatePickerEvent with _$DatePickerEvent {
  const factory DatePickerEvent.updateRangeSelection(PickerDateRange range) =
  UpdateRangeSelection;
  const factory DatePickerEvent.updateSingleDateSelection(DateTime selectedDate) =
  UpdateSingleDateSelection;
}
