import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/profile/profile_main.dart';
import 'package:mamang_app_flutter/pages/explore/explore_main.dart';
import 'package:mamang_app_flutter/pages/home.dart';
import 'package:mamang_app_flutter/pages/messages/inbox.dart';
import 'package:mamang_app_flutter/pages/messages/notifications.dart';
import 'package:mamang_app_flutter/pages/routes_business.dart';
import 'package:mamang_app_flutter/pages/routes_profile.dart';
import 'package:mamang_app_flutter/pages/routes_promo.dart';
import 'package:mamang_app_flutter/pages/routes_sample_ui.dart';
import 'package:mamang_app_flutter/pages/routes_settings.dart';
import 'package:mamang_app_flutter/pages/routes_social_media.dart';
import 'package:mamang_app_flutter/pages/saved/saved_main.dart';
import 'package:mamang_app_flutter/pages/search/search_list.dart';
import 'package:mamang_app_flutter/pages/search/search_map.dart';
import 'package:mamang_app_flutter/pages/search/search_result.dart';
import 'package:mamang_app_flutter/pages/social_media/socmed_main.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/ui/layouts/home_layout.dart';

const int pageTransitionDuration = 200;

final List<GetPage> appRoutes = [

  /// HOME
  GetPage(
    name: '/',
    page: () => const HomeLayout(content: HomeMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/notifications',
    page: () => const GeneralLayout(content: Notifications()),
  ),
  GetPage(
    name: '/inbox',
    page: () => const GeneralLayout(content: Inbox()),
  ),

  GetPage(
    name: '/search-list',
    page: () => const GeneralLayout(content: SearchList()),
  ),
  GetPage(
    name: '/search-map',
    page: () => const GeneralLayout(content: SearchMap()),
  ),
  GetPage(
    name: '/search-result',
    page: () => const GeneralLayout(content: SearchResult()),
  ),

  GetPage(
    name: '/explore',
    page: () => const HomeLayout(content: ExploreMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),

  GetPage(
    name: '/updates',
    page: () => const HomeLayout(content: SocmedMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),

  GetPage(
    name: '/saved',
    page: () => const HomeLayout(content: SavedMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),


  GetPage(
    name: '/profile',
    page: () => const HomeLayout(content: ProfileMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  
  ...routesPromo,
  ...routesSocialMedia,
  ...routesProfile,
  ...routesBusiness,
  ...routesSettings,
  ...routesSampleUi,
];