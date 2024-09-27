import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Row(children: [
        /// TEXT
        Expanded(
          flex: 3,
          child: RichText(
            text: const TextSpan(style: TextStyle(color: Colors.white), children: [
              TextSpan(
                text: 'Find',
                style: TextStyle(fontSize: 24, fontFamily: 'Nunito')
              ),
              TextSpan(
                text: ' the best deals ',
                style: ThemeText.title
              ),
              TextSpan(
                text: 'around you!',
                style: TextStyle(fontSize: 24, fontFamily: 'Nunito')
              ),
            ])
          )
        ),
        /// ILLUSTRATION
        Expanded(
          flex: 2,
          child: Image.asset('assets/images/search.png', width: 200,)
        )
      ]),
    );
  }
}