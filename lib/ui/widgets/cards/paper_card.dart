import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({super.key, required this.content, this.coloured = false});

  final Widget content;
  final bool coloured;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coloured ? ThemePalette.primaryMain : Theme.of(context).colorScheme.surface,
        borderRadius: ThemeRadius.small,
        boxShadow: [ThemeShade.shadeSoft(context)],
      ),
      child: content
    );
  }
}