import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class SettingTime extends StatefulWidget {
  const SettingTime({super.key});

  @override
  State<SettingTime> createState() => _SettingTimeState();
}

class _SettingTimeState extends State<SettingTime> {
  final TextEditingController _timePickerRef = TextEditingController();
  bool _holiday = false;

  Future<void> _selectTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
      orientation: Orientation.portrait,
      initialEntryMode: TimePickerEntryMode.dial
    );
  
    setState(() {
      _timePickerRef.text = time!.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        const GrabberIcon(),
        Padding(
          padding: EdgeInsets.only(
            bottom: spacingUnit(2),
          ),
          child: Text('Setting Open Hours', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
        ),
        const VSpaceShort(),
        SizedBox(
          height: 600,
          child: ListView(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              _timePicker(context, 'Monday'),
              _timePicker(context, 'Tuesday'),
              _timePicker(context, 'Wednesday'),
              _timePicker(context, 'Thursday'),
              _timePicker(context, 'Friday'),
              _timePicker(context, 'Saturday'),
              _timePicker(context, 'Sunday'),
            ]
          ),
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
              style: ThemeButton.btnBig,
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
              style: ThemeButton.btnBig.merge(ThemeButton.primary),
              child: const Text('Update'),
            ),
          )
        ]),
        const VSpaceShort(),
      ]),
    );
  }

  Widget _timePicker(BuildContext context, String dayName) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(dayName, textAlign: TextAlign.start, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      Row(children: [
        SizedBox(
          width: 120,
          child: AppTextField(
            controller: _timePickerRef,
            readOnly: true,
            prefixIcon: Icons.access_time,
            label: 'From',
            onChanged: (_) {},
            onTap: _selectTime,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('-')),
        SizedBox(
          width: 120,
          child: AppTextField(
            controller: _timePickerRef,
            readOnly: true,
            prefixIcon: Icons.access_time,
            label: 'To',
            onChanged: (_) {},
            onTap: _selectTime,
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Checkbox(
              value: _holiday,
              activeColor: ThemePalette.tertiaryMain,
              onChanged: (bool? value) {
                setState(() {
                  _holiday = value!;
                });
              }
            ),
            const SizedBox(height: 2),
            const Text('Closed', style: ThemeText.caption)
          ],
        )
      ]),
      const VSpaceShort()
    ]);
  }
}