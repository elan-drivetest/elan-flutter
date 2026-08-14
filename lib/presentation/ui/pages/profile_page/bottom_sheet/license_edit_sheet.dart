import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LicenseEditSheet extends StatefulWidget {
  const LicenseEditSheet(
      {super.key,
      required this.taxInfoDocUrl,
      required this.workEligibilityDocUrl,
      required this.instructorLicenseUrl,
      required this.drivingLicenseUrl,
      required this.licenseValidityDate,
      required this.licenseNumber,
      required this.drivingSchoolName});

  final String taxInfoDocUrl;
  final String workEligibilityDocUrl;
  final String instructorLicenseUrl;
  final String drivingLicenseUrl;
  final String licenseValidityDate;
  final String licenseNumber;
  final String drivingSchoolName;

  @override
  State<LicenseEditSheet> createState() => _LicenseEditSheetState();
}

class _LicenseEditSheetState extends State<LicenseEditSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _taxInfoDocController;
  late TextEditingController _workEligibilityDocController;
  late TextEditingController _instructorLicenseController;
  late TextEditingController _drivingLicenseController;
  late TextEditingController _licenseValidityDateController;
  late TextEditingController _licenseNumberController;
  late TextEditingController _drivingSchoolNameController;

  int _uploadingCount = 0;
  bool get _isUploading => _uploadingCount > 0;

  void _onUploadStarted() {
    setState(() {
      _uploadingCount++;
    });
  }

  void _onUploadFinished() {
    setState(() {
      if (_uploadingCount > 0) _uploadingCount--;
    });
  }

  @override
  void initState() {
    super.initState();
    _taxInfoDocController = TextEditingController(text: widget.taxInfoDocUrl);
    _workEligibilityDocController =
        TextEditingController(text: widget.workEligibilityDocUrl);
    _instructorLicenseController =
        TextEditingController(text: widget.instructorLicenseUrl);
    _drivingLicenseController =
        TextEditingController(text: widget.drivingLicenseUrl);
    _licenseValidityDateController =
        TextEditingController(text: widget.licenseValidityDate);
    _licenseNumberController = TextEditingController(text: widget.licenseNumber);
    _drivingSchoolNameController =
        TextEditingController(text: widget.drivingSchoolName);
  }

  @override
  void dispose() {
    _taxInfoDocController.dispose();
    _workEligibilityDocController.dispose();
    _instructorLicenseController.dispose();
    _drivingLicenseController.dispose();
    _licenseValidityDateController.dispose();
    _licenseNumberController.dispose();
    _drivingSchoolNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // For keyboard
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                Text("Edit License Details",
                    style: sansMedium24(color: Colors.black)),
                const SizedBox(height: 16),
                BlocProvider(
                  create: (context) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Tax Info Document (Pdf, Image)',
                    controller: _taxInfoDocController,
                    allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (context) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Work Eligibility Document (Pdf, Image)',
                    controller: _workEligibilityDocController,
                    allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (context) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Instructor License (Pdf, Image)',
                    controller: _instructorLicenseController,
                    allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (context) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Driving License (Pdf, Image)',
                    controller: _drivingLicenseController,
                    allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                _buildDatePickerField(
                  context: context,
                  controller: _licenseValidityDateController,
                  label: 'License Validity Date',
                  validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _licenseNumberController,
                  label: 'License Number',
                  validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _drivingSchoolNameController,
                  label: 'Driving School Name',
                  validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 54),
                    backgroundColor: _isUploading ? Colors.grey : const Color(0xFF4D8B55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isUploading ? null : _submitForm,
                  child: _isUploading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Text("Save License Details",
                          style: sansMedium24(color: Colors.white).copyWith(fontSize: 16)),
                ),
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
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
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
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildDatePickerField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        final initialDate = DateTime.tryParse(controller.text) ?? DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF4D8B55),
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          controller.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        }
      },
      decoration: InputDecoration(
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
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF4D8B55)),
      ),
      validator: validator,
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final params = <String, String>{
      "tax_info_doc_url": _taxInfoDocController.text.trim(),
      "work_eligibility_doc_url": _workEligibilityDocController.text.trim(),
      "instructor_license_url": _instructorLicenseController.text.trim(),
      "driving_license_url": _drivingLicenseController.text.trim(),
      "license_validity_date": _licenseValidityDateController.text.trim(),
      "license_number": _licenseNumberController.text.trim(),
      "driving_school_name": _drivingSchoolNameController.text.trim(),
    }..removeWhere((key, value) => value.isEmpty);

    if (params.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    context.read<InstructorInfoBloc>().add(
          InstructorInfoEvent.updateInfo(params: params),
        );

    Navigator.of(context).pop();
  }
}

class _UploadField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final List<String> allowedExtensions;
  final String? Function(String?)? validator;
  final VoidCallback? onUploadStarted;
  final VoidCallback? onUploadFinished;

  const _UploadField({
    required this.controller,
    required this.label,
    required this.allowedExtensions,
    required this.validator,
    this.onUploadStarted,
    this.onUploadFinished,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FileUploadBloc, FileUploadState>(
      listener: (context, state) {
        if (state.status == FileUploadStatus.loading) {
          onUploadStarted?.call();
        } else if (state.status == FileUploadStatus.success) {
          controller.text = state.response?.url ?? "";
          onUploadFinished?.call();
        } else if (state.status == FileUploadStatus.error) {
          onUploadFinished?.call();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorResponse?.message ?? "Upload failed."),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            onTap: state.status == FileUploadStatus.loading
                ? null
                : () async {
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: allowedExtensions,
                    );
                    if (context.mounted && result != null) {
                      context
                          .read<FileUploadBloc>()
                          .add(FileUploadEvent.send(file: result.files.single));
                    }
                  },
            decoration: InputDecoration(
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
              suffixIcon: state.status == FileUploadStatus.loading
                  ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF4D8B55)),
                ),
              )
                  : const Icon(Icons.upload_file, color: Color(0xFF4D8B55)),
            ),
            validator: validator,
          ),
        );
      },
    );
  }
}
