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
    this.shadow = false,
  });

  final String location;
  final String title;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(location);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(spacingUnit(1)),
        decoration: BoxDecoration(
          boxShadow: shadow ? [ThemeShade.shadeSoft(context)] : null,
          border: !shadow ? Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1
          ) : null,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: ThemeRadius.small
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.search),
          SizedBox(width: spacingUnit(1)),
          Text(title, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant))
        ])
      ),
    );
  }
}