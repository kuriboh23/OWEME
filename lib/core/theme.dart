import 'package:flutter/material.dart';

// class AppTheme {
//   static const Color primaryBackground = Color(0xFF252422);
//   static const Color primaryColor = Color(0xFF403d39);
//   static const Color negativeAccent = Color(0xFFE25E2A);
//   static const Color positiveAccent = Color(0xFF78FCB0);
//   static const Color textHeadings = Color(0xFFf2e8cf);
//   static const Color textBody = Color(0xFFB5AAA8);
//   static const Color white = Color(0xFFfffcf2);
//   static const Color gray = Color(0xFFCEC7BC);

//   static final ThemeData themeData = ThemeData(
//     scaffoldBackgroundColor: primaryBackground,
//     brightness: Brightness.dark, // Important for theme consistency
//     textTheme: const TextTheme(
//       headlineLarge: TextStyle(
//         color: white,
//         fontWeight: FontWeight.bold,
//         fontFamily: 'Inter',
//       ),
//       bodyLarge: TextStyle(
//         fontWeight: FontWeight.w600, // Inter SemiBold
//       ),
//       bodyMedium: TextStyle(
//         fontWeight: FontWeight.w400, // Inter Regular
//       ),
//       titleLarge: TextStyle(
//         fontWeight: FontWeight.w700, // Inter Bold
//       ),
//     ),
//   );
// }

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    primary: Colors.grey.shade500,
    surface: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade900,
  ),
  scaffoldBackgroundColor: Colors.grey.shade300
);

extension AppTheme on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get inversePrimary => Theme.of(this).colorScheme.inversePrimary;
  Color get primaryBackground => Theme.of(this).scaffoldBackgroundColor;
  static const Color negativeAccent = Color(0xFFE25E2A);
  static const Color positiveAccent = Color(0xFF78FCB0);
}
