import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class AuthWrap extends StatelessWidget {
  const AuthWrap({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color>[ThemePalette.secondaryMain, lighten(ThemePalette.primaryMain, 0.1)]
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          image: const DecorationImage(image: AssetImage('assets/images/welcome_bg.png'), fit: BoxFit.cover )
        ),
        child: Container(
          margin: EdgeInsets.only(top: spacingUnit(10)),
          padding: EdgeInsets.all(spacingUnit(3)),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Center(child: content)
        ),
      ),
    );
  }
}