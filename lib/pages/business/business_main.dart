import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class BusinessMain extends StatelessWidget {
  const BusinessMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Business', style: ThemeText.title),);
  }
}