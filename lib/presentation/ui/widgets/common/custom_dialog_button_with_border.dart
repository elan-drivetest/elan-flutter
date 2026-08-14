import 'package:flutter/material.dart';

class CustomDialogButtonWithBorder extends StatelessWidget {
  const CustomDialogButtonWithBorder(
      {super.key,
      required this.title,
      required this.color,
      required this.onPress,
      required this.textColor});
  final String title;
  final Color color;
  final Color textColor;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.04,
        elevation: 0,
        color: Colors.white,
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
