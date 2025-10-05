import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBackground = Color(0xFF1A3A3A);
  static const Color primaryColor = Color(0xFF224B4B);
  static const Color primaryAccent = Color(0xFFFF9E00);
  static const Color secondaryColor = Color(0xFFFF6B6B);
  static const Color positiveAccent = Color(0xFF66B8A0);
  static const Color textHeadings = Color(0xFFf2e8cf);
  static const Color textBody = Color(0xFFA8B5B5);
  static const Color white = Color(0xFFE0E1DD);

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: primaryBackground,
    brightness: Brightness.dark, // Important for theme consistency
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600, // Inter SemiBold
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400, // Inter Regular
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700, // Inter Bold
      ),
    ),
  );
}
