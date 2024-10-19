import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';

class NotificationFilters extends StatelessWidget {
  const NotificationFilters({super.key, required this.selected, this.onChangeFilter});

  final String selected;
  final Function(String)? onChangeFilter;

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalDefault(context));
    ButtonStyle selectedStyle =  ThemeButton.btnSmall.merge(isDark ? ThemeButton.tonalSecondary(context) : ThemeButton.black);

    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('all') : null,
              style: selected == 'all' ? selectedStyle : buttonStyle,
              child: const Text('All')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('info') : null,
              style: selected == 'info' ? selectedStyle : buttonStyle,
              child: const Text('Info')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('message') : null,
              style: selected == 'message' ? selectedStyle : buttonStyle,
              child: const Text('Message')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('account') : null,
              style: selected == 'account' ? selectedStyle : buttonStyle,
              child: const Text('Mention')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('error') : null,
              style: selected == 'failed' ? selectedStyle : buttonStyle,
              child: const Text('Failed')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: onChangeFilter != null ? () => onChangeFilter!('warning') : null,
              style: selected == 'warning' ? selectedStyle : buttonStyle,
              child: const Text('Warning')
            ),
          ),
        ],
      ),
    );
  }
}