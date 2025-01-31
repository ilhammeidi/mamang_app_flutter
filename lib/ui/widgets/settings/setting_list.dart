import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/settings/account_info.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class SettingList extends StatelessWidget {
  SettingList({super.key}) {
     _getThemeStatus();
  }

  final RxString _themeMode = 'auto'.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getThemeStatus() async {
    var mode = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('appTheme') ?? 'auto';
    }).obs;

    _themeMode.value = await mode.value;
  }

  _saveThemeStatus(val) async {
    SharedPreferences pref = await _prefs;

    _themeMode.value = val;

    switch(val) {
      case 'dark':
        pref.setString('appTheme', val);
        Get.changeThemeMode(ThemeMode.dark);
      break;
      case 'light':
        pref.setString('appTheme', 'light');
        Get.changeThemeMode(ThemeMode.light);
      break;
      default:
        pref.setString('appTheme', 'auto');
        pref.remove('appTheme');
        
        var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      break;
    }
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
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.brightness_6_outlined),
                title: const Text('Auto'),
                onTap: () {
                  _saveThemeStatus('auto');
                },
                trailing: Obx(() => _themeMode.value == 'auto' ?  Icon(Icons.check_circle, color: ThemePalette.secondaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                onTap: () {
                  _saveThemeStatus('dark');
                },
                trailing: Obx(() => _themeMode.value == 'dark' ? Icon(Icons.check_circle, color: ThemePalette.secondaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: const Text('Light Mode'),
                onTap: () {
                  _saveThemeStatus('light');
                },
                trailing: Obx(() => _themeMode.value == 'light' ? Icon(Icons.check_circle, color: ThemePalette.secondaryMain) : const Icon(Icons.circle_outlined) ),
              ),
            ]),
          )
        ),
        const VSpace(),

        /// AUTH PAGES
        const TitleBasicSmall(title: 'Auth Pages'),
         PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
               ListTile(
                leading: const Icon(Icons.waving_hand_outlined),
                title: const Text('Welcome Page'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/welcome');
                },
               ),
               const LineList(),
               ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text('Login'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/login');
                },
               ),
               const LineList(),
               ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title: const Text('Register'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/register');
                },
               ),
               const LineList(),
               ListTile(
                leading: const Icon(Icons.pin),
                title: const Text('Pin OTP'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/otp');
                },
               ),
               const LineList(),
               ListTile(
                leading: const Icon(Icons.key_sharp),
                title: const Text('Reset Password'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/reset-password');
                },
               ),
            ])
          )
         ),
         const VSpace(),

        /// ACCOUNT SETTING
        const TitleBasicSmall(title: 'Help and Account'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Account Information'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const Wrap(
                        children: [
                          AccountInfo()
                        ],
                      );
                    }
                  );
                },
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/faq');
                },
                leading: const Icon(Icons.help_outline),
                title: const Text('FAQ'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/contact');
                },
                leading: const Icon(Icons.message_outlined),
                title: const Text('Contact Admin'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/terms-conditions');
                },
                leading: const Icon(Icons.insert_drive_file_outlined),
                title: const Text('Terms and Conditions'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ]),
          )
        ),
        const VSpace(),
      
        /// PAGE LIST
        const TitleBasicSmall(title: 'Page List'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
                leading: const Icon(Icons.public),
                title: const Text('Search Map'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/search-map');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.list_alt_outlined),
                title: const Text('Search result'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/search-result');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.chat_bubble_outline),
                title: const Text('Chat'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/inbox');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Notifications'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/notifications');
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
                leading: const Icon(Icons.star_outline),
                title: const Text('Rating and Review'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/ratings-reviews');
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
                leading: const Icon(Icons.bolt),
                title: const Text('Social Media'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/updates');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.campaign),
                title: const Text('Post Detail'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/updates/11');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Create Post'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/create-post');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.access_time_outlined),
                title: const Text('Create Short Post'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/create-short-post');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.person_2_outlined),
                title: const Text('User Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/user-profile');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.group_outlined),
                title: const Text('Group Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/group-profile');
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
              const LineList(),
              ListTile(
                leading: const Icon(Icons.monetization_on_outlined),
                title: const Text('Payment'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text('Payment Credit Card'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/credit-card');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.wallet),
                title: const Text('Payment E-Wallet'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/ewallet');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.account_balance),
                title: const Text('Payment Transfer'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/transfer');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.contacts_rounded),
                title: const Text('Payment Virtual Account'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/vac');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text('Payment Status'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/status');
                },
              ),
              const LineList(),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Payment History'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed('/payment/history');
                },
              ),
            ]),
          )
        ),
        const VSpace(),

        /// UI LIST
        const TitleBasicSmall(title: 'UI List'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
            ]),
          )
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
        Center(child: Text('${branding.name} Version: ${branding.version}', style: ThemeText.caption)),
        const VSpaceBig(),
      ]
    );
  }
}