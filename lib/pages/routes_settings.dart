import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/profile/contact.dart';
import 'package:mamang_app_flutter/pages/profile/faq_list.dart';
import 'package:mamang_app_flutter/pages/profile/edit_password.dart';
import 'package:mamang_app_flutter/pages/profile/edit_profile.dart';
import 'package:mamang_app_flutter/pages/profile/terms_condition.dart';

final List<GetPage> routesSettings = [
  GetPage(
    name: '/edit-profile',
    page: () => const GeneralLayout(content: EditProfile()),
  ),
  GetPage(
    name: '/change-password',
    page: () => const GeneralLayout(content: EditPassword()),
  ),
  GetPage(
    name: '/contact',
    page: () => const GeneralLayout(content: Contact()),
  ),
  GetPage(
    name: '/faq',
    page: () => const GeneralLayout(content: FaqList()),
  ),
  GetPage(
    name: '/terms-conditions',
    page: () => const GeneralLayout(content: TermsCondition()),
  ),
];