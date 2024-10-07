import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class ScanQrStep extends StatelessWidget {
  const ScanQrStep({super.key});

  @override
  Widget build(BuildContext context) {
    double circleSize = 15;
    double iconSize = circleSize * 2 - 2;

    return Padding(
      padding: EdgeInsets.all(spacingUnit(1)),
      child: PaperCard(
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: spacingUnit(1)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// PROGRESS INDICATOR
            SizedBox(
              width: 60,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                CircleAvatar(
                  radius: circleSize,
                  backgroundColor: Colors.green.shade200,
                  child: Icon(Icons.check_circle_rounded, color: Colors.green, size: iconSize),
                ),
                _lineVertical(305, context),
                CircleAvatar(
                  radius: circleSize,
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.sports_esports_outlined,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    size: iconSize
                  ),
                ),
                _lineVertical(115, context),
                CircleAvatar(
                  radius: circleSize,
                  backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Icon(
                    Icons.extension_outlined,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
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
                    width: 250,
                    height: 250,
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
                      showModalBottomSheet<dynamic>(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const Wrap(
                            children: [
                              Quiz(),
                            ]
                          );
                        }
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(spacingUnit(1)),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: ThemeRadius.small,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          'Start Challenge',
                          style: ThemeText.subtitle.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)
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
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text('?', style: TextStyle(fontSize: 80, color: ThemePalette.primaryMain)),
                  ),
                  context
                ),
              ],
            ))
          ]),
        )
      ),
    );
  }

  Widget _lineVertical(double height, context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
      child: SizedBox(
        width: 6,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
            borderRadius: const BorderRadius.all(Radius.circular(6))
          ),
        ),
      ),
    );
  }

  Widget _progressContent(String title, String desc, Widget content, context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
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
      'option': 'A',
      'answer': 'Mars',
    },
    {
      'option': 'B',
      'answer': 'Venus',
    },
    {
      'option': 'C',
      'answer': 'Jupiter',
    }
  ];

  int _choosenAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// QUESTION
      const GrabberIcon(),
      const VSpace(),
      
      Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Text('Please answer this question', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: const Text('Which planet is known as the Red Planet?', textAlign: TextAlign.center, style: ThemeText.subtitle,),
      ),
      /// ANSWERS
      SizedBox(
        height: 180,
        child: ListView.builder(
          padding: EdgeInsets.all(spacingUnit(2)),
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
                margin: EdgeInsets.only(bottom: spacingUnit(1)),
                decoration: BoxDecoration(
                  color: index == _choosenAnswer ? ThemePalette.secondaryMain : Colors.transparent,
                  borderRadius: ThemeRadius.big,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.outline
                  )
                ),
                child: ListTile(
                  minTileHeight: 24,
                  leading: Text(
                    '${item['option']}.',
                    style: TextStyle(color: index == _choosenAnswer ? Colors.white : Theme.of(context).colorScheme.onSurface)
                  ),
                  minLeadingWidth: 16,
                  title: Text(
                    item['answer'],
                    style: TextStyle(color: index == _choosenAnswer ? Colors.white : Theme.of(context).colorScheme.onSurface)
                  ),
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
            onPressed: () {
              Get.back();
            },
            style: ThemeButton.outlinedSecondary(context),
            child: const Text('Answer Later'),
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ThemeButton.primary,
              child: const Text('Confirm My Answer'),
            ),
          )
        ]),
      ),
      const VSpaceBig()
    ]);
  }
}