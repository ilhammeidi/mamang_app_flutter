import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      shadowColor: Colors.black,
      height: 80,
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.all(spacingUnit(1)),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: OutlinedButton(
            onPressed: () {},
            style: ThemeButton.outlinedSecondary(context),
            child: const Row(children: [
              Icon(Icons.stars),
              SizedBox(width: 2),
              Text('Collect Coin in 1h 2m')
            ])
          ),
        ),
        Expanded(
          flex: 1,
          child: FilledButton(
            onPressed: () {},
            style: ThemeButton.primary,
            child: const Text('Save This Promo')
          ),
        )
      ]),
    );
  }
}