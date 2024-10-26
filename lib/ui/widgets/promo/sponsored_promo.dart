import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SponsoredPromo extends StatelessWidget {
  const SponsoredPromo({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Stack(children: [
        ClipRRect(
          borderRadius: ThemeRadius.medium,
          child: Image.network(image, width: double.infinity, fit: BoxFit.contain)
        ),
        Positioned(
          top: spacingUnit(1),
          right: spacingUnit(1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: ThemeRadius.medium
            ),
            child: Text('Sponsored', style: ThemeText.caption.copyWith(color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}