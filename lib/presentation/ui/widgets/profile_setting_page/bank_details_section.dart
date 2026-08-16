import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class BankDetailsSection extends StatelessWidget {
  const BankDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.credit_card,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Bank Details',
                  style: sansMedium24(color: Colors.black),
                ),
              ],
            ),
            Text(
              'Archived monthly',
              style: sansDevanagariRegular16(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // No payout history endpoint exists yet. This used to render two
        // hardcoded fake transactions ($125 CAD, Feb 2025) that looked real to
        // the instructor. Empty state until the API is available.
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'No payouts yet.',
            style: sansDevanagariRegular16(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String date;
  final String amount;
  const TransactionItem({super.key, required this.date, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color(0xFFE9F7FF),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date, style: sansDevanagariRegular16(color: Colors.black)),
            Row(
              children: [
                Text(amount, style: sansDevanagariBold16(color: Colors.green)),
                const SizedBox(width: 24),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text('Sent',
                          style: sansDevanagariMedium16(color: Colors.white)),
                      const SizedBox(width: 8),
                      const Icon(Icons.download, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
