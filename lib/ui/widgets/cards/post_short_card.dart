import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class PostShortCard extends StatelessWidget {
  const PostShortCard({
    super.key,
    required this.image,
    required this.avatar,
    required this.desc,
    required this.range,
    required this.duration,
    required this.time,
  });

  final String image;
  final String avatar;
  final String desc;
  final String time;
  final double range;
  final int duration;

  @override
  Widget build(BuildContext context) {
    const TextStyle whiteShadow = TextStyle(
      color: Colors.white,
      shadows: [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 2)],
      fontSize: 14
    );

    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
        )
      ),
      child: Column(children: [
        const SizedBox(height: 4),

        /// PROGRESS BAR
        ClipRRect(
          borderRadius: ThemeRadius.medium,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [ThemeShade.shadeMedium(context)]
            ),
            child: LinearProgressIndicator(
              value: duration / 12,
              backgroundColor: Colors.grey.withOpacity(0.85),
              color: Colors.white,
              semanticsLabel: 'Level progress indicator',
            ),
          ),
        ),
        const SizedBox(height: 4),
        
        /// RANGE AND TIME LEFT
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Icon(Icons.location_on_rounded, size: 16, color: Colors.white, shadows: [ThemeShade.shadeMedium(context)],),
              const SizedBox(width: 4),
              Text('$range M', style: whiteShadow),
            ],
          ),
          Text(time, style: whiteShadow),
        ]),
        const Spacer(),
        
        /// PROFILE AND CONTENT
        Row(children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(avatar),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: whiteShadow,
              textAlign: TextAlign.start,
            )
          )
        ])
      ])
    );
  }
}