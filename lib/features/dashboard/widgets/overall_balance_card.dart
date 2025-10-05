import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/build_balance_row.dart';
import 'package:oweme/features/dashboard/widgets/glassmorphic.dart';

class OverallBalanceCard extends StatelessWidget {
  final double totalBalance;
  final double owedAmout;
  final double oweAmount;
  const OverallBalanceCard({
    super.key,
    required this.totalBalance,
    required this.owedAmout,
    required this.oweAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Glassmorphic(
      width: double.infinity,
      height: 175,
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
                  '$totalBalance DH',
                  style: TextStyle(
                    color: totalBalance >= 0
                        ? AppTheme.textHeadings
                        : AppTheme.negativeAccent,
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
                BuildBalanceRow(
                  label: "You are owed",
                  amount: "$owedAmout DH",
                  color: AppTheme.positiveAccent,
                ),
                BuildBalanceRow(
                  label: "You owe",
                  amount: "$oweAmount DH",
                  color: AppTheme.negativeAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
