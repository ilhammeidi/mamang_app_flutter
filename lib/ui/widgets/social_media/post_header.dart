import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/like_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/other_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/share_btn.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    this.isFixed = false,
    required this.name,
    required this.avatar,
    required this.range,
    this.timeFrom = '00:00',
    this.timeTo = '00:00',
    this.timeLeft = '00:00',
    this.duration = 0,
  });

  final bool isFixed;
  final String name;
  final String avatar;
  final double range;
  final String timeFrom;
  final String timeTo;
  final String timeLeft;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    const TextStyle whiteShadow = TextStyle(
      color: Colors.white,
      shadows: [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)],
      fontWeight: FontWeight.bold
    );
  
    return AppBar(
      forceMaterialTransparency: true,
      titleSpacing: 0,
      flexibleSpace: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        decoration: BoxDecoration(
          boxShadow: isFixed ? [ThemeShade.shadeSoft(context)] : null,
          gradient: isFixed ? LinearGradient(
            colors: [
              colorScheme.surface,
              colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ) : LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
      ),
      leading: IconButton(
        icon: isFixed ? const Icon(Icons.arrow_back_ios_new) : _whiteIcon(context, Icons.arrow_back_ios_new, 22),
        onPressed: () {
          Get.back();
        },
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(avatar),
          ),
          const SizedBox(width: 8,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: isFixed ? ThemeText.subtitle : ThemeText.subtitle.merge(whiteShadow)),
            Row(children: [
              isFixed ? const Icon(Icons.location_on_rounded, size: 12) : _whiteIcon(context, Icons.location_on_rounded, 12),
              const SizedBox(width: 4),
              Text('$range M', style: isFixed ? ThemeText.caption : ThemeText.caption.merge(whiteShadow)),
            ])
          ]),
        ],
      ),
      actions: [
        const SizedBox(width: 4),
        LikeBtn(invert: !isFixed, highContrast: !isFixed),
        const SizedBox(width: 4),
        ShareBtn(invert: !isFixed, highContrast: !isFixed),
        const SizedBox(width: 4),
        OtherBtn(invert: !isFixed, highContrast: !isFixed),
      ],
      bottom: duration == 0 ? null : PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: 4),
          child: Column(
            children: [
              /// PROGRESS BAR
              ClipRRect(
                borderRadius: ThemeRadius.medium,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [ThemeShade.shadeMedium(context)]
                  ),
                  child: LinearProgressIndicator(
                    value: duration / 12,
                    backgroundColor: isFixed ? colorScheme.primaryContainer : Colors.grey.withOpacity(0.85),
                    color: isFixed ? colorScheme.primary : Colors.white,
                    semanticsLabel: 'Level progress indicator',
                  ),
                ),
              ),
              SizedBox(height: spacingUnit(1)),
          
              /// TIME
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Time left: -$timeLeft', style: !isFixed ? whiteShadow : null),
                Text('$timeFrom - $timeTo', style: !isFixed ? whiteShadow : null),
              ]),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _whiteIcon(BuildContext context, IconData icon, double size) {
    return Icon(
      icon,
      size: size,
      color: Colors.white,
      shadows: const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)],
    );
  }
}