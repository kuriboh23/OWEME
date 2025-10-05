import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/glassmorphic.dart';

class OverallBalanceCard extends StatefulWidget {
  const OverallBalanceCard({super.key});

  @override
  State<OverallBalanceCard> createState() => _OverallBalanceCardState();
}

class _OverallBalanceCardState extends State<OverallBalanceCard> {
  double totalBalance = 95.0;

  @override
  Widget build(BuildContext context) {
    return Glassmorphic(
      width: double.infinity,
      height: 174,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Balance',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gugi',
                    fontWeight: FontWeight.w600,
                    color: AppTheme.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$$totalBalance DH',
                  style: TextStyle(
                    color: totalBalance >= 0
                        ? AppTheme.textHeadings
                        : AppTheme.secondaryColor,
                    fontSize: 32,
                    fontFamily: 'Gugi',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceRow(
                  label: "You are owed",
                  amount: "120 DH",
                  color: AppTheme.positiveAccent,
                ),
                _buildBalanceRow(
                  label: "You owe",
                  amount: "120 DH",
                  color: AppTheme.primaryAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBalanceRow({
  required String label,
  required String amount,
  required Color color,
}) {
  // ... this helper method does not need to be changed
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
