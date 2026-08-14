import 'package:elan/core/error/api_error_mapper.dart';
import 'package:flutter/material.dart';

/// Renders a server-side validation error under an input, in friendly text.
///
/// Feed it the RAW field codes from `errorResponse.errors.<field>` (e.g.
/// `['notFound']`). It resolves them to user-friendly copy and shows nothing
/// when the list is null/empty.
///
/// Usage:
/// ```dart
/// ServerFieldError(codes: state.errorResponse?.errors?.email),
/// ```
class ServerFieldError extends StatelessWidget {
  final List<String>? codes;
  final EdgeInsetsGeometry padding;

  const ServerFieldError({
    super.key,
    required this.codes,
    this.padding = const EdgeInsets.only(top: 6, left: 4, bottom: 12),
  });

  @override
  Widget build(BuildContext context) {
    final list = codes;
    if (list == null || list.isEmpty) return const SizedBox.shrink();

    final text = list
        .map((c) => ApiErrorMapper.resolveField(c) ?? c)
        .where((s) => s.trim().isNotEmpty)
        .join('\n');
    if (text.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline, size: 16, color: Colors.redAccent),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
