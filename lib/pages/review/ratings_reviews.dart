import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_button.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_list.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_stats.dart';

class RatingsReviews extends StatelessWidget {
  const RatingsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Rating and Reviews'),
        centerTitle: false,
      ),
      body: ListView(children: [
        const VSpaceShort(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: const ReviewStats(),
        ),
        const VSpace(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
          child: const ReviewButton(),
        ),
        const VSpaceShort(),
        const ReviewList(),
        const VSpace(),
      ]),
    );
  }
}