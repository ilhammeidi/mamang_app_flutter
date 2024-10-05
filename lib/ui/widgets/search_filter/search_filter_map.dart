import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/select_category_icon.dart';

class SearchFilterMap extends StatefulWidget {
  const SearchFilterMap({super.key});

  @override
  State<SearchFilterMap> createState() => _SearchFilterMapState();
}

class _SearchFilterMapState extends State<SearchFilterMap> {
  final List _tags = ['categories', 'Premium', 'VIP', 'Radius 50M', 'Trending', 'Lower than \$5', '24 Hours'];
  final List _selectedTag = [];

  void handleSelecTag(tag) {
    if(_selectedTag.contains(tag)) {
      setState(() {
        _selectedTag.remove(tag);
      });
    } else {
      setState(() {
        _selectedTag.add(tag);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = FilledButton.styleFrom(
      elevation: 4,
      shadowColor: Colors.black
    ).merge(
      ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context))
    );
    ButtonStyle selectedStyle = FilledButton.styleFrom(
      elevation: 4,
      shadowColor: Colors.black
    ).merge(
      ThemeButton.btnSmall.merge(ThemeButton.secondary)
    );

    return Column(children: [
      Container(
        margin: EdgeInsets.only(
          top: spacingUnit(2),
          left: spacingUnit(2),
          right: spacingUnit(2),
          bottom: spacingUnit(1)
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: ThemeRadius.small,
          boxShadow: [ThemeShade.shadeMedium(context)],
        ),
        /// SEARCH INPUT FIELD
        child: Row(children: [
          IconButton(
            onPressed: () {
              Get.toNamed('/explore');
            },
            icon: const Icon(Icons.arrow_back_ios_new)
          ),
          SizedBox(width: spacingUnit(2)),
          const Expanded(child: SearchInput())
        ])
      ),
      /// TAG AND FILTER CATEGORIES
      SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _tags.map((item) {
            if (item != 'categories') {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:  4, vertical: 8),
                child: FilledButton(
                  onPressed: () {
                    handleSelecTag(item);
                  },
                  style: _selectedTag.contains(item) ? selectedStyle : buttonStyle,
                  child: Text(item, style: ThemeText.caption)
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: SelectCategoryIcon(items: categoryList)
            );
          }).toList(),
        ),
      )
    ]);
  }
}