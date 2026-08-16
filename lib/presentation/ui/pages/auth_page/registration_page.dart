import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/pages/place_picker_page/place_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/presentation/bloc/registration_bloc/registration_bloc.dart';
import 'package:elan/presentation/ui/pages/auth_page/otp_verification_page.dart';
import 'package:elan/core/validatator/canadian_phone.dart';
import 'package:elan/presentation/ui/widgets/common/canadian_phone_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  int _currentStep = 0;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  late AnimationController _shakeController;
  late Animation<Offset> _shakeAnimation;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  // Step 1 controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Step 2 controllers
  final _instructorLicenceController = TextEditingController();
  final _drivingLicenceController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _licenseValidityController = TextEditingController();
  final _drivingSchoolController = TextEditingController();
  final _referralCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() => setState(() {}));
    _confirmPasswordController.addListener(() => setState(() {}));

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        if (mounted) setState(() => _obscurePassword = true);
      }
    });

    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        if (mounted) setState(() => _obscureConfirmPassword = true);
      }
    });

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset.zero, end: const Offset(-0.03, 0)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
            begin: const Offset(-0.03, 0), end: const Offset(0.03, 0)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(begin: const Offset(0.03, 0), end: Offset.zero),
        weight: 1,
      ),
    ]).animate(_shakeController);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _instructorLicenceController.dispose();
    _drivingLicenceController.dispose();
    _licenseNumberController.dispose();
    _licenseValidityController.dispose();
    _drivingSchoolController.dispose();
    _referralCodeController.dispose();

    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _shakeController.dispose();

    super.dispose();
  }

  bool get _canContinue =>
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty &&
      _passwordController.text == _confirmPasswordController.text;

  void _nextStep() {
    if (_currentStep == 0) {
      if (_formKey1.currentState!.validate()) {
        setState(() => _currentStep = 1);
      }
    } else {
      if (_formKey2.currentState!.validate()) {
        context.read<RegistrationBloc>().add(
              RegistrationEvent.send(
                fullName: _nameController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text,
                // The field displays a mask — "(416) 555-0134" — so send the
                // E.164 form instead of the raw text. The form has already
                // validated, hence the non-null assertion.
                phoneNumber: CanadianPhone.toE164(_phoneController.text)!,
                address: _addressController.text.trim(),
                drivingSchoolName: _drivingSchoolController.text.trim(),
                licenseNumber: _licenseNumberController.text.trim(),
                licenseValidityDate: _licenseValidityController.text,
                referralCode: _referralCodeController.text.isEmpty
                    ? null
                    : _referralCodeController.text.trim(),
              ),
            );
      }
    }
  }

  void _previousStep() {
    if (_currentStep == 1) {
      setState(() => _currentStep = 0);
    } else {
      if (Navigator.canPop(context)) {
        context.pop();
      } else {
        context.go(PagesName.loginPage.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state.status == RegistrationStatus.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == RegistrationStatus.success) {
          Navigator.of(context).pop(); // Close loading dialog

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Registration successful! Please check your email to verify your account.',
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 5),
            ),
          );

          // Navigate to OTP Verification page
          context.go(
            '${PagesName.loginPage.path}/${PagesName.otpVerificationPage.path}',
            extra: {
              'email': _emailController.text.trim(),
              'verificationType': VerificationType.registration,
              'message': state.message,
              'phoneHint': state.phoneHint,
            },
          );
        }

        if (state.status == RegistrationStatus.error) {
          Navigator.of(context).pop();

          String errorMessage =
              state.errorResponse?.message ?? 'Registration failed';
          final errors = state.errorResponse?.errors;
          if (errors != null) {
            String? friendly(List<String>? codes) =>
                (codes == null || codes.isEmpty)
                    ? null
                    : (ApiErrorMapper.resolveField(codes.first) ?? codes.first);

            final errorMessages = [
              friendly(errors.email),
              friendly(errors.phoneNumber),
              friendly(errors.fullName),
              friendly(errors.address),
              friendly(errors.password),
            ].whereType<String>().toList();

            if (errorMessages.isNotEmpty) {
              errorMessage = errorMessages.join('\n');
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            onPressed: _previousStep,
          ),
          title: Text(
            _currentStep == 0 ? 'Step 1 of 2' : 'Step 2 of 2',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: LinearProgressIndicator(
              value: _currentStep == 0 ? 0.5 : 1.0,
              backgroundColor: Colors.grey[200],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
            ),
          ),
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.05, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: SingleChildScrollView(
              key: ValueKey(_currentStep),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _currentStep == 0 ? 'Create Account' : 'Professional Info',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentStep == 0
                        ? 'Join us and start your journey today'
                        : 'Just a few more details to get you set up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _currentStep == 0 ? _buildStep1() : _buildStep2(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= STEP 1 =================

  Widget _buildStep1() {
    return Form(
      key: _formKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle('Personal Information'),
          _inputField(
            'Full Name',
            _nameController,
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
          ),
          _inputField(
            'Email',
            _emailController,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Please enter Email';
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(v)) return 'Enter a valid email';
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CanadianPhoneField(controller: _phoneController),
          ),
          _inputField(
            'Address',
            _addressController,
            prefixIcon: Icons.location_on_outlined,
            keyboardType: TextInputType.streetAddress,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () async {
              final result = await Navigator.of(context).push<String>(
                MaterialPageRoute(
                  builder: (context) => const PlacePickerPage(),
                ),
              );
              if (result != null && result.isNotEmpty) {
                setState(() {
                  _addressController.text = result;
                });
              }
            },
          ),
          const SizedBox(height: 8),
          _buildSectionTitle('Security'),
          _inputField(
            'Password',
            _passwordController,
            focusNode: _passwordFocusNode,
            isPassword: _obscurePassword,
            prefixIcon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            suffixIcon:
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
            onSuffixTap: () =>
                setState(() => _obscurePassword = !_obscurePassword),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter Password';
              if (v.length < 8) return 'Password must be at least 8 characters';
              return null;
            },
          ),
          SlideTransition(
            position: _shakeAnimation,
            child: _inputField(
              'Confirm Password',
              _confirmPasswordController,
              focusNode: _confirmPasswordFocusNode,
              isPassword: _obscureConfirmPassword,
              prefixIcon: Icons.lock_outline,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                if (_canContinue) _nextStep();
              },
              suffixIcon: _obscureConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              onSuffixTap: () => setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword),
              validator: (v) {
                if (v != _passwordController.text) {
                  _shakeController.forward(from: 0);
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 32),
          _primaryButton(
            'Continue',
            _canContinue ? _nextStep : null,
            Icons.arrow_forward,
          ),
        ],
      ),
    );
  }

  // ================= STEP 2 =================

  Widget _buildStep2() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _inputField(
            'Instructor Licence',
            _instructorLicenceController,
            prefixIcon: Icons.badge_outlined,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty)
                return 'Please enter Instructor Licence';
              // Canadian licenses are generally alphanumeric with hyphens/spaces (5 to 17 chars)
              final licenseRegex = RegExp(r'^[A-Za-z0-9\-\s]{5,17}$');
              if (!licenseRegex.hasMatch(v))
                return 'Enter a valid Canadian license format';
              return null;
            },
          ),
          _inputField(
            'Driving Licence',
            _drivingLicenceController,
            prefixIcon: Icons.card_membership,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty)
                return 'Please enter Driving Licence';
              final licenseRegex = RegExp(r'^[A-Za-z0-9\-\s]{5,17}$');
              if (!licenseRegex.hasMatch(v))
                return 'Enter a valid Canadian license format';
              return null;
            },
          ),
          _inputField(
            'License Number',
            _licenseNumberController,
            prefixIcon: Icons.numbers,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty)
                return 'Please enter License Number';
              final licenseRegex = RegExp(r'^[A-Za-z0-9\-\s]{5,17}$');
              if (!licenseRegex.hasMatch(v))
                return 'Enter a valid Canadian license format';
              return null;
            },
          ),
          _datePickerField(),
          _inputField(
            'Driving School Name',
            _drivingSchoolController,
            prefixIcon: Icons.business_outlined,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
          ),
          _inputField(
            'Referral Code (optional)',
            _referralCodeController,
            required: false,
            prefixIcon: Icons.local_offer_outlined,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _nextStep(),
          ),
          const SizedBox(height: 32),
          _primaryButton(
            'Complete Registration',
            _nextStep,
            Icons.check_circle_outline,
          ),
        ],
      ),
    );
  }

  // ================= COMMON WIDGETS =================

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
    int maxLines = 1,
    bool required = true,
    IconData? prefixIcon,
    Widget? prefixWidget,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
    FocusNode? focusNode,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        maxLines: maxLines,
        focusNode: focusNode,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          alignLabelWithHint: maxLines > 1,
          prefixIcon: prefixWidget ??
              (prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.grey[500], size: 22)
                  : null),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: Colors.grey[500], size: 22),
                  onPressed: onSuffixTap,
                  splashRadius: 24,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
        ),
        validator: validator ??
            (v) => required && (v == null || v.trim().isEmpty)
                ? 'Please enter $label'
                : null,
      ),
    );
  }

  Widget _datePickerField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: _licenseValidityController,
        readOnly: true,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: 'License Validity Date',
          labelStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(Icons.calendar_today_outlined,
              color: Colors.grey[500], size: 22),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
        ),
        validator: (v) => v == null || v.isEmpty ? 'Please select date' : null,
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Color(0xFF4CAF50), // header background color
                    onPrimary: Colors.white, // header text color
                    onSurface: Colors.black87, // body text color
                  ),
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            _licenseValidityController.text =
                "${picked.year.toString().padLeft(4, '0')}-"
                "${picked.month.toString().padLeft(2, '0')}-"
                "${picked.day.toString().padLeft(2, '0')}";
          }
        },
      ),
    );
  }

  Widget _primaryButton(String text, VoidCallback? onTap, IconData icon) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: onTap != null
            ? [
                BoxShadow(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          disabledForegroundColor: Colors.grey.shade600,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, size: 20),
          ],
        ),
      ),
    );
  }
}
