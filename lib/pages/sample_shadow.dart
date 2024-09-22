import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class SampleShadow extends StatelessWidget {
  const SampleShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const VSpace(),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ThemeShade.shadeSoft(context)]
          )
        ),
        const VSpace(),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ThemeShade.shadeMedium(context)]
          )
        ),
        const VSpace(),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ThemeShade.shadeHard(context)]
          )
        ),
      ]),
    );
  }
}