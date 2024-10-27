import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:change_case/change_case.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';

class FilterCategory extends StatefulWidget {
  const FilterCategory({
    super.key,
    required this.category,
    required this.onChangeCategory,
  });

  final String category;
  final Function(String) onChangeCategory;

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  String categoryTemp = '';

  List<ListItem> categoryOptions = [
    ListItem(
      value: 'all',
      label: 'All',
    ),
    ListItem(
      value: 'food',
      label: 'Food',
    ),
    ListItem(
      value: 'drink',
      label: 'Drink',
    ),
    ListItem(
      value: 'services',
      label: 'Services',
    ),
    ListItem(
      value: 'automotive',
      label: 'Automotive',
    ),
    ListItem(
      value: 'property',
      label: 'Property',
    ),
    ListItem(
      value: 'education',
      label: 'Education',
    ),
    ListItem(
      value: 'sport',
      label: 'Sport',
    ),
    ListItem(
      value: 'holiday',
      label: 'Holiday',
    ),
    ListItem(
      value: 'souvenir',
      label: 'Souvenir',
    ),
  ];

  void openCategoryPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: categoryOptions,
      title: 'Choose Category',
      initialValue: categoryTemp,
      onSelected: (value) {
        if (value != null) {
          String result = categoryOptions.firstWhere((e) => e.value == value).value;
          setState(() {
            categoryTemp = result;
            widget.onChangeCategory(result);
          });
        }
      }
    );
  }

  @override
  void initState() {
    categoryTemp = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context));
    
    return FilledButton(
      onPressed: () {
        openCategoryPicker(context);
      },
      style: buttonStyle,
      child: Row(children: [
        const Icon(Icons.grid_view_outlined, size: 16),
        const SizedBox(width: 2),
        Text('Category: ${categoryTemp.toCapitalCase()}', style: ThemeText.caption),
        const SizedBox(width: 2),
        const Icon(Icons.arrow_drop_down, size: 16),
      ])
    );
  }
}