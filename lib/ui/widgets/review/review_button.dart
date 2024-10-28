import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/review/rating_star.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_form.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton({super.key, this.reviewed = false});

  final bool reviewed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return reviewed ? GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const Wrap(
              children: [
                ReviewForm()
              ]
            );
          }
        );
      },
      child: Container(
        margin: EdgeInsets.all(spacingUnit(1)),
        padding: EdgeInsets.all(spacingUnit(2)),
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.medium,
          border: Border.all(
            width: 1,
            color: colorScheme.outline
          )
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Your Review', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RatingStar(initVal: 5),
            Text('2 day ago', style: ThemeText.caption)
          ]),
          SizedBox(height: 4),
          Text('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae', textAlign: TextAlign.start)  
        ]),
      ),
    ) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            child: const Text('Write your review and get 🪙 10 coins'),
          ),
        ),
        SizedBox(
          height: 40,
          child: OutlinedButton(
            onPressed: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const Wrap(
                    children: [
                      ReviewForm()
                    ]
                  );
                }
              );
            },
            style: ThemeButton.outlinedPrimary(context),
            child: const Row(children: [
              Icon(Icons.edit_note_rounded),
              SizedBox(width: 4),
              Text('Write Review',)
            ])
          ),
        ),
      ]),
    );
  }
}