import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/saved_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/filter.dart';
import 'dart:convert';
import 'dart:developer' as developer;

class SavedPromos extends StatelessWidget {
  SavedPromos({super.key});

  final controller = Get.put(SavedPromoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedPromoController>(
      builder: (controller) {
        print(controller.savedPromo);
        return Column(children: [
          const VSpaceShort(),
          Filter(
            category: controller.category.value,
            sortby: controller.sortby.value,
            onChangeCategory: controller.filterByCategory,
            onSortBy: (_) {},
          ),
          const VSpaceShort(),
          Expanded(
            child: PromoList(items: controller.filteredList),
          )
        ]);
      },
    );
  }
}