import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';

class SettingProperty extends StatefulWidget {
  const SettingProperty({super.key});

  @override
  State<SettingProperty> createState() => _SettingPropertyState();
}

class _SettingPropertyState extends State<SettingProperty> {
  final TextEditingController _dateRef = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _dateRef.text = picked.toString().split(" ")[0];
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        const GrabberIcon(),
        const VSpace(),
        /// Title
        Padding(
          padding: EdgeInsets.only(
            bottom: spacingUnit(2),
          ),
          child: Text('Setting Property', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
        ),
        const VSpaceShort(),
      
        /// FORMS
        AppInputBox(
          content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(Icons.bookmark, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
            const Text('Total Available Saves'),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle_outline, size: 30, color: Theme.of(context).colorScheme.onSurface)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('1', style: ThemeText.subtitle),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline, size: 30, color: Theme.of(context).colorScheme.onSurface)),
          ])
        ),
        const VSpaceShort(),
        AppTextField(
          controller: _dateRef,
          readOnly: true,
          label: 'Expire Date',
          prefixIcon: Icons.date_range,
          onChanged: (_) {},
          onTap: () {
            _selectDate();
          },
        ),
        const VSpaceShort(),
        
        /// ACTION BUTTONS
        Row(children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Discard'),
            ),
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(
            flex: 1,
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ThemeButton.primary,
              child: const Text('Update'),
            ),
          )
        ]),
        const VSpaceBig()
      ]),
    );
  }
}