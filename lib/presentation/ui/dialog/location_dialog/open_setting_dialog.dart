import 'package:elan/core/styles.dart';
import 'package:elan/presentation/ui/widgets/common/custom_dialog_button.dart';
import 'package:elan/presentation/ui/widgets/common/custom_dialog_button_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OpenSettingDialog extends StatelessWidget {
  final VoidCallback open;
  final VoidCallback cancel;
  final String title;
  final String description;
  final String bTitle;

  const OpenSettingDialog(
      {super.key,
      required this.open,
      required this.cancel,
      required this.title,
      required this.description,
      required this.bTitle});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/alert_icon.svg",
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: sansDevanagariRegular16(color: Theme.of(context).primaryColorDark),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomDialogButtonWithBorder(
                      color: Theme.of(context).primaryColorDark,
                      onPress: cancel,
                      title: 'Cancel',
                      textColor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 6,
                    child: CustomDialogButton(
                      color: Theme.of(context).primaryColorDark,
                      onPress: open,
                      title: bTitle,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
