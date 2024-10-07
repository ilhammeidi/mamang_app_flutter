import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:get/route_manager.dart';

class SearchInputBtn extends StatelessWidget {
  const SearchInputBtn({
    super.key,
    required this.location,
    required this.title,
    this.onCancel,
    this.shadow = false,
  });

  final String location;
  final String title;
  final bool shadow;
  final Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        Get.toNamed(location);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(spacingUnit(1)),
        decoration: BoxDecoration(
          boxShadow: shadow ? [ThemeShade.shadeSoft(context)] : null,
          color: shadow ? colorScheme.surface : colorScheme.outline.withOpacity(0.5),
          borderRadius: ThemeRadius.small
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.search),
          SizedBox(width: spacingUnit(1)),
          Expanded(child: Text(title, style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant))),
          onCancel != null ? InkWell(
            onTap: onCancel,
            child: const Icon(Icons.close_outlined)
          ) : Container(),
        ])
      ),
    );
  }
}