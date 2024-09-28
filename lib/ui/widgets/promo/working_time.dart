import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class WorkingTime extends StatefulWidget {
  const WorkingTime({
    super.key,
  });

  @override
  State<WorkingTime> createState() => _WorkingTimeState();
}

class _WorkingTimeState extends State<WorkingTime> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isShow = isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded){
                return ListTile(
                  title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Row(children: [
                      Icon(Icons.access_time_outlined, size: 12, color: Colors.green.shade600),
                      const SizedBox(width: 2),
                      Text('OPEN', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
                    ])
                  ),
                  trailing: Row(children: [
                    const Text('Close at 9:00 PM'),
                    const SizedBox(width: 2),
                    _isShow ? const Icon(Icons.arrow_drop_down, size: 16) : const Icon(Icons.arrow_drop_up, size: 16)  
                  ])
                );
              },
              body: Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: const TimeList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeList extends StatelessWidget {
  const TimeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dayList = [
      {
        'day': 'Monday',
        'time': '09:00 - 21:00'
      },
      {
        'day': 'Tuesday',
        'time': '09:00 - 21:00'
      },
      {
        'day': 'Wednesday',
        'time': '09:00 - 21:00'
      },
      {
        'day': 'Thursday',
        'time': '09:00 - 21:00'
      },
      {
        'day': 'Friday',
        'time': 'Closed'
      },
      {
        'day': 'Saturday',
        'time': '09:00 - 21:00'
      },
      {
        'day': 'Sunday',
        'time': '09:00 - 21:00'
      },
    ];
    return ListView.builder(
      itemCount: dayList.length,
      itemBuilder: ((context, index) {
        Map item = dayList[index];
        return Column(
          children: [
            ListTile(
              leading: Text(item['day']),
              minLeadingWidth: 100,
              title: item['time'] != 'Closed' ? Row(children: [
                Icon(Icons.access_time_outlined, size: 12, color: Theme.of(context).colorScheme.onSurfaceVariant,),
                const SizedBox(width: 2),
                Text(item['time'])
              ]) : Text(item['time'], style: const TextStyle(color: Colors.red))
            ),
            index < dayList.length ?
              Divider(color: Theme.of(context).colorScheme.outline, height: 1, thickness: 1)
              : Container()
          ],
        );
      }),
    );
  }
}