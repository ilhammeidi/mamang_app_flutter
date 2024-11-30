import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/rank_list.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/rank_card.dart';

class PanelRank extends StatelessWidget {
  const PanelRank({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> topRank = rankList.sublist(0, 5);
    return Container(
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Row(children: [
          Expanded(
            child: RankCard(
              point: topRank[0].point,
              title: '#2 Gold',
              avatar: topRank[0].avatar,
              color: Colors.purple,
              badge: Icon(
                Icons.emoji_events_rounded,
                color: Colors.amber,
                size: 65,
                shadows: [ThemeShade.shadeMedium(context)]
              )
            ),
          ),
          SizedBox(width: spacingUnit(2)),
          Expanded(
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
              ],
              rows: List.generate(topRank.length, (int index) {
                User item = topRank[index];
                return DataRow(
                  color: index == 1 ? WidgetStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.25)) : null,
                  cells: <DataCell>[
                    DataCell(Text('${index+1}', style: ThemeText.caption)),
                    DataCell(Text(item.name, style: ThemeText.caption)),
                    DataCell(Text(item.coin.toString(), style: ThemeText.caption, textAlign: TextAlign.end,)),
                  ],
                );
              })
            ),
          )
        ]),
      ),
    );
  }
}