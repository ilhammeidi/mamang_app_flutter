import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';

class FilterMap extends StatefulWidget {
  const FilterMap({super.key});

  @override
  State<FilterMap> createState() => _FilterMapState();
}

class _FilterMapState extends State<FilterMap> {
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
        margin: EdgeInsets.all(spacingUnit(2)),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: ThemeRadius.small,
          boxShadow: [ThemeShade.shadeMedium(context)],
        ),
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
      SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _tags.map((item) {
            if (item != 'categories') {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilledButton(
                onPressed: () {},
                child: Text(item, style: ThemeText.caption)
              ),
            );
          }).toList(),
        ),
      )
    ]);
  }
}