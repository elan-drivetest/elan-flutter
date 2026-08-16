import 'dart:async';

import 'package:elan/injection.dart';
import 'package:elan/presentation/bloc/otp_verification_bloc/otp_verification_bloc.dart';
import 'package:elan/presentation/navigation/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

enum VerificationType { registration, forgotPassword }

class OtpVerificationPage extends StatefulWidget {
  final String email;
  final VerificationType verificationType;
  final String? message;
  final String? phoneHint;

  const OtpVerificationPage({
    super.key,
    required this.email,
    required this.verificationType,
    this.message,
    this.phoneHint,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _cooldownTimer;
  int _cooldownSeconds = 0;

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    setState(() {
      _cooldownSeconds = 300; // 5 minutes
    });
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_cooldownSeconds > 0) {
        setState(() {
          _cooldownSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _verifyOtp(String pin) {
    context.read<OtpVerificationBloc>().add(
          OtpVerificationEvent.verify(
            email: widget.email,
            otp: pin,
            isForgotPassword:
                widget.verificationType == VerificationType.forgotPassword,
          ),
        );
  }

  void _resendOtp() {
    context.read<OtpVerificationBloc>().add(
          OtpVerificationEvent.resend(email: widget.email),
        );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4CAF50);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryColor, width: 2),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade50,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
        listener: (context, state) {
          if (state.status == OtpVerificationStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'Verification successful!'),
                backgroundColor: primaryColor,
              ),
            );
            if (widget.verificationType == VerificationType.forgotPassword) {
              context.go(
                '${PagesName.loginPage.path}/${PagesName.resetPasswordPage.path}',
                extra: {
                  'token': state.token,
                },
              );
            } else {
              context.go(PagesName.loginPage.path);
            }
          } else if (state.status == OtpVerificationStatus.error) {
            // message is already friendly; otp field carries the raw code.
            final String errorMessage =
                state.errorResponse?.message ?? 'Verification failed';

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.status == OtpVerificationStatus.resendSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'OTP Resent successfully'),
                backgroundColor: primaryColor,
              ),
            );
          } else if (state.status == OtpVerificationStatus.resendError) {
            final otpError = state.errorResponse?.errors?.otp?.first;
            if (otpError == "otpResendCooldown") {
              _startCooldown();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please wait 5 minutes before resending OTP'),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      state.errorResponse?.message ?? 'Failed to resend OTP'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  Center(
                    child: Image.asset(
                      'assets/eclan_color_logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    widget.message ?? 'Verify your email',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.phoneHint != null
                        ? 'Please enter the 6 digit code sent to\n${widget.phoneHint}'
                        : 'Please enter the 6 digit code sent to\n${widget.email}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  Center(
                    child: Pinput(
                      length: 6,
                      controller: _pinController,
                      focusNode: _focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      keyboardType: TextInputType.number,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        _verifyOtp(pin);
                      },
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Verify Button
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: state.status == OtpVerificationStatus.loading
                          ? null
                          : () {
                              if (_pinController.text.length == 6) {
                                _verifyOtp(_pinController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please enter a valid 6-digit code'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: state.status == OtpVerificationStatus.loading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2),
                            )
                          : const Text(
                              'Verify Code',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Resend Code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: (state.status ==
                                    OtpVerificationStatus.resendLoading ||
                                _cooldownSeconds > 0)
                            ? null
                            : _resendOtp,
                        child:
                            state.status == OtpVerificationStatus.resendLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2, color: primaryColor),
                                  )
                                : Text(
                                    _cooldownSeconds > 0
                                        ? 'Resend (${(_cooldownSeconds ~/ 60).toString().padLeft(2, '0')}:${(_cooldownSeconds % 60).toString().padLeft(2, '0')})'
                                        : 'Resend',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: _cooldownSeconds > 0
                                          ? Colors.grey
                                          : primaryColor,
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
