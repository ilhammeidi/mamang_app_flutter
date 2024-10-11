import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/liked_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';

class SavedLikes extends StatelessWidget {
  SavedLikes({super.key});

  final controller = Get.put(LikedPromoController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VSpaceShort(),
      PromoList(items: controller.likedPromo, isHome: true)
    ]);
  }
}