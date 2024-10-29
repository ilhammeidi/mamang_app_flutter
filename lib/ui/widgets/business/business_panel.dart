import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/business_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/business_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class BusinessPanel extends StatelessWidget {
  BusinessPanel({super.key});
  final businessController = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final isDark = Get.isDarkMode;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        color: isDark ? ThemePalette.secondaryDark : colorScheme.secondary
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.medium,
              color: isDark ? Colors.grey[800] : colorScheme.secondaryContainer
            ),
            child: GetBuilder<BusinessController>(
              builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(spacingUnit(1)),
                      child: TitleAction(
                        title: 'Business',
                        textAction: 'All Business',
                        desc: 'You have ${controller.myBusiness.length} business items',
                        onTap: () {
                          Get.toNamed('/business');
                        }
                      ),
                    ),
                    SizedBox(height: spacingUnit(1),),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 4,
                      padding: EdgeInsets.only(
                        bottom: spacingUnit(2)
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        Promotion item = controller.myBusiness[index];
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
                            level: item.level,
                            mini: true
                          ),
                        );
                      }
                    ),
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/business-new');
            },
            child: Padding(
              padding: EdgeInsets.all(spacingUnit(1)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.add, color: Colors.white),
                const SizedBox(width: 4),
                Text('Create New Business', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.w700, color: Colors.white))
              ]),
            ),
          )
        ],
      ),
    );
  }
}