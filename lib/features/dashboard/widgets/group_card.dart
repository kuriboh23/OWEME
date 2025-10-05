import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/glassmorphic.dart';

class GroupCard extends StatelessWidget {
  final String groupName;
  final bool isOwed;
  final int amount;
  final bool isOngoing;
  final int members;

  const GroupCard({
    super.key,
    required this.groupName,
    required this.isOwed,
    required this.amount,
    required this.isOngoing,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    // Define a reusable text style for body content to keep code DRY
    final bodyTextStyle = TextStyle(
      color: AppTheme.textBody,
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Glassmorphic(
        width: double.infinity,
        // REMOVED: Fixed height to make the card responsive to content.
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // ADDED: IntrinsicHeight makes the columns the same height automatically.
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Ensures columns fill the height
              children: [
                // --- LEFT COLUMN ---
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // CHANGED: Using MainAxisAlignment is more robust than a Spacer.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Group Name (Primary Title)
                    Text(
                      groupName,
                      style: TextStyle(
                        fontFamily: 'Gugi', // Your custom font
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // ADDED: Metadata is now logically grouped at the bottom.
                    Row(
                      children: [
                        Icon(
                          isOngoing
                              ? Icons.timelapse_rounded
                              : Icons.lock_clock_rounded,
                          size: 14,
                          color: AppTheme.textBody,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isOngoing ? "Ongoing" : "Finished",
                          style: bodyTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("•", style: bodyTextStyle),
                        ),
                        Text(
                          '$members Members',
                          style: TextStyle(
                            color: AppTheme.textBody,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // --- RIGHT COLUMN ---
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Financial Status
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // IMPROVED HIERARCHY: Label is now smaller and supportive.
                        Text(
                          isOwed ? "You are owed" : "You owe",
                          style: bodyTextStyle, // Using the reusable style
                        ),
                        const SizedBox(height: 4),
                        // IMPROVED HIERARCHY: Amount is now the most prominent element.
                        Text(
                          '$amount DH', // Added currency symbol for clarity
                          style: TextStyle(
                            color: isOwed
                                ? AppTheme.positiveAccent
                                : AppTheme.primaryAccent, // Use theme color
                            fontSize: 24, // Increased size significantly
                            fontFamily: 'Gugi',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
