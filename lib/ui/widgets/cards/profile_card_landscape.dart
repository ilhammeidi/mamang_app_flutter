import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class ProfileCardLandscape extends StatelessWidget {
  const ProfileCardLandscape({
    super.key,
    required this.avatar,
    required this.name,
    required this.textButton,
    required this.distance,
    required this.isLast,
  });

  final String avatar;
  final String name;
  final String textButton;
  final double distance;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    Color greyText = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
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
        subtitle: Row(children: [
          Icon(Icons.location_on_outlined, size: 14, color: greyText),
          const SizedBox(width: 2),
          Text('$distance KM', style: TextStyle( color: greyText))
        ]),
        trailing: TextButton(onPressed: () {}, child: Text(textButton),)
      ),
      !isLast ? const LineList() : Container()
    ]);
  }
}