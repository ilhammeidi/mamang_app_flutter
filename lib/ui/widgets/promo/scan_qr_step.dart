import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class ScanQrStep extends StatelessWidget {
  const ScanQrStep({super.key});

  @override
  Widget build(BuildContext context) {
    double circleSize = 15;
    double iconSize = circleSize * 2 - 2;

    return PaperCard(
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: spacingUnit(1)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          /// PROGRESS INDICATOR
          SizedBox(
            width: 80,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              CircleAvatar(
                radius: circleSize,
                backgroundColor: Colors.green.shade200,
                child: Icon(Icons.check_circle_rounded, color: Colors.green, size: iconSize),
              ),
              _lineVertical(300, context),
              CircleAvatar(
                radius: circleSize,
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                child: Icon(
                  Icons.sports_esports_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: iconSize
                ),
              ),
              _lineVertical(50, context),
              CircleAvatar(
                radius: circleSize,
                backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                child: Icon(
                  Icons.extension_outlined,
                  color: Theme.of(context).colorScheme.onTertiary,
                  size: iconSize
                ),
              ),
            ]),
          ),
          /// PROGRESS CONTENTS
          Expanded(child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              /// SCAN QR
              _progressContent(
                'Scan QR Promo',
                'Show this QR Code to merchant to get puzzle fragment',
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/qrcode.webp', fit: BoxFit.contain)
                ),
                context
              ),
              /// CHALLENGE QUESTION
              SizedBox(height: spacingUnit(2)),
              _progressContent(
                'Quest Challenge',
                'After you scan the QR Promo, finish the challenge to get puzzle fragment',
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const Quiz();
                      }
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(spacingUnit(2)),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: ThemeRadius.small,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        'Start Challenge',
                        style: ThemeText.title2.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 18,)
                    ]),
                  ),
                ),
                context
              ),
              /// PUZZLE FRAGMENT
              SizedBox(height: spacingUnit(2)),
              _progressContent(
                'Fragment Puzzle',
                'After you finish the challenge above, the puzzle fragment will be revealed and you worth to collect it',
                Container(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text('?', style: TextStyle(fontSize: 80, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                ),
                context
              ),
            ],
          ))
        ]),
      )
    );
  }

  Widget _lineVertical(double height, context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
      child: SizedBox(
        width: 4,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
            borderRadius: const BorderRadius.all(Radius.circular(2))
          ),
        ),
      ),
    );
  }

  Widget _progressContent(String title, String desc, Widget content, context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, textAlign: TextAlign.start, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      SizedBox(height: spacingUnit(1)),
      Text(desc, textAlign: TextAlign.start),
      SizedBox(height: spacingUnit(2)),
      content
    ]);
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Map<String, dynamic>> answerList = [
    {
      'option': 'a',
      'answer': 'Mars',
    },
    {
      'option': 'b',
      'answer': 'Venus',
    },
    {
      'option': 'c',
      'answer': 'Jupiter',
    }
  ];

  int _choosenAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// QUESTION
      Padding(
        padding: EdgeInsets.only(
          top: spacingUnit(3),
          bottom: spacingUnit(2),
        ),
        child: Text('Please answer thi question', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.only(
          bottom: spacingUnit(2),
        ),
        child: const Text('Which planet is known as the Red Planet?'),
      ),
      /// ANSWERS
      Expanded(
        child: ListView.builder(
          itemCount: answerList.length,
          itemBuilder: ((context, index) {
            Map item = answerList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _choosenAnswer = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(spacingUnit(1)),
                margin: EdgeInsets.only(bottom: spacingUnit(1)),
                decoration: BoxDecoration(
                  color: index == _choosenAnswer ? ThemePalette.secondaryMain : Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.outline
                  )
                ),
                child: ListTile(
                  leading: Text('${item['option']}.', style: const TextStyle(color: Colors.white)),
                  minLeadingWidth: 16,
                  title: Text(item['answer'], style: const TextStyle(color: Colors.white)),
                ),
              ),
            );
          })
        ),
      ),
      /// ACTION BUTTONS
      Padding(padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(children: [
          OutlinedButton(
            onPressed: () {},
            style: ThemeButton.outlinedSecondary(context),
            child: const Text('Answer Later'),
          ),
          const SizedBox(width: 4),
          FilledButton(
            onPressed: () {},
            style: ThemeButton.primary,
            child: const Text('Confirm My Answer'),
          )
        ]),
      )
    ]);
  }
}