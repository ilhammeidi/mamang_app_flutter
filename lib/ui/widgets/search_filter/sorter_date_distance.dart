import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:change_case/change_case.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';

class SorterDateDistance extends StatefulWidget {
  const SorterDateDistance({
    super.key,
    required this.sortby,
    required this.onSortByDate,
    required this.onSortByDistance,
  });

  final String sortby;
  final Function(String) onSortByDate;
  final Function(String) onSortByDistance;

  @override
  State<SorterDateDistance> createState() => _SorterDateDistanceState();
}

class _SorterDateDistanceState extends State<SorterDateDistance> {
  String sortbyTemp = '';

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

  @override
  void initState() {
    sortbyTemp = widget.sortby;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context));
    
    return FilledButton(
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
    );
  }
}