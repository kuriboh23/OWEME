import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
      statusBarIconBrightness:
          Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OWEME',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: HomePage(),
    );
  }
}
