import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.name,
    required this.avatar,
    required this.caption,
    required this.image,
    required this.likes,
    required this.comments,
    required this.views,
    required this.location,
    required this.promoId,
  });

  final String name;
  final String avatar;
  final String caption;
  final String image;
  final double likes;
  final double comments;
  final double views;
  final String location;
  final String promoId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSpaceShort(),
        /// PROFILE
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 14, backgroundImage: NetworkImage(avatar)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
                  child: Text(name, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                )
              ),
              const Opacity(opacity: 0.5, child: Text('17 hours ago', textAlign: TextAlign.end))
            ],
          ),
        ),

        /// CAPTION
        Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis quis mauris vel placerat. Integer mollis lectus quis justo fermentum, at varius nibh molestie. '
            )
          ),
        ),

        /// IMAGE
        Image.network(
          image,
          fit: BoxFit.cover, width: double.infinity,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              width: double.infinity,
              height: 120,
              child: ShimmerPreloader()
            );
          },
        ),

        /// BUTTON ACTION
        Padding(
          padding: EdgeInsets.all(spacingUnit(1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline)
                  ),
                  Text(likes.toString()),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye_outlined)
                  ),
                  Text(views.toString()),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined)
                  ),
                  const Text('20'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment_outlined)
                  ),
                  Text(comments.toString()),
                  SizedBox(width: spacingUnit(1),)
                ],
              ),

              /// TAGING
              Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: Wrap(
                  children: [
                    Icon(Icons.location_on_rounded, color: ThemePalette.tertiaryMain),
                    const SizedBox(width: 4),
                    const Text('Location: '),
                    Text(location),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/promos/$promoId');
                      },
                      child: Text('#123456', style: TextStyle(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain))
                    ),
                    const SizedBox(width: 8),
                    Text('@jamesdoe', style: TextStyle(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
                child: const LineList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}