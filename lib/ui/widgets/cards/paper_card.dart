import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({super.key, required this.content, this.coloured = false, this.flat = false});

  final Widget content;
  final bool coloured;
  final bool flat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coloured ? ThemePalette.primaryMain : Theme.of(context).colorScheme.surface,
        borderRadius: ThemeRadius.small,
        boxShadow: !flat ? [ThemeShade.shadeSoft(context)] : null,
        border: flat ? Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline
        ) : null
      ),
      child: content
    );
  }
}