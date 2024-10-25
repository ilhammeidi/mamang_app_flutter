import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.caption,
    required this.image,
    required this.likes,
    required this.comments,
    required this.views,
    required this.location,
    required this.promoId,
    this.range,
    this.timeFrom,
    this.timeTo,
  });

  final String caption;
  final String image;
  final double likes;
  final double comments;
  final double views;
  final String location;
  final String promoId;
  final double? range;
  final String? timeFrom;
  final String? timeTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// IMAGE
        Image.network(
          image,
          color: Colors.black.withOpacity(0.2),
          colorBlendMode: BlendMode.darken,
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

        /// CAPTION
        Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Opacity(opacity: 0.5, child: Text('17 hours ago', textAlign: TextAlign.end)),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis quis mauris vel placerat. Integer mollis lectus quis justo fermentum, at varius nibh molestie. '
                )
              ),
            ],
          ),
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
                child: Text('#12345$promoId', style: TextStyle(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain))
              ),
              const SizedBox(width: 8),
              Text('@jamesdoe', style: TextStyle(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain)),
            ],
          ),
        ),
        SizedBox(height: spacingUnit(2)),

        /// BUTTON ACTION
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
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
                  SizedBox(width: spacingUnit(1))
                ],
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