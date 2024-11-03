import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.message,
    required this.date,
    required this.isLast,
    this.onTap
  });

  final String avatar;
  final String name;
  final String message;
  final String date;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        ListTile(
          contentPadding: EdgeInsets.all(spacingUnit(1)),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              avatar,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: ShimmerPreloader()
                );
              },
            ),
          ),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(message, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: Text(date, style: ThemeText.caption),
        ),
        !isLast ? const LineList() : Container()
      ])
    );
  }
}