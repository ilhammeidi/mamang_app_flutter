import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SelectCategoryGrid extends StatelessWidget {
  const SelectCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
        child: Text('Category Search', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.w700)),
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.all(spacingUnit(1)),
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 4,
        ),
        itemBuilder: (context, index) {
          Category item = categoryList[index];
          return InkWell(
            onTap: () {
              Get.toNamed('/promos', arguments: item.id);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: item.color.withOpacity(0.1)
              ),
              child: Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Expanded(child: Text(item.name, style: TextStyle(fontWeight: FontWeight.w700, color: item.color))),
                  Image.asset(item.image, fit: BoxFit.contain, height: 30,)
                ]),
              ),          
            ),
          );
        },
      )
    ]);
  }
}