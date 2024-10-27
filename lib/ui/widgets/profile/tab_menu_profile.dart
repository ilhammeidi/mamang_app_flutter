import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class TabMenuProfile extends StatelessWidget {
  const TabMenuProfile({super.key, required this.onSelect, required this.current });

  final int current;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [ThemeShade.shadeSoft(context)],
        borderRadius: ThemeRadius.big
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(flex: 1, child: _buttonTab(current == 0, 'Profile', () => onSelect(0), context)),
        const SizedBox(width: 2),
        Expanded(flex: 1, child: _buttonTab(current == 1, 'Business', () => onSelect(1), context)),
        const SizedBox(width: 2),
        Expanded(flex: 1, child: _buttonTab(current == 2, 'Settings', () => onSelect(2), context)),
      ]),
    );
  }

  Widget _buttonTab(bool isSelected, String text, Function() onSelect, context) {
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