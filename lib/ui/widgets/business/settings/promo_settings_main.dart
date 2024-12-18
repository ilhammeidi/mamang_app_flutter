import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/business/settings/setting_property.dart';
import 'package:mamang_app_flutter/ui/widgets/business/settings/setting_time.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/working_time.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

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
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      children: [
        /// AUTO SAVE SWITCHER
        AppInputBox(
          content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Expanded(
              child: Text('Auto Save',)
            ),
            Switch(
              value: _autoSave,
              activeColor: ThemePalette.primaryMain,
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
        AppTextField(
          controller: linkInputRef,
          label: 'Link',
          onChanged: (_) {},
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton(
              onPressed: () {},
              style: ThemeButton.tonalPrimary(context),
              child: const Icon(Icons.check)
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
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
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            color: Colors.amber.shade200,
            borderRadius: ThemeRadius.small,
          ),
          child: const Text(
            'Please do not put the link that containing ilegal contents like porn, violent, or any other inappropriate',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black),
          ),
        ),
        const VSpace(),

        /// TIME SETTINGS
        TitleActionSetting(
          title: 'Open Hours',
          textAction: 'SETTINGS',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const Wrap(
                  children: [
                    SettingTime()
                  ],
                );
              }
            );
          }
        ),
        const VSpaceShort(),
        const TimeList(),
        const VSpaceBig(),

        /// PROPERTY SETTINGS
        TitleActionSetting(
          title: 'Properties',
          textAction: 'SETTINGS',
          onTap: () {
            showModalBottomSheet<dynamic>(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const Wrap(children: [
                  SettingProperty()
                ]);
              }
            );
          }
        ),
        const VSpaceShort(),
        AppInputBox(content: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.bookmark, color: colorScheme.onPrimaryContainer),
              title: const Text('Available Saves: 20'),
              subtitle: const Text('Total saves today: 5/20', style: ThemeText.caption),
              contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            ),
            const LineList(),
            ListTile(
              leading: Icon(Icons.access_time_filled, color: colorScheme.onPrimaryContainer),
              title: const Text('Expired Date: 08/12/2024 @ 20:00'),
              subtitle: const Text('3 months 2 days left', style: ThemeText.caption),
              contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            ),
          ],
        )),
        const VSpaceBig(),

        /// VALIDATOR SETTINGS
        const TitleBasic(title: 'Validator'),
        const VSpaceShort(),
        AppInputBox(
          content: ListTile(
            leading: Icon(Icons.group, color: colorScheme.onPrimaryContainer),
            title: const Text('No Validator Yet'),
            contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
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
