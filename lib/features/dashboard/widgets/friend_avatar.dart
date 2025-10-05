import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';

// ignore: must_be_immutable
class FriendAvatar extends StatelessWidget {
  String name;

  FriendAvatar({super.key, required this.name});

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, 5)}...';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Friend Clicked');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.white,
            ),
            child: CircleAvatar(
              backgroundColor: AppTheme.white,
              radius: 25, // Adjust size as needed
              child: Icon(Icons.person, color: AppTheme.primaryColor),
            ),
          ),
          SizedBox(height: 4),
          Text(
            truncateText(name, 6),
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
