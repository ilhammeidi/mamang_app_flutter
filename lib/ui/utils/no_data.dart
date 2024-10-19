import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.primaryTxtBtn,
    this.secondaryTxtBtn,
    this.primaryAction,
    this.secondaryAction,
    this.bgColor = Colors.tealAccent
  });

  final String image;
  final String title;
  final String desc;
  final String? primaryTxtBtn;
  final String? secondaryTxtBtn;
  final Function()? primaryAction;
  final Function()? secondaryAction;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ILLUSTRATION IMAGE
            Container(
              width: 320,
              height: 320,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[bgColor, Theme.of(context).colorScheme.surface.withOpacity(0)]
                ),
              ),
              child: Image.asset(image)
            ),

            /// TEXT
            const VSpaceShort(),
            Text(title, textAlign: TextAlign.center, style: ThemeText.title),
            Text(desc, textAlign: TextAlign.center, style: ThemeText.subtitle2),

            /// BUTTON ACTION
            const VSpace(),
            primaryTxtBtn != null ? SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                onPressed: primaryAction,
                style: ThemeButton.tonalPrimary(context),
                child: Text(primaryTxtBtn!.toCapitalCase(), style: ThemeText.subtitle2),
              )
            ) : Container(),
            const VSpaceShort(),
            secondaryTxtBtn != null ? SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: secondaryAction,
                style: ThemeButton.outlinedSecondary(context),
                child: Text(secondaryTxtBtn!.toCapitalCase(), style: ThemeText.subtitle2,),
              )
            ) : Container(),
          ],
        ),
      )
    );
  }
}