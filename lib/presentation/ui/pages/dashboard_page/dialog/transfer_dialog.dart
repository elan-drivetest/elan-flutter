import 'package:elan/presentation/ui/widgets/common/custom_dialog_button_with_border.dart';
import 'package:elan/presentation/ui/widgets/common/custom_dialog_button_with_loader.dart';
import 'package:flutter/material.dart';

class TransferDialog extends StatefulWidget {
  final TextEditingController reason;
  final Function() submit;
  final Function() cancel;

  const TransferDialog({
    super.key,
    required this.reason,
    required this.submit,
    required this.cancel,
  });

  @override
  State<TransferDialog> createState() => _TransferDialogState();
}

class _TransferDialogState extends State<TransferDialog> {
  final _formKey = GlobalKey<FormState>();

  void handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 12, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField(
                  controller: widget.reason,
                  label: "Reason",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please write your transfer reason.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomDialogButtonWithBorder(
                        color: Theme.of(context).primaryColorDark,
                        onPress: widget.cancel,
                        title: 'Close',
                        textColor: Colors.black,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: CustomDialogButtonWithLoader(
                        color: Color(0xFFFF0000),
                        onPress: handleSubmit,
                        title: 'Submit',
                        textColor: Colors.white,
                        showProgress: false,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          errorMaxLines: 3,
        ),
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
