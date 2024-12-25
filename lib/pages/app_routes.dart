import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/auth/login.dart';
import 'package:mamang_app_flutter/pages/auth/otp_pin.dart';
import 'package:mamang_app_flutter/pages/auth/register.dart';
import 'package:mamang_app_flutter/pages/auth/reset_password.dart';
import 'package:mamang_app_flutter/pages/auth/welcome.dart';
import 'package:mamang_app_flutter/pages/business/analytics.dart';
import 'package:mamang_app_flutter/pages/business/business_main.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_cc.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_wallet.dart';
import 'package:mamang_app_flutter/pages/payment/payment_method.dart';
import 'package:mamang_app_flutter/pages/pricing/pricing_business.dart';
import 'package:mamang_app_flutter/pages/business/detail.dart';
import 'package:mamang_app_flutter/pages/business/form.dart';
import 'package:mamang_app_flutter/pages/business/create_new.dart';
import 'package:mamang_app_flutter/pages/business/report.dart';
import 'package:mamang_app_flutter/pages/event/detail.dart';
import 'package:mamang_app_flutter/pages/event/event_main.dart';
import 'package:mamang_app_flutter/pages/explore/explore_main.dart';
import 'package:mamang_app_flutter/pages/home.dart';
import 'package:mamang_app_flutter/pages/messages/inbox.dart';
import 'package:mamang_app_flutter/pages/messages/notifications.dart';
import 'package:mamang_app_flutter/pages/profile/personal/activities.dart';
import 'package:mamang_app_flutter/pages/profile/contact.dart';
import 'package:mamang_app_flutter/pages/profile/faq_list.dart';
import 'package:mamang_app_flutter/pages/profile/edit_password.dart';
import 'package:mamang_app_flutter/pages/profile/edit_profile.dart';
import 'package:mamang_app_flutter/pages/profile/personal/detail_coin.dart';
import 'package:mamang_app_flutter/pages/profile/personal/detail_point.dart';
import 'package:mamang_app_flutter/pages/profile/personal/leaderboards.dart';
import 'package:mamang_app_flutter/pages/profile/personal/rewards.dart';
import 'package:mamang_app_flutter/pages/profile/profile_group.dart';
import 'package:mamang_app_flutter/pages/profile/profile_user.dart';
import 'package:mamang_app_flutter/pages/profile/profile_main.dart';
import 'package:mamang_app_flutter/pages/profile/terms_condition.dart';
import 'package:mamang_app_flutter/pages/promo/detail.dart';
import 'package:mamang_app_flutter/pages/promo/promo_main.dart';
import 'package:mamang_app_flutter/pages/review/ratings_reviews.dart';
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
import 'package:mamang_app_flutter/pages/search/search_result.dart';
import 'package:mamang_app_flutter/pages/social_media/create_post.dart';
import 'package:mamang_app_flutter/pages/social_media/create_short_post.dart';
import 'package:mamang_app_flutter/pages/social_media/groups.dart';
import 'package:mamang_app_flutter/pages/social_media/post_detail.dart';
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
  GetPage(
    name: '/search-result',
    page: () => const GeneralLayout(content: SearchResult()),
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
  /// RATINGS AND REVIEWS
  GetPage(
    name: '/ratings-reviews',
    page: () => const GeneralLayout(content: RatingsReviews()),
  ),

  /// SOCIAL MEDIA
  GetPage(
    name: '/updates',
    page: () => const HomeLayout(content: SocmedMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: '/updates/:id',
    page: () => const GeneralLayout(content: PostDetail()),
  ),
  GetPage(
    name: '/create-post',
    page: () => const GeneralLayout(content: CreatePost()),
  ),
  GetPage(
    name: '/create-short-post',
    page: () => const GeneralLayout(content: CreateShortPost()),
  ),
  GetPage(
    name: '/groups',
    page: () => const GeneralLayout(content: Groups()),
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
  
  /// BUSINESS
  GetPage(
    name: '/business',
    page: () => const GeneralLayout(content: BusinessMain()),
  ),
  GetPage(
    name: '/business/:id',
    page: () => const GeneralLayout(content: BusinessDetail()),
  ),
  GetPage(
    name: '/business-report',
    page: () => GeneralLayout(content: BusinessReport()),
  ),
  GetPage(
    name: '/business-analytics',
    page: () => const GeneralLayout(content: BusinessAnalytics()),
  ),
  GetPage(
    name: '/business-new',
    page: () => const GeneralLayout(content: PricingBusiness()),
  ),
  GetPage(
    name: '/business-new/payment',
    page: () => const GeneralLayout(content: CreateNewBusiness()),
  ),
  GetPage(
    name: '/business-new/form',
    page: () => const GeneralLayout(content: BusinessForm()),
  ),
  GetPage(
    name: '/payment',
    page: () => const GeneralLayout(content: PaymentMethod()),
  ),
  GetPage(
    name: '/payment/credit-card',
    page: () => const GeneralLayout(content: PaymentDetailCC()),
  ),
  GetPage(
    name: '/payment/ewallet',
    page: () => const GeneralLayout(content: PaymentDetailWallet()),
  ),

  /// USER PROFILE
  GetPage(
    name: '/profile',
    page: () => const HomeLayout(content: ProfileMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
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

  /// SETTINGS
  GetPage(
    name: '/edit-profile',
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
    page: () => const GeneralLayout(content: SampleFormBuilder()),
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