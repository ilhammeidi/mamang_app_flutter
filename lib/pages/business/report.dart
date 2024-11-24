import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/business_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/business_stats_card.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter_date.dart';

class BusinessReport extends StatelessWidget {
  BusinessReport({super.key});

  final businessController = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        /// TITLE AND SEARCH
        title: const Text('Business Report'),
      ),
      body: Column(children: [
        /// DATE FILTER
        const FilterDate(),
        SizedBox(height: spacingUnit(2)),

        /// ITEMS
        Expanded(
          child: GetBuilder<BusinessController>(
            builder: (controller) {
              return ListView.builder(
                padding: EdgeInsets.only(bottom: spacingUnit(3)),
                physics: const ClampingScrollPhysics(),
                itemCount: controller.filteredBusiness.length,
                itemBuilder: ((BuildContext context, int index) {
                  Promotion item = controller.filteredBusiness[index];
                  return Padding(
                    padding: EdgeInsets.all(spacingUnit(1)),
                    child: BusinessStatsCard(
                      type: item.type,
                      thumb: item.thumb,
                      id: item.id.toString(),
                      name: item.name,
                      category: item.category,
                      stared: item.stared,
                      share: item.distance,
                      like: item.price,
                      saved: item.level,
                      views: item.xp
                    ),
                  );
                }),
              );
            }
          ),
        ),
      ]),
    );
  }
}