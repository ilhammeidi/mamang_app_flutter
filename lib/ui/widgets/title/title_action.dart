import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class TitleAction extends StatelessWidget {
  const TitleAction({super.key, required this.title, required this.textAction, required this.onTap});

  final String title;
  final String textAction;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: ThemeText.title2),
      FilledButton(
        onPressed: () => onTap,
        style: ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context)),
        child: Text(textAction, style: const TextStyle(fontWeight: FontWeight.bold))
      )
    ]);
  }
}