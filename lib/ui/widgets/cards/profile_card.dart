import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.avatar, required this.name, required this.distance});

  final String avatar;
  final String name;
  final double distance;

  @override
  Widget build(BuildContext context) {
    Color greyText = Theme.of(context).colorScheme.onSurfaceVariant;
  
    return SizedBox(
      height: 60,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: ThemeRadius.small,
          child: Image.network(
            avatar,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                width: 60,
                height: 60,
                child: ShimmerPreloader()
              );
            },
          )
        ),
        SizedBox(width: spacingUnit(1)),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(name, style: ThemeText.subtitle2, overflow: TextOverflow.ellipsis),
            const SizedBox(width: 4),
            Row(children: [
              Icon(Icons.location_on_outlined, size: 14, color: greyText),
              const SizedBox(width: 2),
              Text('$distance KM', style: TextStyle( color: greyText))
            ],)
          ],),
        )
      ]),
    );
  }
}