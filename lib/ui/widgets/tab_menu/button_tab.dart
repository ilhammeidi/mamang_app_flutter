import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class ButtonTab extends StatelessWidget {
  const ButtonTab({super.key, required this.isSelected, required this.text, required this.onSelect});

  final bool isSelected;
  final String text;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: () {
        onSelect();
      },
      style: FilledButton.styleFrom(
        backgroundColor: isSelected ? colorScheme.primaryContainer : Colors.transparent,
        foregroundColor: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.big
        )
      ),
      child: Text(text, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),),
    );
  }
}