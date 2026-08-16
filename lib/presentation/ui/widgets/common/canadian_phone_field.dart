import 'package:elan/core/validatator/canadian_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Phone input locked to Canada.
///
/// Elan operates in Canada only, so there is no country picker: the `+1` prefix
/// is fixed and non-interactive. A picker would be dead weight, and — because
/// Canada and the US share `+1` — it would also give a false sense that the
/// country had been constrained when it had not. The real constraint is the
/// area-code check in [CanadianPhone.validate].
///
/// The visible text is masked to `(416) 555-0134`; read [CanadianPhone.toE164]
/// off the controller to get the `+14165550134` the API expects. Never send the
/// raw controller text — it contains the mask punctuation.
class CanadianPhoneField extends StatelessWidget {
  const CanadianPhoneField({
    super.key,
    required this.controller,
    this.label = 'Contact Phone',
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.decoration,
  });

  final TextEditingController controller;
  final String label;
  final TextInputAction textInputAction;
  final bool enabled;
  final AutovalidateMode autovalidateMode;
  final ValueChanged<String>? onChanged;

  /// Adopt a host screen's field styling instead of the default.
  ///
  /// The prefix, hint and label are layered on top of whatever is passed, so a
  /// caller can match its own form without having to restate — or accidentally
  /// drop — the fixed `+1` marker.
  final InputDecoration? decoration;

  /// Seeds a controller from a stored value such as `+14165550134`, converting
  /// it to the masked form the field displays.
  ///
  /// Use this instead of `TextEditingController(text: apiValue)`: the raw E.164
  /// string would render unmasked and then get rewritten the moment the user
  /// typed, which looks like the field corrupting itself.
  static TextEditingController controllerFor(String? storedValue) =>
      TextEditingController(
        text: CanadianPhone.format(CanadianPhone.digitsOf(storedValue ?? '')),
      );

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      autofillHints: const [AutofillHints.telephoneNumberNational],
      autovalidateMode: autovalidateMode,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        const CanadianPhoneInputFormatter(),
      ],
      validator: CanadianPhone.validate,
      onChanged: onChanged,
      decoration: decoration?.copyWith(
            labelText: label,
            hintText: '(416) 555-0134',
            prefixIcon: const _CountryPrefix(),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
          ) ??
          InputDecoration(
            labelText: label,
            // A real example beats "enter your phone number" — it communicates the
            // expected shape without the user having to guess.
            hintText: '(416) 555-0134',
            labelStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey.shade100,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            // The fixed country marker. `prefixIcon` rather than `prefixText` so it
            // stays visible when the field is empty and unfocused.
            prefixIcon: const _CountryPrefix(),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            border: border.copyWith(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            disabledBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
            ),
            errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            ),
          ),
    );
  }
}

class _CountryPrefix extends StatelessWidget {
  const _CountryPrefix();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(CanadianPhone.flag, style: TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(
            CanadianPhone.countryCode,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(width: 10),
          // Hairline separating the fixed prefix from the editable part, so it
          // reads as a label rather than as text the user is expected to edit.
          Container(width: 1, height: 22, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
