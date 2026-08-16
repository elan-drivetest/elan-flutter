import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';

import 'package:file_picker/file_picker.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/file_upload_bloc/file_upload_bloc.dart';

class CarDetailsEditSheet extends StatefulWidget {
  const CarDetailsEditSheet({
    super.key,
    required this.carBrand,
    required this.carModel,
    required this.carYear,
    required this.carColor,
    required this.licensePlate,
    required this.vehicleRegistration,
    required this.vehicleInsurance,
    required this.carImage,
  });

  final String carBrand;
  final String carModel;
  final String carYear;
  final String carColor;
  final String licensePlate;
  final String vehicleRegistration;
  final String vehicleInsurance;
  final String carImage;

  @override
  State<CarDetailsEditSheet> createState() => _CarDetailsEditSheetState();
}

class _CarDetailsEditSheetState extends State<CarDetailsEditSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _carBrandController;
  late final TextEditingController _carModelController;
  late final TextEditingController _carYearController;
  late final TextEditingController _carColorController;
  late final TextEditingController _licensePlateController;
  late final TextEditingController _vehicleRegistrationController;
  late final TextEditingController _vehicleInsuranceController;
  late final TextEditingController _carImageController;

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
    _carBrandController = TextEditingController(text: widget.carBrand);
    _carModelController = TextEditingController(text: widget.carModel);
    _carYearController = TextEditingController(text: widget.carYear);
    _carColorController = TextEditingController(text: widget.carColor);
    _licensePlateController = TextEditingController(text: widget.licensePlate);
    _vehicleRegistrationController =
        TextEditingController(text: widget.vehicleRegistration);
    _vehicleInsuranceController =
        TextEditingController(text: widget.vehicleInsurance);
    _carImageController = TextEditingController(text: widget.carImage);
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

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final params = <String, String>{
      "brand": _carBrandController.text.trim(),
      "model": _carModelController.text.trim(),
      "year": _carYearController.text.trim(),
      "color": _carColorController.text.trim(),
      "license_plate": _licensePlateController.text.trim(),
      "registration_doc_url": _vehicleRegistrationController.text.trim(),
      "insurance_doc_url": _vehicleInsuranceController.text.trim(),
      "vehicle_image_url": _carImageController.text.trim(),
      "status": "ACTIVE",
    };

    context.read<InstructorInfoBloc>().add(
          InstructorInfoEvent.updateVehicleInfo(params: params),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                  "Edit Car Details",
                  style: sansMedium24(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _buildTextFormField(
                  controller: _carBrandController,
                  label: 'Car Brand',
                  validator: _required,
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _carModelController,
                  label: 'Car Model',
                  validator: _required,
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _carYearController,
                  label: 'Car Year',
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Required";
                    if (v.length != 4) return "Enter year as YYYY";
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _carColorController,
                  label: 'Car Color',
                  validator: _required,
                ),
                const SizedBox(height: 12),
                _buildTextFormField(
                  controller: _licensePlateController,
                  label: 'License Plate',
                  validator: _required,
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (_) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Vehicle Registration (Pdf, Image)',
                    controller: _vehicleRegistrationController,
                    allowedExtensions: const ['jpg', 'png', 'pdf'],
                    validator: _required,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (_) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Vehicle Insurance (Pdf, Image)',
                    controller: _vehicleInsuranceController,
                    allowedExtensions: const ['jpg', 'png', 'pdf'],
                    validator: _required,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 12),
                BlocProvider(
                  create: (_) => getIt<FileUploadBloc>(),
                  child: _UploadField(
                    label: 'Car Image',
                    controller: _carImageController,
                    allowedExtensions: const ['jpg', 'png'],
                    validator: _required,
                    onUploadStarted: _onUploadStarted,
                    onUploadFinished: _onUploadFinished,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 54),
                    backgroundColor:
                        _isUploading ? Colors.grey : const Color(0xFF4D8B55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isUploading ? null : _onSave,
                  child: _isUploading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : Text(
                          'Save Car Details',
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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

  String? _required(String? v) => v == null || v.isEmpty ? "Required" : null;
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
              content: Text(state.errorResponse?.message ?? "Upload failed"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            onTap: state.status == FileUploadStatus.loading
                ? null
                : () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: allowedExtensions,
                    );
                    if (context.mounted && result != null) {
                      context.read<FileUploadBloc>().add(
                            FileUploadEvent.send(file: result.files.single),
                          );
                    }
                  },
            decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                borderSide:
                    const BorderSide(color: Color(0xFF4D8B55), width: 1.5),
              ),
              suffixIcon: state.status == FileUploadStatus.loading
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Color(0xFF4D8B55)),
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
