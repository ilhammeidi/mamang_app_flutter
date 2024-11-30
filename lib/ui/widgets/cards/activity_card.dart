import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.title, required this.time, required this.icon, required this.color});

  final String title;
  final String time;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: spacingUnit(2),
      ),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            width: 4,
            color: colorScheme.surface
          )
        ),
      ),
      title: Text(time, style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(title, style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurface)),
        ],
      ),
    );
  }
}