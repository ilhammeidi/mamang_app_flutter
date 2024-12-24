import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/general_list.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class WalletList extends StatefulWidget {
  const WalletList({super.key});

  @override
  State<WalletList> createState() => _WalletListState();
}

class _WalletListState extends State<WalletList> {
  final List _banks = <GeneralList>[
    GeneralList(value: 'wallet1', text: 'Wallet A', thumb: 'assets/images/logos/logo9.jpg'),
    GeneralList(value: 'wallet2', text: 'Wallet B', thumb: 'assets/images/logos/logo10.jpg'),
    GeneralList(value: 'wallet3', text: 'Wallet C', thumb: 'assets/images/logos/logo11.jpg'),
    GeneralList(value: 'wallet4', text: 'Wallet D', thumb: 'assets/images/logos/logo12.png'),
    GeneralList(value: 'wallet5', text: 'Wallet E', thumb: 'assets/images/logos/logo13.png'),
    GeneralList(value: 'wallet6', text: 'Wallet F', thumb: 'assets/images/logos/logo14.jpg'),
  ];

  String _selected = '';

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: _banks.length,
      itemBuilder: ((BuildContext context, int index){
        final GeneralList item = _banks[index];
        return ListTile(
          title: Text(item.text!, style: const TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(item.text!, style: ThemeText.caption),
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(item.thumb),
          ),
          trailing: _selected == item.value ?
            Icon(Icons.check_circle, color: ThemePalette.primaryMain)
            : Icon(Icons.circle_outlined, color: colorScheme.outline),
          onTap: () {
            setState(() {
              _selected = item.value;
            });
          }
        );
      }),
    );
  }
}