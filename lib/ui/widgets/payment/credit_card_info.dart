import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class CreditCardInfo extends StatelessWidget {
  const CreditCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      flat: true,
      content: ListView(padding: EdgeInsets.all(spacingUnit(1)), shrinkWrap: true, children: [
        SizedBox(
          height: 40,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image.asset('assets/images/master_card.png'),
            const SizedBox(width: 4,),
            Image.asset('assets/images/visa.png'),
          ]),
        ),
        const SizedBox(height: 4),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Card Number'.toUpperCase(), style: ThemeText.caption,),
          SizedBox(width: spacingUnit(2)),
          const Expanded(
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: InputBorder.none,
                hintText: 'Number',
              ),
            ),
          )
        ]),
        const LineList(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Expiration Date'.toUpperCase(), style: ThemeText.caption,),
          SizedBox(width: spacingUnit(2)),
          const Expanded(
            child: TextField(
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: InputBorder.none,
              hintText: 'MM/YY',
            ),
            )
          ),
          SizedBox(width: spacingUnit(2)),
          Text('CVV'.toUpperCase(), style: ThemeText.caption,),
          SizedBox(width: spacingUnit(2)),
          const Expanded(
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: InputBorder.none,
                hintText: '3 Digits',
              ),
            ),
          ),
        ]),
        const LineList(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Cardholder Name'.toUpperCase(), style: ThemeText.caption,),
          SizedBox(width: spacingUnit(2),),
          const Expanded(
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: InputBorder.none,
                hintText: 'Name',
              ),
            ),
          )
        ]),
      ])
    );
  }
}