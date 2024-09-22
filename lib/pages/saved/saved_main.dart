import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SavedMain extends StatelessWidget {
  const SavedMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Saved', style: ThemeText.title),);
  }
}