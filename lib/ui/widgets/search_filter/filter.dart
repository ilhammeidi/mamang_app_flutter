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
    required this.sortby,
    required this.category,
    required this.onSortByDate,
    required this.onSortByDistance,
    required this.onChangeCategory,
    required this.onSelectDistance,
  });

  final String sortby;
  final String category;
  final Function(String) onSortByDate;
  final Function(String) onSortByDistance;
  final Function(String) onChangeCategory;
  final Function(int) onSelectDistance;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String sortbyTemp = '';
  String categoryTemp = '';

  String _tagFilter = '';
  

  List<ListItem> sortOptions = [
    ListItem(
      value: 'date_newest',
      label: 'Newest',
      text: 'Sort by the latest released'
    ),
    ListItem(
      value: 'date_oldest',
      label: 'Oldest',
      text: 'Sort by the oldest released'
    ),
    ListItem(
      value: 'distance_shortest',
      label: 'Closest',
      text: 'Sort by the shorter distance'
    ),
    ListItem(
      value: 'distance_longest',
      label: 'Longest',
      text: 'Sort by the longest distance'
    ),
  ];

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

  void openSortPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: sortOptions,
      title: 'Sort By',
      initialValue: sortbyTemp,
      onSelected: (value) {
        if (value != null) {
          String result = sortOptions.firstWhere((e) => e.value == value).value;
          setState(() {
            sortbyTemp = result;
            switch(result) {
              case 'date_newest':
                widget.onSortByDate('desc');
                break;
              case 'date_oldest':
                widget.onSortByDate('asc');
                break;
              case 'distance_shortest':
                widget.onSortByDistance('asc');
                break;
              case 'distance_longest':
                widget.onSortByDistance('desc');
                break;
              default:
                break;
            }
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

  void filterByDistance(int distance) {
    if(_tagFilter == distance.toString()) {
      widget.onSelectDistance(-1);
      setState(() {
        _tagFilter = '';
      });
    } else {
      widget.onSelectDistance(distance);
      setState(() {
        _tagFilter = distance.toString();
      });
    }
  }

  @override
  void initState() {
    sortbyTemp = widget.sortby;
    categoryTemp = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context));
    ButtonStyle selectedStyle = ThemeButton.btnSmall.merge(ThemeButton.secondary);
    
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          /// FILTER BY CATEGORY
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
          /// SORT BY DATA AND DISTANCE
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
          /// TAG FILTERS
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
            onPressed: () {
              filterByDistance(50);
            },
            style: _tagFilter == '50' ? selectedStyle : buttonStyle,
            child: const Text('50M', style: ThemeText.caption)
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {
              filterByDistance(20);
            },
            style: _tagFilter == '20' ? selectedStyle : buttonStyle,
            child: const Text('20M', style: ThemeText.caption)
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Yesterday', style: ThemeText.caption)
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('This Week', style: ThemeText.caption)
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Last Week', style: ThemeText.caption)
          ),
        ]
      ),
    );
  }
}