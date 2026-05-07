import 'package:flutter/material.dart';
import '../components/logo.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,

      flexibleSpace: const Center(
        child: LogoApp(),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(160);
}