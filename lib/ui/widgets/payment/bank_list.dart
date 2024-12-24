import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/general_list.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class BankList extends StatefulWidget {
  const BankList({super.key});

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  final List _banks = <GeneralList>[
    GeneralList(value: 'bank1', thumb: 'assets/images/logos/logo1.png'),
    GeneralList(value: 'bank2', thumb: 'assets/images/logos/logo2.png'),
    GeneralList(value: 'bank3', thumb: 'assets/images/logos/logo3.png'),
    GeneralList(value: 'bank4', thumb: 'assets/images/logos/logo4.png'),
    GeneralList(value: 'bank5', thumb: 'assets/images/logos/logo5.png'),
    GeneralList(value: 'bank6', thumb: 'assets/images/logos/logo6.png'),
    GeneralList(value: 'bank7', thumb: 'assets/images/logos/logo7.png'),
    GeneralList(value: 'bank8', thumb: 'assets/images/logos/logo8.png'),
  ];

  String _selected = '';

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GridView.builder(
      primary: true,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(spacingUnit(2)),
      itemCount: _banks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              _selected = _banks[index].value;
            });
          },
          child: Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.small,
              border: Border.all(
                width: 2,
                color: _selected == _banks[index].value ? ThemePalette.primaryMain : colorScheme.outline
              )
            ),
            child: Image.asset(_banks[index].thumb, fit: BoxFit.fitWidth,),
          ),
        );
      }
    );
  }
}