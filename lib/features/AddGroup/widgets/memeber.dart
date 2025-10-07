import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart'
    show PhosphorIcons;
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/glassmorphic.dart';

class Memeber extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback? onPressed;

  const Memeber({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Glassmorphic(
        width: double.infinity,
        height: 60,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: context.inversePrimary,
            child: Icon(PhosphorIcons.user_bold, color: context.primary),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: context.inversePrimary),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
