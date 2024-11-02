import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // maxCrossAxisExtent: 100,
          mainAxisExtent: 100,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: categoryList.length,
          (BuildContext context, int index) {
            final item = categoryList[index];
            return InkWell(
              onTap: () {
                Get.toNamed('/promos', arguments: item.id);
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
                Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600))
              ]),
            );
          }
        ),
      ),
    );
  }
}