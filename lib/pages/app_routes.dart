import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/business/business_main.dart';
import 'package:mamang_app_flutter/pages/event/detail.dart';
import 'package:mamang_app_flutter/pages/event/main.dart';
import 'package:mamang_app_flutter/pages/explore/main.dart';
import 'package:mamang_app_flutter/pages/home.dart';
import 'package:mamang_app_flutter/pages/profile/profile_main.dart';
import 'package:mamang_app_flutter/pages/promo/main.dart';
import 'package:mamang_app_flutter/pages/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';
import 'package:mamang_app_flutter/pages/sample_shadow.dart';
import 'package:mamang_app_flutter/pages/saved/main.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
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
    name: '/promos',
    page: () => const GeneralLayout(content: PromoMain()),
  ),
  GetPage(
    name: '/events',
    page: () => const GeneralLayout(content: EventMain()),
  ),
  GetPage(
    name: '/events/:id',
    page: () => const GeneralLayout(content: EventDetail()),
  ),
  GetPage(
    name: '/forms',
    page: () => const GeneralLayout(content: SampleForm()),
  ),
  GetPage(
    name: '/buttons',
    page: () => const GeneralLayout(content: SampleButton()),
  ),
  GetPage(
    name: '/shadow',
    page: () => const GeneralLayout(content: SampleShadow()),
  ),
  GetPage(
    name: '/dark-mode',
    page: () => SampleDarkLight(),
  ),
];