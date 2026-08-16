import 'package:elan/injection.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/confirm_email_bloc/confirm_email_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:elan/presentation/ui/pages/auth_page/email_confirmation_bottom_sheet.dart';
import 'package:elan/presentation/ui/widgets/server_field_error.dart';
import 'package:elan/presentation/bloc/otp_verification_bloc/otp_verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  final String? confirmationHash;

  const LoginPage({super.key, this.confirmationHash});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _isDialogOpen = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    AppLog.d('🔑 LoginPage initialized');
    AppLog.d(
        '🔑 confirmationHash: ${widget.confirmationHash != null ? "✅ Present (${widget.confirmationHash!.substring(0, 20)}...)" : "❌ Not present"}');

    // Handle email confirmation if hash is present
    if (widget.confirmationHash != null) {
      AppLog.d('📧 Scheduling email confirmation bottom sheet...');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppLog.d('📧 Showing email confirmation bottom sheet');
        _showEmailConfirmationSheet(widget.confirmationHash!);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      TextInput.finishAutofillContext();
      context.read<AuthBloc>().add(AuthEvent.login(
          email: _emailController.text, password: _passwordController.text));
    }
  }

  void _showEmailConfirmationSheet(String hash) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => BlocProvider(
        create: (context) => getIt<ConfirmEmailBloc>()
          ..add(ConfirmEmailEvent.confirmEmail(hash: hash)),
        child: BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
          listener: (context, state) {
            if (state.status == ConfirmEmailStatus.success ||
                state.status == ConfirmEmailStatus.error) {
              // Close loading sheet and show result
              Navigator.pop(context);

              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                isDismissible: true,
                isScrollControlled: true,
                builder: (ctx) => EmailConfirmationBottomSheet(
                  status: state.status == ConfirmEmailStatus.success
                      ? EmailConfirmationStatus.success
                      : EmailConfirmationStatus.error,
                  message: state.status == ConfirmEmailStatus.success
                      ? 'Your email has been successfully verified. You can now login to your account.'
                      : state.errorResponse?.message ??
                          'The confirmation link is invalid or has expired. Please try registering again.',
                  onRetry: () {
                    _showEmailConfirmationSheet(hash);
                  },
                  onClose: () {
                    // Clear the hash from URL by navigating to login without query params
                    context.go(PagesName.loginPage.path);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return const EmailConfirmationBottomSheet(
              status: EmailConfirmationStatus.loading,
            );
          },
        ),
      ),
    );
  }

  Widget _formField({
    required String label,
    TextEditingController? controller,
    bool isPassword = false,
    String? Function(String?)? validator,
    IconData? prefixIcon,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey[500], size: 22)
              : null,
          suffixIcon: suffixIcon,
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
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.loading) {
            // Show loading
            _isDialogOpen = true;
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.status == AuthStatus.success) {
            // Close loading dialog (if open)
            if (_isDialogOpen) {
              Navigator.of(context, rootNavigator: true).pop();
              _isDialogOpen = false;
            }
            context.go(PagesName.dashboardPage.path);
          } else if (state.status == AuthStatus.error) {
            // Close loading dialog (if open)
            if (_isDialogOpen) {
              Navigator.of(context, rootNavigator: true).pop();
              _isDialogOpen = false;
            }

            final activeError = state.errorResponse?.errors?.active?.first;
            if (activeError == "userIsNotActive") {
              final email = _emailController.text;
              context.read<OtpVerificationBloc>().add(
                    OtpVerificationEvent.resend(email: email),
                  );
              context.push(
                "${PagesName.loginPage.path}/${PagesName.otpVerificationPage.path}",
                extra: {
                  'email': email,
                },
              );
              return;
            }

            // Inline widgets already show field-level errors; the snackbar
            // carries the friendly summary message.
            final errorMessage = state.errorResponse?.message ??
                "Something went wrong. Please try again.";

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  Center(
                    child: Hero(
                      tag: 'app_logo',
                      child: Image.asset(
                        'assets/eclan_color_logo.png',
                        width: 140,
                        height: 140,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Log in to continue to your account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 48),

                  // Email
                  _formField(
                    label: 'Email',
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  // Inline server-side email error
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (p, c) => p.errorResponse != c.errorResponse,
                    builder: (context, state) => ServerFieldError(
                      codes: state.status == AuthStatus.error
                          ? state.errorResponse?.errors?.email
                          : null,
                    ),
                  ),

                  // Password
                  _formField(
                    label: 'Password',
                    controller: _passwordController,
                    isPassword: _obscurePassword,
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleLogin(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[500],
                        size: 22,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      splashRadius: 24,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  // Inline server-side password error
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (p, c) => p.errorResponse != c.errorResponse,
                    builder: (context, state) => ServerFieldError(
                      codes: state.status == AuthStatus.error
                          ? state.errorResponse?.errors?.password
                          : null,
                    ),
                  ),

                  // Forgot password button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.push(
                            "${PagesName.loginPage.path}/${PagesName.forgetPasswordPage.path}");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4CAF50).withValues(alpha: 0.9),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Login Button
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.login, size: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Go to Registration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(
                              "${PagesName.loginPage.path}/${PagesName.registrationPage.path}");
                        },
                        child: const Text(
                          'Register here',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
