import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/business_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/business_card.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter_category.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';

class BusinessMain extends StatefulWidget {
  const BusinessMain({super.key});

  @override
  State<BusinessMain> createState() => _BusinessMainState();
}

class _BusinessMainState extends State<BusinessMain> {
  final businessController = Get.put(BusinessController());

  bool _showSearch = false;

  void handleToggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
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
        title: _showSearch ? const SearchInput(hintText: 'Search Business',) : const Text('All Business'),
        actions: [
          /// SEARCH BUTTON
          !_showSearch ?
            IconButton(
              onPressed: () {
                handleToggleSearch();
              },
              icon: const Icon(Icons.search, size: 40)
            ) : Container(),
          IconButton(
            onPressed: () {
              Get.toNamed('/business-new');
            },
            icon: const Icon(Icons.add_circle_outline, size: 36)
          ),
        ],
      ),
      body: GetBuilder<BusinessController>(
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.all(spacingUnit(2)),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('You have ${controller.myBusiness.length} business items', style: ThemeText.caption,),
                FilterCategory(
                  category: controller.category.value,
                  onChangeCategory: controller.filterByCategory
                )
              ]),
              const VSpaceShort(),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(spacingUnit(0)),
                physics: const ClampingScrollPhysics(),
                itemCount: controller.filteredBusiness.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 270,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  Promotion item = controller.filteredBusiness[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/business/${item.id}');
                    },
                    child: BusinessCard(
                      id: item.id,
                      name: item.name,
                      thumb: item.thumb,
                      category: item.category,
                      verified: item.verified,
                      stared: item.stared,
                      type: item.type,
                      level: item.level
                    ),
                  );
                }
              ),
            ],
          );
        }
      ),
    );
  }
}