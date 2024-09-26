import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input_btn.dart';

class PromoMain extends StatelessWidget {
  PromoMain({super.key});

  final controller = Get.put(AllPromoController());

  // final String filter = Get.arguments['filter'] ?? '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        leadingWidth: 40,
        leading: Padding(
          padding: EdgeInsets.only(left: spacingUnit(1)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)
          ),
        ),
        title: const SearchInputBtn(
          location: '/search-basic',
          title: 'Search Promo',
        )
      ),
      body: GetBuilder<AllPromoController>(
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
      )
    );
  }
}