import 'package:elan/core/styles.dart';
import 'package:elan/domain/vehicle_request_response/vehicle_request_response.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key, required this.vehicleRequest});
  final VehicleRequestResponse? vehicleRequest;

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();

  final _carBrandController = TextEditingController();
  final _carModelController = TextEditingController();
  final _carYearController = TextEditingController();
  final _carColorController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _vehicleRegistrationController = TextEditingController();
  final _vehicleInsuranceController = TextEditingController();
  final _carImageController = TextEditingController();

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
    _carBrandController.text = widget.vehicleRequest?.brand ?? "";
    _carModelController.text = widget.vehicleRequest?.model ?? "";
    _carYearController.text = "${widget.vehicleRequest?.year ?? ""}";
    _carColorController.text = widget.vehicleRequest?.color ?? "";
    _licensePlateController.text = widget.vehicleRequest?.licensePlate ?? "";
    _vehicleRegistrationController.text =
        widget.vehicleRequest?.registrationDocUrl ?? "";
    _vehicleInsuranceController.text =
        widget.vehicleRequest?.insuranceDocUrl ?? "";
    _carImageController.text = widget.vehicleRequest?.vehicleImageUrl ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _carBrandController.dispose();
    _carModelController.dispose();
    _carYearController.dispose();
    _carColorController.dispose();
    _licensePlateController.dispose();
    _vehicleRegistrationController.dispose();
    _vehicleInsuranceController.dispose();
    _carImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text(
          'Vehicle Info',
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
                  content: Text("Vehicle info has stored."),
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
            final isLoading =
                state.status == InstructorInfoStatus.actionLoading;
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
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
                            // Car Brand
                            _buildTextFormField(
                              controller: _carBrandController,
                              label: 'Car Brand',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the car brand (e.g., Toyota, Honda)';
                                }
                                return null;
                              },
                            ),

                            // Vehicle Registration
                            BlocProvider(
                              create: (context) => getIt<FileUploadBloc>(),
                              child: _UploadField(
                                label: 'Vehicle Registration (Pdf, Image)',
                                controller: _vehicleRegistrationController,
                                allowedExtensions: const ['jpg', 'pdf', 'png'],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please upload a valid vehicle registration document (PDF or image)';
                                  }
                                  return null;
                                },
                                onUploadStarted: _onUploadStarted,
                                onUploadFinished: _onUploadFinished,
                              ),
                            ),

                            // Vehicle Insurance
                            BlocProvider(
                              create: (context) => getIt<FileUploadBloc>(),
                              child: _UploadField(
                                label: 'Vehicle Insurance (Pdf, Image)',
                                controller: _vehicleInsuranceController,
                                allowedExtensions: const ['jpg', 'pdf', 'png'],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please upload a valid vehicle insurance document (PDF or image)';
                                  }
                                  return null;
                                },
                                onUploadStarted: _onUploadStarted,
                                onUploadFinished: _onUploadFinished,
                              ),
                            ),

                            // Car Model and Year
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildTextFormField(
                                    controller: _carModelController,
                                    label: 'Car Model',
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid car model (e.g., Corolla, Civic)';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildTextFormField(
                                    controller: _carYearController,
                                    label: 'Year',
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid year (e.g., 2021)';
                                      }
                                      if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                                        return 'Enter a 4-digit year, e.g., 2021';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            // Car Color
                            _buildTextFormField(
                              controller: _carColorController,
                              label: 'Car Color',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the car color (e.g., Red, Blue)';
                                }
                                return null;
                              },
                            ),

                            // Car Image
                            BlocProvider(
                              create: (context) => getIt<FileUploadBloc>(),
                              child: _UploadField(
                                label: 'Car Image',
                                controller: _carImageController,
                                allowedExtensions: const ['jpg', 'png'],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please upload a valid car image or provide an image URL';
                                  }
                                  return null;
                                },
                                onUploadStarted: _onUploadStarted,
                                onUploadFinished: _onUploadFinished,
                              ),
                            ),

                            // License Plate No.
                            _buildTextFormField(
                              controller: _licensePlateController,
                              label: 'License Plate No.',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid license plate number (e.g., ABC-1234)';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Add Car Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed:
                          (isLoading || _isUploading) ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (isLoading || _isUploading)
                            ? Colors.grey
                            : const Color(0xFF4D8B55),
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
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2),
                            )
                          : const Text(
                              'Add Vehicle',
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final params = {
        "brand": _carBrandController.text.trim(),
        "model": _carModelController.text.trim(),
        "year": _carYearController.text
            .trim()
            .toString(), // <-- ensure this is a string!
        "color": _carColorController.text.trim(),
        "license_plate": _licensePlateController.text.trim(),
        "registration_doc_url": _vehicleRegistrationController.text.trim(),
        "insurance_doc_url": _vehicleInsuranceController.text.trim(),
        "vehicle_image_url": _carImageController.text.trim(),
        "status": "ACTIVE",
      };

      context
          .read<InstructorInfoBloc>()
          .add(InstructorInfoEvent.updateVehicleInfo(params: params));
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
