import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/auth/login.dart';
import 'package:mamang_app_flutter/pages/auth/otp_pin.dart';
import 'package:mamang_app_flutter/pages/auth/register.dart';
import 'package:mamang_app_flutter/pages/auth/reset_password.dart';
import 'package:mamang_app_flutter/pages/auth/welcome.dart';
import 'package:mamang_app_flutter/pages/business/business_main.dart';
import 'package:mamang_app_flutter/pages/business/create_new.dart';
import 'package:mamang_app_flutter/pages/business/detail.dart';
import 'package:mamang_app_flutter/pages/business/form.dart';
import 'package:mamang_app_flutter/pages/business/payment.dart';
import 'package:mamang_app_flutter/pages/event/detail.dart';
import 'package:mamang_app_flutter/pages/event/event_main.dart';
import 'package:mamang_app_flutter/pages/explore/explore_main.dart';
import 'package:mamang_app_flutter/pages/home.dart';
import 'package:mamang_app_flutter/pages/profile/contact.dart';
import 'package:mamang_app_flutter/pages/profile/faq_list.dart';
import 'package:mamang_app_flutter/pages/profile/edit_password.dart';
import 'package:mamang_app_flutter/pages/profile/edit_profile.dart';
import 'package:mamang_app_flutter/pages/profile/profile_main.dart';
import 'package:mamang_app_flutter/pages/profile/terms_condition.dart';
import 'package:mamang_app_flutter/pages/promo/detail.dart';
import 'package:mamang_app_flutter/pages/promo/promo_main.dart';
import 'package:mamang_app_flutter/pages/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_form_builder.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';
import 'package:mamang_app_flutter/pages/sample_shadow.dart';
import 'package:mamang_app_flutter/pages/sample_shimmer.dart';
import 'package:mamang_app_flutter/pages/saved/puzzle_detail.dart';
import 'package:mamang_app_flutter/pages/saved/saved_detail.dart';
import 'package:mamang_app_flutter/pages/saved/saved_main.dart';
import 'package:mamang_app_flutter/pages/saved/saved_voucher.dart';
import 'package:mamang_app_flutter/pages/search/search_list.dart';
import 'package:mamang_app_flutter/pages/search/search_map.dart';
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

  /// USER AUTH
  GetPage(
    name: '/welcome',
    page: () => const GeneralLayout(content: Welcome()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/login',
    page: () => const GeneralLayout(content: Login()),
  ),
  GetPage(
    name: '/register',
    page: () => const GeneralLayout(content: Register()),
  ),
  
  /// SEARCH
  GetPage(
    name: '/search-list',
    page: () => const GeneralLayout(content: SearchList()),
  ),
  GetPage(
    name: '/search-map',
    page: () => const GeneralLayout(content: SearchMap()),
  ),

  /// SAVED
  GetPage(
    name: '/saved',
    page: () => const HomeLayout(content: SavedMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/saved/:id',
    page: () => const GeneralLayout(content: SavedDetail()),
  ),
  GetPage(
    name: '/puzzle/:id',
    page: () => GeneralLayout(content: PuzzleDetail()),
  ),
  GetPage(
    name: '/voucher',
    page: () => const GeneralLayout(content: SavedVoucher()),
  ),

  /// EXPLORE PROMOS AND EVENTS
  GetPage(
    name: '/explore',
    page: () => const HomeLayout(content: ExploreMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/promos',
    page: () => const GeneralLayout(content: PromoMain()),
  ),
  GetPage(
    name: '/promos/:id',
    page: () => const GeneralLayout(content: PromoDetail()),
  ),
  /// EVENTS
  GetPage(
    name: '/events',
    page: () => const GeneralLayout(content: EventMain()),
  ),
  GetPage(
    name: '/events/:id',
    page: () => const GeneralLayout(content: EventDetail()),
  ),
  
  /// BUSINESS
  GetPage(
    name: '/business',
    page: () => const HomeLayout(content: BusinessMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/business/:id',
    page: () => const GeneralLayout(content: BusinessDetail()),
  ),
  GetPage(
    name: '/business-new',
    page: () => const GeneralLayout(content: BusinessCreateNew()),
  ),
  GetPage(
    name: '/business-new/payment',
    page: () => const GeneralLayout(content: BusinessPayment()),
  ),
  GetPage(
    name: '/business-new/form',
    page: () => const GeneralLayout(content: BusinessForm()),
  ),

  /// PROFILE, SETTINGS, AND REST PAGES
  GetPage(
    name: '/profile',
    page: () => const HomeLayout(content: ProfileMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/change-profile',
    page: () => const GeneralLayout(content: EditProfile()),
  ),
  GetPage(
    name: '/change-password',
    page: () => const GeneralLayout(content: EditPassword()),
  ),
  GetPage(
    name: '/reset-password',
    page: () => const GeneralLayout(content: ResetPassword()),
  ),
  GetPage(
    name: '/otp',
    page: () => const GeneralLayout(content: OtpPin()),
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
  GetPage(
    name: '/forms',
    page: () => const GeneralLayout(content: SampleForm()),
  ),
  GetPage(
    name: '/form-builder',
    page: () => GeneralLayout(content: SampleFormBuilder()),
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
  GetPage(
    name: '/shimmer',
    page: () => const SampleShimmer()
  ),
];