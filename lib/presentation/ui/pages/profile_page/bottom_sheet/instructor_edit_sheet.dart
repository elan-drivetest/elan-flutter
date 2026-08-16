import 'package:elan/core/styles.dart';
import 'package:elan/core/validatator/canadian_phone.dart';
import 'package:elan/presentation/ui/pages/place_picker_page/place_picker_page.dart';
import 'package:elan/presentation/ui/widgets/common/canadian_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';

class InstructorEditSheet extends StatefulWidget {
  const InstructorEditSheet({
    super.key,
    required this.name,
    required this.mail,
    required this.phone,
    required this.address,
  });

  final String name;
  final String mail;
  final String phone;
  final String address;

  @override
  State<InstructorEditSheet> createState() => _InstructorEditSheetState();
}

class _InstructorEditSheetState extends State<InstructorEditSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.mail);
    // The API stores E.164 ("+14165550134") but the field displays a mask, so
    // seed it through the formatter instead of assigning the raw value.
    _phoneController = CanadianPhoneField.controllerFor(widget.phone);
    _addressController = TextEditingController(text: widget.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4D8B55), width: 1.5),
      ),
    );
  }

  Future<void> _pickAddress() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        // Open on the address they already have, so a correction is a nudge
        // rather than a hunt across the country view.
        builder: (_) => PlacePickerPage(
          initialAddress: _addressController.text.trim(),
        ),
      ),
    );
    // The picker is a full-screen route pushed over this sheet, so the sheet
    // can be gone by the time it returns.
    if (!mounted) return;
    if (result != null && result.trim().isNotEmpty) {
      setState(() => _addressController.text = result.trim());
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final Map<String, String> params = {};

    if (_nameController.text.trim() != widget.name) {
      params["full_name"] = _nameController.text.trim();
    }

    if (_emailController.text.trim() != widget.mail) {
      params["email"] = _emailController.text.trim();
    }

    // Compare and send the normalised form, never the masked text. The field
    // shows "(416) 555-0134" while the API stores "+14165550134", so a direct
    // string compare would report a change on every open and then PATCH the
    // punctuation straight into the record.
    final phoneE164 = CanadianPhone.toE164(_phoneController.text);
    if (phoneE164 != null && phoneE164 != CanadianPhone.toE164(widget.phone)) {
      params["phone_number"] = phoneE164;
    }

    if (_addressController.text.trim() != widget.address) {
      params["address"] = _addressController.text.trim();
    }

    if (params.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    context.read<InstructorInfoBloc>().add(
          InstructorInfoEvent.updateInfo(params: params),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Text(
                  "Edit Instructor Info",
                  style: sansMedium24(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration("Full Name"),
                  validator: (v) => v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration("Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),
                CanadianPhoneField(
                  controller: _phoneController,
                  label: "Phone Number",
                  // Adopt this sheet's field styling rather than the signup
                  // form's, so the prefix is the only visible difference.
                  decoration: _inputDecoration("Phone Number"),
                ),
                const SizedBox(height: 12),
                // Address is chosen on the map, never typed — same as signup.
                // Free text here would let an instructor save something that
                // cannot be geocoded, and pickup distance (and therefore the
                // fare) is computed from this address server-side.
                TextFormField(
                  controller: _addressController,
                  decoration: _inputDecoration("Address").copyWith(
                    suffixIcon: const Icon(
                      Icons.map_outlined,
                      color: Color(0xFF4D8B55),
                    ),
                    helperText: "Tap to choose on the map",
                  ),
                  maxLines: 2,
                  readOnly: true,
                  onTap: _pickAddress,
                  validator: (v) => v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 54),
                    backgroundColor: const Color(0xFF4D8B55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _onSave,
                  child: Text(
                    "Save",
                    style: sansMedium24(color: Colors.white)
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
