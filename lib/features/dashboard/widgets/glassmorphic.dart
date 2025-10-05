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
                  color: AppTheme.white.withValues(alpha: 0.16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.white.withValues(alpha: 0.15),
                    AppTheme.gray.withValues(alpha: 0.06),
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
