import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/working_time.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class PromoSettings extends StatefulWidget {
  const PromoSettings({super.key});

  @override
  State<PromoSettings> createState() => _PromoSettingsState();
}

class _PromoSettingsState extends State<PromoSettings> {
  bool _autoSave = false;
  bool _isMirorLlink = false;
  final linkInputRef = TextEditingController();

  @override
  void dispose() {
    linkInputRef.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      children: [
        /// AUTO SAVE SWITCHER
        AppInputBox(
          content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Expanded(
              child: Text('Auto Save')
            ),
            Switch(
              value: _autoSave,
              activeColor: ThemePalette.primaryLight,
              onChanged: (bool value) {
                setState(() {
                  _autoSave = value;
                });
              },
            )
          ]),
        ),
        const Text(
          'Auto Save is a feature to allowed all related promos saved in an event',
          style: ThemeText.caption,
          textAlign: TextAlign.start,
        ),
        const VSpace(),

        /// LINK INPUT
        Row(children: [
          Expanded(
            child: AppTextField(
              controller: linkInputRef,
              label: 'Link',
              onChanged: (_) {},
              suffix: IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle_outline, size: 22, color: ThemePalette.primaryMain),
              ),
            ),
          ),
          const SizedBox(width: 2),
          FilledButton(
            onPressed: () {},
            style: ThemeButton.tonalPrimary(context),
            child: const Icon(Icons.check)
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Checkbox(
                value: _isMirorLlink,
                onChanged: (bool? value) {
                  setState(() {
                    _isMirorLlink = value!;
                  });
                }
              ),
            ),
            const SizedBox(width: 2),
            const Text('Miror link?', style: ThemeText.caption)
          ],
        ),
        const VSpaceShort(),

        /// WARNING
        Container(
          padding: EdgeInsets.all(spacingUnit(2)),
          decoration: BoxDecoration(
            color: Colors.amber.shade200,
            borderRadius: ThemeRadius.small,
          ),
          child: const Text(
            'Please do not put the link that containing ilegal things like porn, violent, or any other inappropriate',
            textAlign: TextAlign.start,
          ),
        ),
        const VSpace(),

        /// TIME SETTINGS
        TitleActionSetting(
          title: 'Open Hours',
          textAction: 'SETTING',
          onTap: () {}
        ),
        const VSpaceShort(),
        const TimeList(),
        const VSpace(),

        /// PROPERTY SETTINGS
        TitleActionSetting(
          title: 'Properties',
          textAction: 'SETTING',
          onTap: () {}
        ),
        const VSpaceShort(),
        AppInputBox(content: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.bookmark, color: colorScheme.primaryContainer),
              title: const Text('Available Saves: 20'),
              subtitle: const Text('ToTal saves today: 5/20', style: ThemeText.caption),
            ),
            const LineList(),
            ListTile(
              leading: Icon(Icons.access_time_filled, color: colorScheme.primaryContainer),
              title: const Text('Expired Date: 08/12/2024 @ 20:00'),
              subtitle: const Text('3 months 2 days left', style: ThemeText.caption),
            ),
          ],
        )),
        const VSpace(),

        /// VALIDATOR SETTINGS
        TitleActionSetting(
          title: 'Properties',
          textAction: 'SETTING',
          onTap: () {}
        ),
        const VSpaceShort(),
        AppInputBox(
          content: ListTile(
            leading: Icon(Icons.group, color: colorScheme.primaryContainer),
            title: const Text('No Validator Yet'),
            trailing: FilledButton(
              onPressed: () {},
              style: ThemeButton.primary,
              child: const Text('Add Validator')
            ),
          ),
        ),
      ],
    );
  }
}

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
    
    return Column(children: [
      const GrabberIcon(),
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
          Icon(Icons.bookmark, color: colorScheme.primaryContainer),
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
      TextField(
        controller: _dateRef,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Expire Date',
          prefixIcon: Icon(Icons.date_range)
        ),
        onTap: () {
          _selectDate();
        },
      ),
      const VSpaceShort(),
      
      /// ACTION BUTTONS
      Padding(padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: ThemeButton.outlinedSecondary(context),
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
      )
    ]);
  }
}

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
    return Column(children: [
      const GrabberIcon(),
      Padding(
        padding: EdgeInsets.only(
          bottom: spacingUnit(2),
        ),
        child: Text('Setting Open Hours', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      ),
      const VSpaceShort(),
      AppInputBox(content: ListView(children: [
        _timePicker(context, 'Sunday'),
        _timePicker(context, 'Monday'),
        _timePicker(context, 'Tuesday'),
        _timePicker(context, 'Wednesday'),
        _timePicker(context, 'Thursday'),
        _timePicker(context, 'Firday'),
        _timePicker(context, 'Saturday'),
      ])),
      const VSpaceShort(),

      /// ACTION BUTTONS
      Padding(padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: ThemeButton.outlinedSecondary(context),
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
      )
    ]);
  }

  Widget _timePicker(BuildContext context, String dayName) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(dayName, style: ThemeText.title.copyWith(fontWeight: FontWeight.bold)),
        const Text('Closed', style: ThemeText.caption)
      ]),
      const SizedBox(height: 4),
      Row(children: [
        AppTextField(
          controller: _timePickerRef,
          readOnly: true,
          prefixIcon: Icons.access_time,
          label: 'Time from',
          onChanged: (_) {},
          onTap: _selectTime,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text('-')),
        AppTextField(
          controller: _timePickerRef,
          readOnly: true,
          prefixIcon: Icons.access_time,
          label: 'Time to',
          onChanged: (_) {},
          onTap: _selectTime,
        ),
        const Spacer(),
        SizedBox(
          width: 100,
          height: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: _holiday,
              activeColor: ThemePalette.primaryLight,
              onChanged: (bool value) {
                setState(() {
                  _holiday = value;
                });
              },
            ),
          ),
        )
      ])
    ]);
  }
}