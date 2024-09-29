import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SelectCategoryIcon extends StatefulWidget {
  const SelectCategoryIcon({super.key, required this.items});

  final List items;

  @override
  State<SelectCategoryIcon> createState() => _SelectCategoryIconState();
}

class _SelectCategoryIconState extends State<SelectCategoryIcon> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.medium,
          color: colorScheme.surface,
          boxShadow: [ThemeShade.shadeMedium(context)]
        ),
        child: Row(children: [
          Text('Categories:', style: ThemeText.caption.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Row(
            children: widget.items.map((item) => Align(
              widthFactor: 0.8,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: lighten(item.color, 0.5),
                child: Icon(item.icon!, size: 16, color: item.color!,),
              ),
            )).toList()
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_drop_down_rounded)
        ])
      ),
    );
  }
}