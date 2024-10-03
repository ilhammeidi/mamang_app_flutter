import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class BottomActionSavePromo extends StatelessWidget {
  const BottomActionSavePromo({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      shadowColor: Colors.black,
      height: 60,
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.all(spacingUnit(1)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 120,
          child: OutlinedButton(
            onPressed: () {},
            style: ThemeButton.btnBig.merge(ThemeButton.outlinedSecondary(context)),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.stars, size: 16, color: Colors.amberAccent),
              SizedBox(width: 2),
              Text('Get Coin')
            ])
          ),
        ),
        SizedBox(width: spacingUnit(1)),
        Expanded(
          child: FilledButton(
            onPressed: () {},
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            child: const Text('Save This Promo')
          ),
        )
      ]),
    );
  }
}