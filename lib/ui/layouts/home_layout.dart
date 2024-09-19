import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Text('Home Layout', style: ThemeText.title),
        SizedBox(
          height: 400,
          child: content
        ),
        ElevatedButton(
          onPressed: () => context.push('/'),
          child: const Text('sample forms')
        ),
        ElevatedButton(
          onPressed: () => context.push('/buttons'),
          child: const Text('sample buttons')
        ),
        ElevatedButton(
          onPressed: () => context.push('/dark-mode'),
          child: const Text('sample derk light')
        ),
      ])
    );
  }
}