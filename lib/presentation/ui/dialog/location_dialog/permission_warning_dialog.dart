import 'package:elan/core/styles.dart';
import 'package:elan/presentation/ui/widgets/common/custom_dialog_button_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PermissionWarningDialog extends StatelessWidget {
  final Function() close;
  final String message;

  const PermissionWarningDialog(
      {super.key, required this.close, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 12, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/alert_icon.svg",
                    width: 36,
                    height: 36,
                    fit: BoxFit.fill,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Location Services Disabled",
                    style: sansDevanagariRegular16(color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                message,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 120,
                child: CustomDialogButtonWithBorder(
                  color: Theme.of(context).primaryColorDark,
                  onPress: close,
                  title: 'OK',
                  textColor: Theme.of(context).primaryColorDark,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
