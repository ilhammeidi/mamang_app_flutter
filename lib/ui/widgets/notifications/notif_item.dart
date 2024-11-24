import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class NotifItem extends StatelessWidget {
  const NotifItem({
    super.key,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.date,
    this.image,
    this.isRead = false,
    this.isLast = false,
    this.onTap,
  });

  final String type;
  final String title;
  final String subtitle;
  final String date;
  final String? image;
  final bool isRead;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: !isRead ? Colors.orange.withOpacity(0.15) : Colors.transparent,
        child: Column(children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            leading: _buildIcon(context, type),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Text(date, style: ThemeText.caption),
          ),
          image != null ? 
            Padding(padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(image!, height: 180, width: 320, fit: BoxFit.cover,),
              ),
            ) : const SizedBox(height: 4),
          !isLast ? const LineList() : Container()
        ]),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, String type) {
    const double size = 22;
    const double radius = 15;

    switch(type) {
      case 'success':
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.green.withOpacity(0.3),
          child: const Icon(Icons.check, color: Colors.green, size: size),
        );
      case 'warning':
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.amber.withOpacity(0.3),
          child: const Icon(Icons.warning, color: Colors.amber, size: size),
        );
      case 'error':
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.red.withOpacity(0.3),
          child: const Icon(Icons.close_rounded, color: Colors.red, size: size),
        );
      case 'message':
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.cyan.withOpacity(0.3),
          child: const Icon(Icons.message, color: Colors.cyan, size: size),
        );
      case 'account':
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.purple.withOpacity(0.3),
          child: const Icon(Icons.person, color: Colors.purple, size: size),
        );
      default:
        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.blue.withOpacity(0.3),
          child: const Icon(Icons.info_outline, color: Colors.blue, size: size),
        );
    }
  }
}