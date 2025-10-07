import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FriendAvatar extends StatelessWidget {
  final String name;

  const FriendAvatar({super.key, required this.name});

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
              color: context.inversePrimary,
            ),
            child: CircleAvatar(
              backgroundColor: context.inversePrimary,
              radius: 25, // Adjust size as needed
              child: PhosphorIcon(
                PhosphorIconsFill.userCircleDashed,
                color: context.primary,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            truncateText(name, 6),
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: context.inversePrimary,
            ),
            maxLines: 1, // Ensure name doesn't wrap to a new line
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
