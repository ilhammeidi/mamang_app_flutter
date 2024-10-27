import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/tab_menu/button_tab.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({
    super.key,
    required this.onSelect,
    required this.current,
    required this.menus,
  });

  final Function(int) onSelect;
  final int current;
  final List<String> menus; 

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menus.asMap().entries.map((entry) {
          String item = entry.value;
          int index = entry.key;

          return Expanded(
            flex: 1,
            child: ButtonTab(
              isSelected: current == index,
              text: item,
              onSelect: () => onSelect(index)
            ),
          );
        }).toList()
      ),
    );
  }
}