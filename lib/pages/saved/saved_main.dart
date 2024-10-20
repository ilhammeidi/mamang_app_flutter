import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/saved/likes.dart';
import 'package:mamang_app_flutter/pages/saved/puzzles.dart';
import 'package:mamang_app_flutter/pages/saved/saved_promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/header.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/tab_menu.dart';

class SavedMain extends StatefulWidget {
  const SavedMain({super.key});

  @override
  State<SavedMain> createState() => _SavedMainState();
}

class _SavedMainState extends State<SavedMain> {
  int _current = 0;
  void _handleSelect(int index) {
    setState(() {
      _current = index;
    });
  }

  final List<Widget> _content = [
    SavedPromos(),
    SavedLikes(),
    const Puzzles(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
        child: CustomScrollView(
          slivers: [
            const SavedHeader(),
            SliverStickyHeader.builder(
              builder: (context, state) {
                return TabMenu(
                  fixed: state.isPinned,
                  onSelect: _handleSelect,
                  current: _current
                );
              },
              sliver: SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest
                  ),
                  child: _content[_current]
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}