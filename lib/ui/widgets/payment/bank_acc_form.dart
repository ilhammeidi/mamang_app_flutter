import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class BankAccForm extends StatefulWidget {
  const BankAccForm({super.key});

  @override
  State<BankAccForm> createState() => _BankAccFormState();
}

class _BankAccFormState extends State<BankAccForm> {
  final TextEditingController _chooseRef = TextEditingController();
  String? bank;

  final List<ListItem> bankOptions = [
    ListItem(
      value: 'b1',
      label: 'Lorem Bank',
      text: 'LRB',
    ),
    ListItem(
      value: 'b2',
      label: 'Ipsum Bank',
      text: 'IPB',
    ),
    ListItem(
      value: 'b3',
      label: 'Dolor Bank',
      text: 'DLB',
    ),
    ListItem(
      value: 'b4',
      label: 'Other Bank',
      text: 'Choose it if your bank not listed',
    ),
  ];

  void openPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: bankOptions,
      title: 'Choose Bank',
      onSelected: (value) {
        if (value != null) {
          String result = bankOptions.firstWhere((e) => e.value == value).label;
          _chooseRef.text = result;
        }
        setState(() {
          bank = value;
        });
      },
      initialValue: bank,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppTextField(
        label: 'Choose Bank',
        controller: _chooseRef,
        onChanged: (_) {},
        suffix: const Icon(Icons.keyboard_arrow_down_rounded),
        onTap: () {
          openPicker(context);
        },
      ),
      SizedBox(height: spacingUnit(2)),
      AppTextField(
        label: 'Account Name',
        onChanged: (_) {},
      ),
      SizedBox(height: spacingUnit(2)),
      AppTextField(
        label: 'Account Number',
        onChanged: (_) {},
      ),
    ]);
  }
}