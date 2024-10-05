import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class AppInputBox extends StatelessWidget {
  const AppInputBox({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outlineVariant
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: content,
      ),
    );
  }
}