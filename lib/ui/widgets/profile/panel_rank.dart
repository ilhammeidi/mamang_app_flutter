import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/rank_card.dart';

class PanelRank extends StatelessWidget {
  const PanelRank({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> rankList = [
      User(
        id: 1,
        name: 'Jean Doe',
        distance: 4,
        title: 'regular',
        status: 'active',
        avatar: ImgApi.avatar[6],
        coin: 200,
        point: 100,
      ),
      User(
        id: 2,
        name: 'John Doe',
        distance: 1.5,
        title: 'premium',
        status: 'active',
        avatar: ImgApi.avatar[0],
        coin: 100,
        point: 90,
      ),
      User(
        id: 3,
        name: 'Jena Doe',
        distance: 5,
        title: 'VIP',
        status: 'non-active',
        avatar: ImgApi.avatar[1],
        coin: 80,
        point: 80,
      ),
      User(
        id: 4,
        name: 'James Doe',
        distance: 0.5,
        title: 'regular',
        status: 'active',
        avatar: ImgApi.avatar[7],
        coin: 40,
        point: 10,
      ),
      User(
        id: 5,
        name: 'Jack Doe',
        distance: 1,
        title: 'VIP',
        status: 'non-active',
        avatar: ImgApi.avatar[8],
        coin: 10,
        point: 5,
      ),
    ];
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
              point: rankList[0].point,
              title: '#2 Gold',
              avatar: rankList[0].avatar,
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
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.stars, size: 16, color: Colors.amber)),
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