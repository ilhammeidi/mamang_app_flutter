import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';

class SampleBottomPicker extends StatefulWidget {
  const SampleBottomPicker({super.key});

  @override
  State<SampleBottomPicker> createState() => _SampleBottomPickerState();
}

class _SampleBottomPickerState extends State<SampleBottomPicker> {
  List<ListItem> genderOptions = [
    ListItem(
      value: 'M',
      label: 'Music',
      text: 'Music description',
    ),
    ListItem(
      value: 'F',
      label: 'Film',
      text: 'Film description',
    ),
    ListItem(
      value: 'O',
      label: 'Other',
      text: 'Other description',
    ),
  ];

  String? gender;

  @override
  void initState() {
    super.initState();
  }

  void openGenderPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: genderOptions,
      title: 'Choose Option',
      onSelected: (value) => setState(() => gender = value),
      initialValue: gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Divider(
              color: Colors.blue.shade100,
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: const Text('Your gender'),
              trailing: Text(
                gender != null
                    ? genderOptions
                        .firstWhere(
                          (e) => e.value == gender,
                        )
                        .label
                    : ' - ',
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                openGenderPicker(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}