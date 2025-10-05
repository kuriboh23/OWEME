import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';

class Glassmorphic extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const Glassmorphic({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,

        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.textBody.withValues(alpha: 0.13),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.textBody.withValues(alpha: 0.16),
                    AppTheme.textBody.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
