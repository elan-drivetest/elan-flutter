import 'package:elan/core/styles.dart';
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
    _phoneController = TextEditingController(text: widget.phone);
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

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final Map<String, String> params = {};

    if (_nameController.text.trim() != widget.name) {
      params["full_name"] = _nameController.text.trim();
    }

    if (_emailController.text.trim() != widget.mail) {
      params["email"] = _emailController.text.trim();
    }

    if (_phoneController.text.trim() != widget.phone) {
      params["phone_number"] = _phoneController.text.trim();
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
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration("Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _phoneController,
                  decoration: _inputDecoration("Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _addressController,
                  decoration: _inputDecoration("Address"),
                  maxLines: 2,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
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
                    style: sansMedium24(color: Colors.white).copyWith(fontSize: 16),
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