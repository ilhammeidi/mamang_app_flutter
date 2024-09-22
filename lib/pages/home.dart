import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home', style: ThemeText.title),);
  }
}