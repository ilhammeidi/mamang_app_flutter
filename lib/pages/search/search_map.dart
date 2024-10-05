import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_filter_map.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_result_bottomshet.dart';

class SearchMap extends StatelessWidget {
  const SearchMap({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          double maxWidth = constraint.maxWidth;
          double height = MediaQuery.of(context).size.height;
          return Stack(children: [
            /// MAP
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/map_portrait.png',
                width: maxWidth,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            /// Buttons
            Positioned(
              right: 18,
              bottom: height / 3 + 80,
              child: SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    foregroundColor: ThemePalette.primaryMain,
                    elevation: 5,
                    shadowColor: Colors.black
                  ),
                  icon: const Icon(Icons.location_searching, size: 22)
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: height / 3,
              child: SizedBox(
                width: 60,
                height: 60,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: ThemePalette.primaryMain,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  child: const Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.directions_run, size: 20),
                    Text('START', style: ThemeText.caption,)
                  ],)
                ),
              ),
            ),
            /// SEARCH AND FILTERS
            const SearchFilterMap(),
            /// BOTTOMSHEET SEARCH RESULT LIST
            const SearchResultBottomsheet()
          ]);
        }
      )
    );
  }
}