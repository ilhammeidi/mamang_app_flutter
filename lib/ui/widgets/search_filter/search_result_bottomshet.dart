import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/pages/explore/event.dart';
import 'package:mamang_app_flutter/pages/explore/promo.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/bottom_draggable_sheet.dart';

class SearchResultBottomshet extends StatelessWidget {
  const SearchResultBottomshet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomDraggableSheet(
      content: ListView(children: const [
        RecommendedPromo(),
        VSpace(),
        FlashSalePromo(),
        VSpace(),
        RecommendedEvent()
      ])
    );
  }
}