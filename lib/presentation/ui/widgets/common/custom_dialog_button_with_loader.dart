import 'package:elan/presentation/ui/widgets/common/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomDialogButtonWithLoader extends StatelessWidget {
  const CustomDialogButtonWithLoader(
      {super.key,
      required this.title,
      required this.color,
      required this.onPress,
      required this.textColor,
      required this.showProgress});
  final String title;
  final Color color;
  final Color textColor;
  final bool showProgress;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.04,
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: color,
            )),
        onPressed: onPress,
        child: Center(
          child: showProgress == true
              ? const CustomProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
        ));
  }
}
