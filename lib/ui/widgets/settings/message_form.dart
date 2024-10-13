import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class MessageForm extends StatefulWidget {
  const MessageForm({super.key});

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final TextEditingController _chooseRef = TextEditingController();
  String? categoryTemp;

  List<ListItem> categoryOptions = [
    ListItem(
      value: 'promotion',
      label: 'Promotion',
    ),
    ListItem(
      value: 'event',
      label: 'Event',
    ),
    ListItem(
      value: 'account',
      label: 'Account',
    ),
    ListItem(
      value: 'feedback',
      label: 'Feedback',
    ),
    ListItem(
      value: 'app',
      label: 'This App',
    ),
    ListItem(
      value: 'other',
      label: 'Other',
    ),
  ];

  void openPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: categoryOptions,
      title: 'Choose Category',
      initialValue: categoryTemp,
      onSelected: (value) {
        if (value != null) {
          String result = categoryOptions.firstWhere((e) => e.value == value).label;
          _chooseRef.text = result;
        }
        setState(() {
          categoryTemp = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(spacingUnit(2)), children: [
      const VSpace(),
      const Text('Contact us below if you need help / want to activate the promo', style: ThemeText.subtitle2),
      const VSpace(),
      AppTextField(
        controller: _chooseRef,
        label: 'Choose Topic',
        onChanged: (_) {},
        onTap: () {
          openPicker(context);
        },
        suffix: const Icon(Icons.arrow_drop_down),
      ),
      const VSpaceShort(),
      AppTextField(
        label: 'Subject',
        onChanged: (_) {},
      ),
      const VSpaceShort(),
      AppTextField(label: 'Description', maxLines: 5, onChanged: (_) {}),
      const VSpaceShort(),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () {},
          style: ThemeButton.btnBig.merge(ThemeButton.primary),
          child: const Text('SUBMIT MESSAGE'),
        ),
      )
    ]);
  }
}