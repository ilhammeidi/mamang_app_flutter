import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/business/business_main.dart';
import 'package:mamang_app_flutter/pages/explore/explore_main.dart';
import 'package:mamang_app_flutter/pages/home.dart';
import 'package:mamang_app_flutter/pages/profile/profile_main.dart';
import 'package:mamang_app_flutter/pages/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';
import 'package:mamang_app_flutter/pages/sample_shadow.dart';
import 'package:mamang_app_flutter/pages/saved/saved_main.dart';
import 'package:mamang_app_flutter/ui/layouts/home_layout.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: '/',
    page: () => const HomeLayout(content: HomeMain()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/saved',
    page: () => const HomeLayout(content: SavedMain()),
    transition: Transition.fadeIn,
    
  ),
  GetPage(
    name: '/explore',
    page: () => const HomeLayout(content: ExploreMain()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/business',
    page: () => const HomeLayout(content: BusinessMain()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/profile',
    page: () => const HomeLayout(content: ProfileMain()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/forms',
    page: () => const HomeLayout(content: SampleForm()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/buttons',
    page: () => const HomeLayout(content: SampleButton()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/shadow',
    page: () => const HomeLayout(content: SampleShadow()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/dark-mode',
    page: () => SampleDarkLight(),
  ),
];