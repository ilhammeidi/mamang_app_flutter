import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input_btn.dart';

class PromoMain extends StatefulWidget {
  const PromoMain({super.key});

  @override
  State<PromoMain> createState() => _PromoMainState();
}

class _PromoMainState extends State<PromoMain> {
  final controller = Get.put(AllPromoController());

  final String filter = Get.arguments ?? 'all';
  
  @override
  void initState() {
    fetchPromoByFilter(filter.toString());
    super.initState();
  }

  Future<void> fetchPromoByFilter(val) async {
    controller.filterByCategory(val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        title: const SearchInputBtn(
          location: '/search-list',
          title: 'Search Promo',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAndToNamed('/');
            },
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.store_outlined, size: 24),
                Text('Home', style: ThemeText.caption,)
              ],
            )
          ),
        ],
      ),
      body: GetBuilder<AllPromoController>(
        builder: (controller) {
          return Column(children: [
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