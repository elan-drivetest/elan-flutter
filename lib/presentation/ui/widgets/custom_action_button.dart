import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/notification_icon.svg",
          width: 20,
          height: 20,
          fit: BoxFit.scaleDown,
        ));
  }
}
