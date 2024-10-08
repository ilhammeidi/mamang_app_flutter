import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

enum UiMode { auto, dark, light }

class SettingList extends StatefulWidget {
  const SettingList({super.key});

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  UiMode _mode = UiMode.auto;
  void setMode(UiMode? val) {
    setState(() {
      _mode = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(spacingUnit(2)),
      children: [
      /// UI SETTINGS
        const TitleBasicSmall(title: 'UI Settings'),
        AppInputBox(content:
          Column(children: [
            ListTile(
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text('Auto'),
              trailing: Radio<UiMode>(
                value: UiMode.auto,
                groupValue: _mode,
                onChanged: setMode,
              ),
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Radio<UiMode>(
                value: UiMode.dark,
                groupValue: _mode,
                onChanged: setMode,
              ),
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Light Mode'),
              trailing: Radio<UiMode>(
                value: UiMode.light,
                groupValue: _mode,
                onChanged: setMode,
              ),
            ),
          ])
        ),
        const VSpace(),

        /// ACCOUNT SETTING
        const TitleBasicSmall(title: 'Help and Account'),
        const AppInputBox(content:
          Column(children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account Information'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            LineList(),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help Center'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            LineList(),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Contact Admin'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            LineList(),
            ListTile(
              leading: Icon(Icons.insert_drive_file_outlined),
              title: Text('Terms and Privacy'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ])
        ),
        const VSpace(),
      
        /// PAGE LIST
        const TitleBasicSmall(title: 'Page List'),
        AppInputBox(content:
          Column(children: [
            ListTile(
              leading: const Icon(Icons.store_mall_directory),
              title: const Text('Home Page'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search List'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/search-list');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.bookmark_outline),
              title: const Text('Saved Promo'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/saved');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.download_done_outlined),
              title: const Text('Saved Detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/saved/16');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.extension_outlined),
              title: const Text('Puzzle Detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/puzzle/1');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.explore_outlined),
              title: const Text('Explore'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/explore');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text('Promos'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/promos');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.sell_outlined),
              title: const Text('Promo Detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/promos/13');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.emoji_events_rounded),
              title: const Text('Events'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/events');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.emoji_events_outlined),
              title: const Text('Event Detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/events/2');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.all_inbox_outlined),
              title: const Text('Business'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/business');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.grid_view_outlined),
              title: const Text('Business Detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/business/2');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.create_rounded),
              title: const Text('Business New'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/business-new');
              },
            ),
          ])
        ),
        const VSpace(),

        /// UI LIST
        const TitleBasicSmall(title: 'UI List'),
        AppInputBox(content:
          Column(children: [
            ListTile(
              leading: const Icon(Icons.format_list_numbered_rounded),
              title: const Text('Forms'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/forms');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.ads_click),
              title: const Text('Buttons'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/buttons');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.rounded_corner),
              title: const Text('Shadow'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/shadow');
              },
            ),
            const LineList(),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed('/dark-mode');
              },
            ),
          ])
        ),
        const VSpace(),

        /// FOOTER
        SizedBox(
          height: 50,
          child: FilledButton(
            onPressed: () {}, 
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red
            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Logout'),
              SizedBox(width: 4),
              Icon(Icons.exit_to_app)
            ])
          ),
        ),
        const VSpace(),
        const Center(child: Text('Mamang App version 1.0', style: ThemeText.caption)),
        const VSpaceBig(),
      ]
    );
  }
}