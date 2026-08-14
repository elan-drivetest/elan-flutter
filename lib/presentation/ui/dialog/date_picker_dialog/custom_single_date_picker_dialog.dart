import 'package:elan/core/app_colors.dart';
import 'package:elan/presentation/ui/widgets/common/custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomSingleDatePickerDialog extends StatefulWidget {
  final DateTime? initialSelectedDate;
  final Function(DateRangePickerSelectionChangedArgs args) onSelectionChanged;
  final Function() onSubmit;
  final DateTime? maxDate;
  final DateTime? min;

  const CustomSingleDatePickerDialog({
    super.key,
    this.initialSelectedDate,
    required this.onSelectionChanged,
    required this.onSubmit,
    this.maxDate, this.min,
  });

  @override
  State<CustomSingleDatePickerDialog> createState() => _CustomSingleDatePickerDialogState();
}

class _CustomSingleDatePickerDialogState extends State<CustomSingleDatePickerDialog> {
  DateTime? selectedDate;
  DateRangePickerSelectionChangedArgs? selectionArgs;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialSelectedDate;
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectionArgs = args;
      selectedDate = args.value;
    });
    widget.onSelectionChanged(args);
  }

  @override
  Widget build(BuildContext context) {
    final isValid = selectedDate != null;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Optional close icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.grey),
                )
              ],
            ),
            SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: widget.initialSelectedDate,
              selectionColor: LightModeColor.buttonBackground.color,
              backgroundColor: Colors.white,
              todayHighlightColor: Theme.of(context).primaryColor,
              onSelectionChanged: _onSelectionChanged,
              minDate: widget.min,
              maxDate: widget.maxDate,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Opacity(
                opacity: isValid ? 1 : 0.5,
                child: CustomDialogButton(
                  title: 'OK',
                  onPress: isValid ? () {
                    widget.onSubmit();
                    Navigator.of(context).pop();
                  } : null,
                  color: LightModeColor.buttonBackground.color,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
