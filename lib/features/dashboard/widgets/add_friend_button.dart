import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Add Friend Clicked');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            options: CircularDottedBorderOptions(
              color: AppTheme.white.withValues(alpha: 0.6),
              strokeWidth: 2,
              dashPattern: [14, 6],
              padding: EdgeInsets.all(4),
            ),
            child: CircleAvatar(
              backgroundColor: AppTheme.textHeadings.withValues(alpha: 0.1),
              radius: 22, // Adjust size as needed
              child: Icon(Icons.add, color: AppTheme.white, size: 32),
            ),
          ),
          SizedBox(height: 3),
          Text(
            'Add',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: AppTheme.white,
            ),
            maxLines: 1, // Ensure name doesn't wrap to a new line
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
