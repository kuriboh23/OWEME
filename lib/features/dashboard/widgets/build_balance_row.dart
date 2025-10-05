import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';

class BuildBalanceRow extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;

  const BuildBalanceRow({
    super.key,
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textBody,
            fontSize: 14,
            fontFamily: 'Gugi',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: 'Gugi',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
