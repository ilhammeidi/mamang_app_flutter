import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:change_case/change_case.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class FilterTransaction extends StatefulWidget {
  const FilterTransaction({
    super.key,
    required this.sortby,
    required this.category,
    required this.onSortByDate,
    required this.onChangeCategory,
  });

  final String sortby;
  final String category;
  final Function(String) onSortByDate;
  final Function(String) onChangeCategory;

  @override
  State<FilterTransaction> createState() => _FilterTransactionState();
}

class _FilterTransactionState extends State<FilterTransaction> {
  String sortbyTemp = '';
  String categoryTemp = '';

  List<ListItem> sortOptions = [
    ListItem(
      value: 'date_newest',
      label: 'Newest',
      text: 'Sort from the latest released'
    ),
    ListItem(
      value: 'date_oldest',
      label: 'Oldest',
      text: 'Sort from the oldest released'
    ),
    ListItem(
      value: 'price_highest',
      label: 'Highest Price',
      text: 'Sort from the highest price'
    ),
    ListItem(
      value: 'price_lowest',
      label: 'Lowest Price',
      text: 'Sort from the lowest price'
    ),
  ];

  List<ListItem> categoryOptions = [
    ListItem(
      value: 'all',
      label: 'All',
    ),
    ListItem(
      value: 'diamond',
      label: 'Diamond',
    ),
    ListItem(
      value: 'gold',
      label: 'Gold',
    ),
    ListItem(
      value: 'basic',
      label: 'Basic',
    ),
    ListItem(
      value: 'free',
      label: 'Free',
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

  @override
  void initState() {
    sortbyTemp = widget.sortby;
    categoryTemp = widget.category;
    super.initState();
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

          /// SORT BY DATE
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
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Last Month', style: ThemeText.caption)
          ),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Last 2 Month', style: ThemeText.caption)
          ),
          FilledButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Last 3 Month', style: ThemeText.caption)
          ),
        ]
      ),
    );
  }
}