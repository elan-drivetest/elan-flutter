import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class ProfileSettingsCard extends StatelessWidget {
  final String title;
  final bool hasAddButton;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileSettingsCard({
    super.key,
    required this.title,
    required this.hasAddButton,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: Colors.blue.shade700, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: sansMedium24(color: Colors.black87)
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.description_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    if (hasAddButton)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF4D8B55),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    const SizedBox(width: 12),
                    const Icon(Icons.chevron_right,
                        color: Colors.black38, size: 24),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
