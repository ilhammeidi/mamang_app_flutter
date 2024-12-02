import 'package:flutter/material.dart';

class NotifBlock extends StatelessWidget {
  const NotifBlock({
    super.key,
    required this.type,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String type;
  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        leading: _buildIcon(context, type),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
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