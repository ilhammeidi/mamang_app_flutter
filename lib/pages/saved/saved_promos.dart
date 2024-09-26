import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/saved_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter.dart';

class SavedPromos extends StatelessWidget {
  SavedPromos({super.key});

  final controller = Get.put(SavedPromoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedPromoController>(
      builder: (controller) {
        return Column(children: [
          const VSpaceShort(),
          Filter(
            category: controller.category.value,
            sortby: controller.sortby.value,
            onChangeCategory: controller.filterByCategory,
            onSortByDate: controller.sortDate,
            onSortByDistance: controller.sortDistance,
            onSelectDistance: controller.filterByDistance,
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