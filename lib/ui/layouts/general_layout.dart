import 'package:flutter/material.dart';

class GeneralLayout extends StatelessWidget {
  const GeneralLayout({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: SafeArea(child: content),
      )
    );
  }
}