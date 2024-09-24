import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:change_case/change_case.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class Filter extends StatefulWidget {
  const Filter({
    super.key,
    this.sortby = 'date',
    this.category = 'food',
  });

  final String sortby;
  final String category;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String sortbyTemp = 'date';
  String categoryTemp = 'All';

  List<ListItem> sortOptions = [
    ListItem(
      value: 'date_newest',
      label: 'Date Newest',
      text: 'Sort by the latest released'
    ),
    ListItem(
      value: 'date_oldest',
      label: 'Date Oldest',
      text: 'Sort by the oldest released'
    ),
    ListItem(
      value: 'distance_longest',
      label: 'Distance Longest',
      text: 'Sort by the longest distance'
    ),
    ListItem(
      value: 'distance_shortest',
      label: 'Distance Shortest',
      text: 'Sort by the shorter distance'
    )
  ];

  List<ListItem> categoryOptions = [
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

  void openSortPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: sortOptions,
      title: 'Sort By',
      onSelected: (value) {
        if (value != null) {
          String result = sortOptions.firstWhere((e) => e.value == value).label;
          setState(() {
            sortbyTemp = result;
          });
        }
      }
    );
  }

  void openCategoryPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: categoryOptions,
      title: 'Choose Category',
      onSelected: (value) {
        if (value != null) {
          String result = categoryOptions.firstWhere((e) => e.value == value).label;
          setState(() {
            categoryTemp = result;
          });
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context));
    
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {
              openSortPicker(context);
            },
            style: buttonStyle,
            child: Row(children: [
              const Icon(Icons.swap_vert, size: 16),
              const SizedBox(width: 2),
              Text('Sort By ${sortbyTemp.toCapitalCase()}', style: ThemeText.caption),
              const SizedBox(width: 2),
              const Icon(Icons.arrow_drop_down, size: 16),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
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
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Icon(Icons.history, size: 16),
              SizedBox(width: 2),
              Text('Expired Promo', style: ThemeText.caption),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Text('100M', style: ThemeText.caption),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Text('50M', style: ThemeText.caption),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Text('Yesterday', style: ThemeText.caption),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Text('This Week', style: ThemeText.caption),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Row(children: [
              Text('Last Week', style: ThemeText.caption),
            ])
          ),
        ]
      ),
    );
  }
}