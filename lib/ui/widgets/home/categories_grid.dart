import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});


  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisExtent: 100,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: categoryList.length,
        (BuildContext context, int index) {
          final item = categoryList[index];
          return InkWell(
            onTap: () {
              Get.toNamed('/all-promo', arguments: item.id);
            },
            borderRadius: BorderRadius.circular(60),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: item.color.withOpacity(0.25),
                    radius: 16,
                  ),
                  Icon(item.icon, size: 42, color: item.color)
                ],
              ),
              SizedBox(height: spacingUnit(1)),
              Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600))
            ]),
          );
        }
      ),
    );
  }
}