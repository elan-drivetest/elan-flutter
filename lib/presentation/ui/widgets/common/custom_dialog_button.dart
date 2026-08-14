import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton(
      {super.key,
      required this.title,
      required this.color,
      required this.onPress,
      required this.textColor});
  final String title;
  final Color color;
  final Color textColor;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.045,
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: color,
            )),
        onPressed: onPress,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: textColor),
          ),
        ));
  }
}
