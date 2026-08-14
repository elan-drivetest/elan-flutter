import 'package:elan/core/styles.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:elan/presentation/bloc/date_picker_bloc/date_picker_event.dart';
import 'package:elan/presentation/bloc/date_picker_bloc/date_picker_state.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/ui/dialog/date_picker_dialog/custom_single_date_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_format/date_format.dart';

class AddLicensePage extends StatefulWidget {
  const AddLicensePage({super.key, required this.instructorInfo});
  final Instructor? instructorInfo;

  @override
  State<AddLicensePage> createState() => _AddLicensePageState();
}

class _AddLicensePageState extends State<AddLicensePage> {
  final _formKey = GlobalKey<FormState>();

  final _licenseNumberController = TextEditingController();
  final _validityDateController = TextEditingController();
  final _drivingLicenseUrlController = TextEditingController();
  final _instructorLicenseUrlController = TextEditingController();
  final _workEligibilityDocUrlController = TextEditingController();
  final _taxInfoDocUrlController = TextEditingController();

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
    _licenseNumberController.text = widget.instructorInfo?.licenseNumber ?? "";
    //_validityDateController.text = widget.instructorInfo?.licenseValidityDate ?? "";
    _drivingLicenseUrlController.text = widget.instructorInfo?.drivingLicenseUrl ?? "";
    _instructorLicenseUrlController.text = widget.instructorInfo?.instructorLicenseUrl ?? "";
    _workEligibilityDocUrlController.text = widget.instructorInfo?.workEligibilityDocUrl ?? "";
    _taxInfoDocUrlController.text =
        widget.instructorInfo?.taxInfoDocUrl ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _licenseNumberController.dispose();
    _validityDateController.dispose();
    _drivingLicenseUrlController.dispose();
    _instructorLicenseUrlController.dispose();
    _workEligibilityDocUrlController.dispose();
    _taxInfoDocUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Navigator.canPop(context) ? IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ) : null,
        title: Text(
          'License Info',
          style: ibmPlexSerifH5Style(color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<InstructorInfoBloc, InstructorInfoState>(
          listener: (context, state) {
            if (state.status == InstructorInfoStatus.updateSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("License info has been stored."),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }
            if (state.status == InstructorInfoStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text(state.errorResponse?.message ?? "Upload failed."),
                  backgroundColor: Colors.redAccent,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.status == InstructorInfoStatus.actionLoading;
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                        _buildTextFormField(
                          controller: _licenseNumberController,
                          label: 'License Number',
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your license number.';
                            }
                            return null;
                          },
                        ),
                        BlocConsumer<DatePickerBloc, DatePickerState>(
                          listener: (context, state) {
                            if (state.selectedDate != null) {
                              final formattedDate = formatDate(
                                  state.selectedDate!,
                                  [yyyy, '-', mm, '-', dd]);
                              _validityDateController.text = formattedDate;
                            }
                          },
                          builder: (context, state) {
                            return _buildDateFormField(
                              controller: _validityDateController,
                              keyboardType: TextInputType.datetime,
                              label: 'License Validity Date',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select license validity date.';
                                }
                                return null;
                              },
                              onTap: () {
                                final datePickerBloc =
                                    context.read<DatePickerBloc>();
                                showDialog(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: datePickerBloc,
                                    child: CustomSingleDatePickerDialog(
                                      initialSelectedDate: state.selectedDate,
                                      onSelectionChanged: (args) =>
                                          datePickerBloc.add(
                                        DatePickerEvent
                                            .updateSingleDateSelection(
                                                args.value),
                                      ),
                                      onSubmit: () {},
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        BlocProvider(
                          create: (context) => getIt<FileUploadBloc>(),
                          child: _UploadField(
                            label: 'Driving License (Pdf, Image)',
                            controller: _drivingLicenseUrlController,
                            allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please upload your Driving License file.';
                              }
                              return null;
                            },
                            onUploadStarted: _onUploadStarted,
                            onUploadFinished: _onUploadFinished,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => getIt<FileUploadBloc>(),
                          child: _UploadField(
                            label: 'Instructor License (Pdf, Image)',
                            controller: _instructorLicenseUrlController,
                            allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please upload your Instructor License file.';
                              }
                              return null;
                            },
                            onUploadStarted: _onUploadStarted,
                            onUploadFinished: _onUploadFinished,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => getIt<FileUploadBloc>(),
                          child: _UploadField(
                            label: 'Work Eligibility Document (Pdf, Image)',
                            controller: _workEligibilityDocUrlController,
                            allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please upload your Work Eligibility document.';
                              }
                              return null;
                            },
                            onUploadStarted: _onUploadStarted,
                            onUploadFinished: _onUploadFinished,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => getIt<FileUploadBloc>(),
                          child: _UploadField(
                            label: 'Tax Info Document (Pdf, Image)',
                            controller: _taxInfoDocUrlController,
                            allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please upload your Tax Info document.';
                              }
                              return null;
                            },
                            onUploadStarted: _onUploadStarted,
                            onUploadFinished: _onUploadFinished,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: (isLoading || _isUploading) ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (isLoading || _isUploading) ? Colors.grey : const Color(0xFF4D8B55),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: isLoading || _isUploading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : const Text(
                              'Add License',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
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

  Widget _buildDateFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          hintText: "yyyy-mm-dd",
          suffixIcon: const Icon(Icons.calendar_today, color: Colors.black54),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final params = {
        "license_number": _licenseNumberController.text.trim(),
        "license_validity_date": _validityDateController.text.trim(),
        "driving_license_url": _drivingLicenseUrlController.text.trim(),
        "instructor_license_url": _instructorLicenseUrlController.text.trim(),
        "work_eligibility_doc_url":
            _workEligibilityDocUrlController.text.trim(),
        "tax_info_doc_url": _taxInfoDocUrlController.text.trim(),
      };

      context
          .read<InstructorInfoBloc>()
          .add(InstructorInfoEvent.updateInfo(params: params));
    }
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
              duration: const Duration(seconds: 2),
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
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
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
              hintText: label,
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              border: InputBorder.none,
              suffixIcon: state.status == FileUploadStatus.loading
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : const Icon(Icons.upload_file, color: Colors.black54),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              errorMaxLines: 3,
            ),
            validator: validator,
            keyboardType: TextInputType.url,
          ),
        );
      },
    );
  }
}
