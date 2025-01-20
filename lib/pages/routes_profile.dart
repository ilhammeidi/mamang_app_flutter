import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/profile/personal/activities.dart';
import 'package:mamang_app_flutter/pages/profile/personal/detail_coin.dart';
import 'package:mamang_app_flutter/pages/profile/personal/detail_point.dart';
import 'package:mamang_app_flutter/pages/profile/personal/leaderboards.dart';
import 'package:mamang_app_flutter/pages/profile/personal/rewards.dart';
import 'package:mamang_app_flutter/pages/profile/profile_group.dart';
import 'package:mamang_app_flutter/pages/profile/profile_user.dart';


final List<GetPage> routesProfile = [
  GetPage(
    name: '/activities',
    page: () => const GeneralLayout(content: Activities()),
  ),
  GetPage(
    name: '/rewards',
    page: () => const GeneralLayout(content: Rewards()),
  ),
  GetPage(
    name: '/detail-point',
    page: () => const GeneralLayout(content: DetailPoint()),
  ),
  GetPage(
    name: '/detail-coin',
    page: () => const GeneralLayout(content: DetailCoin()),
  ),
  GetPage(
    name: '/leaderboards',
    page: () => const GeneralLayout(content: Leaderboards()),
  ),
  GetPage(
    name: '/user-profile',
    page: () => const GeneralLayout(content: ProfileUser()),
  ),
  GetPage(
    name: '/user-profile/:menu',
    page: () => const GeneralLayout(content: ProfileUser()),
  ),
  GetPage(
    name: '/group-profile',
    page: () => const GeneralLayout(content: ProfileGroup()),
  ),
];