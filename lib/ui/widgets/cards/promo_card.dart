import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.thumb,
    required this.id,
    required this.title,
    required this.distance,
    required this.xp
  });

  final String thumb;
  final String id;
  final String title;
  final double distance;
  final double xp;

  @override
  Widget build(BuildContext context) {
    Color greyText = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: ThemeRadius.small,
        child: Image.network(
          thumb,
          width: double.infinity,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '#12345$id',
          style: ThemeText.caption.copyWith(color: greyText)
        ),
      ),
      SizedBox(
        height: 60,
        child: Text(
          title.toCapitalCase(),
          style: ThemeText.subtitle2,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )
      ),
      Row(children: [
        Icon(Icons.location_on_outlined, size: 18, color: greyText),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text('$distance M', style: ThemeText.paragraph.copyWith(color: greyText)),
        ),
        const SizedBox(width: 16),
        Icon(Icons.check_circle_outline, size: 18, color: greyText),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(xp.toString(), style: ThemeText.paragraph.copyWith(color: greyText)),
        ),
      ]),
    ]);
  }
}