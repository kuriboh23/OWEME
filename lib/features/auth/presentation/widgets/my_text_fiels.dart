import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';

class MyTextFiels extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextFiels({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: context.primary, fontFamily: 'Inter'),
        filled: true,
        fillColor: context.secondary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.tertiary),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.primary),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
