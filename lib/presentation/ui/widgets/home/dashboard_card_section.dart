import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class DashboardCardSection extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final String imageAsset;
  final VoidCallback onPressed;
  final bool isLoading;

  const DashboardCardSection({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.imageAsset,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: buttonColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: sansDevanagariMedium16(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: sansDevanagariRegular14(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left Side
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: isLoading ? null : onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: isLoading
                              ? const Center(
                                  child: SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ))
                              : Text(
                                  buttonText,
                                  style: sansDevanagariBold14(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Right Side
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          imageAsset,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
