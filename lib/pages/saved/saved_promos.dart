import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_saved.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/filter.dart';

class SavedPromos extends StatelessWidget {
  const SavedPromos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      VSpaceShort(),
      Filter(),
      VSpaceShort(),
      Expanded(
        child: PromoSaved(),
      )
    ]);
  }
}