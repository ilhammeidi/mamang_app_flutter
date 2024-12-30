import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class AlertInfo extends StatelessWidget {
  const AlertInfo({super.key, required this.type, required this.text});

  final String type;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color statusColor(type) {
      switch(type) {
        case 'error':
          return Colors.red;
        case 'warning':
          return Colors.orangeAccent;
        case 'success':
          return Colors.green;
        case 'info':
          return Colors.lightBlue;
        default:
          return Colors.transparent;
      }
    }

    Icon statusIcon(type) {
      switch(type) {
        case 'error':
          return const Icon(Icons.close, color: Colors.red);
        case 'warning':
          return const Icon(Icons.warning_amber_outlined, color: Colors.orangeAccent);
        case 'success':
          return const Icon(Icons.check_circle_outline, color: Colors.green);
        case 'info':
          return const Icon(Icons.info_outline, color: Colors.lightBlue);
        default:
          return const Icon(Icons.info_outline);
      }
    }
    
    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        color: statusColor(type).withOpacity(0.25)
      ),
      child: Row(children: [
        statusIcon(type),
        SizedBox(width: spacingUnit(1)),
        Expanded(child: Text(text, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),))
      ]),
    );
  }
}