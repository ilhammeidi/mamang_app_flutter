import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class TagHistory extends StatelessWidget {
  const TagHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final List tagsList = ['fast food', 'car workshop expert', '24 hours internet cafe', 'cafe', 'coffe shop'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Search History', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: spacingUnit(1)),
          Wrap(alignment: WrapAlignment.start, children: 
            tagsList.map((item) => InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.big,
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.5)
                  ),
                  child: Text(item),
                ),
            )
            ).toList()
          )
        ],
      ),
    );
  }
}

class TagTrending extends StatelessWidget {
  const TagTrending({super.key});

  @override
  Widget build(BuildContext context) {
    final List tagsList = ['cheese pizza', 'vegetarian', 'grocery', 'auto service', 'custom bike'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Search', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: spacingUnit(1)),
          Wrap(alignment: WrapAlignment.start, children: 
            tagsList.map((item) => InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.big,
                  color: Theme.of(context).colorScheme.secondaryContainer
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.trending_up, color: Theme.of(context).colorScheme.onSecondaryContainer),
                  const SizedBox(width: 2),
                  
                  Text(item, style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer))
                ]),
              ),
            )
            ).toList()
          )
        ],
      ),
    );
  }
}