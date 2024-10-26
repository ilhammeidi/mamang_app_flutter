import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class ProfileCardPortrait extends StatelessWidget {
  const ProfileCardPortrait({
    super.key,
    required this.avatar,
    required this.name,
    required this.desc,
    required this.btnText
  });

  final String avatar;
  final String name;
  final String desc;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        border: Border.all(
          width: 1,
          color: colorScheme.outline
        )
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(120)),
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
        SizedBox(height: spacingUnit(1)),
        Text(name, style: ThemeText.subtitle2, overflow: TextOverflow.ellipsis),
        const SizedBox(width: 4),
        Text(desc, style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant),),
        SizedBox(height: spacingUnit(1)),
        FilledButton(
          onPressed: () {},
          style: ThemeButton.btnSmall.merge(ThemeButton.tonalPrimary(context)),
          child: Text(btnText, style: ThemeText.caption,)
        )
      ]),
    );
  }
}