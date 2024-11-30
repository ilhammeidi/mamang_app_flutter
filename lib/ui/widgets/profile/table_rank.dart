import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/rank_list.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class TableRank extends StatelessWidget {
  const TableRank({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )
      ),
      child: Column(
        children: [
          Row(children: [
            const Text('Table League', style: ThemeText.title2),
            const Spacer(),
            const Text('Season: ', style: ThemeText.paragraph,),
            Text('May 2025', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
            child: Row(children: [
              const Icon(Icons.stars, size: 16, color: Colors.cyan),
              const Text(' Point', style: ThemeText.caption,),
              const SizedBox(width: 4),
      
              Icon(Icons.bookmark, size: 16, color: ThemePalette.primaryMain),
              const Text(' Saved', style: ThemeText.caption,),
              const SizedBox(width: 4),
      
              Icon(Icons.share, size: 16, color: ThemePalette.secondaryMain),
              const Text(' Shared', style: ThemeText.caption,),
              const SizedBox(width: 4),
      
              Icon(Icons.favorite, size: 16, color: ThemePalette.tertiaryMain),
              const Text(' Liked', style: ThemeText.caption,),
              const SizedBox(width: 4),
      
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const Text(' Ratings', style: ThemeText.caption,),
            ]),
          ),
          SingleChildScrollView(
            child: DataTable(
              dataRowMinHeight: 20,
              dataRowMaxHeight: 25,
              columnSpacing: 0, 
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(
                    flex: 1,
                    child: Text('#', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    flex: 2,
                    child: Text('Name', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),),
                  ),
                ),
                const DataColumn(
                  numeric: true,
                  label: Expanded(
                    flex: 1,
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.stars, size: 16, color: Colors.cyan)),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Expanded(
                    flex: 1,
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.bookmark, size: 16, color: ThemePalette.primaryMain)),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Expanded(
                    flex: 1,
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.share, size: 16, color: ThemePalette.secondaryMain)),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Expanded(
                    flex: 1,
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.favorite, size: 16, color: ThemePalette.tertiaryMain)),
                  ),
                ),
                const DataColumn(
                  numeric: true,
                  label: Expanded(
                    flex: 1,
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.star, size: 16, color: Colors.amber)),
                  ),
                ),
              ],
              rows: List.generate(rankList.length, (int index) {
                User item = rankList[index];
                return DataRow(
                  color: index == 1 ? WidgetStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.25)) : null,
                  cells: <DataCell>[
                    DataCell(Text('${index+1}', style: ThemeText.caption)),
                    DataCell(Text(item.name, style: ThemeText.caption)),
                    DataCell(Text(item.coin.toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                    DataCell(Text(item.point.toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                    DataCell(Text(((item.distance * 10)).toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                    DataCell(Text((item.point / 4).toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                    DataCell(Text((item.distance * 4).toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                  ],
                );
              })
            ),
          ),
        ],
      ),
    );
  }
}