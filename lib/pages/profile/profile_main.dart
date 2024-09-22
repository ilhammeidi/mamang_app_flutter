import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile', style: ThemeText.title),);
  }
}