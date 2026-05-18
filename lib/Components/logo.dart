import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo.jpg",
      width: 320,
      height: 140,
      fit: BoxFit.contain
    );
  }
}