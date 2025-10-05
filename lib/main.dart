import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/screens/add_group_screen.dart';
import 'package:oweme/features/dashboard/screens/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 👈 This makes it transparent
      statusBarIconBrightness:
          Brightness.dark, // Use Brightness.light for light icons
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OWEME',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routes: {
        '/': (context) => HomePage(),
        '/addGroup': (context) =>  AddGroupScreen(),
      },
    );
  }
}
