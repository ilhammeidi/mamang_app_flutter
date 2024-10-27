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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: ButtonTab(
            isSeleted: current == 0,
            text: 'Promos', 
            onSelect: onSelect(0)
          ),
        ),
        const SizedBox(width: 2),
        Expanded(flex: 1, child: _buttonTab(current == 2, 'Vouchers', () => onSelect(2), context)),
        const SizedBox(width: 2),
        Expanded(flex: 1, child: _buttonTab(current == 1, 'Liked', () => onSelect(1), context)),
      ]),
    )
  }
}