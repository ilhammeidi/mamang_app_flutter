import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/event/detail.dart';
import 'package:mamang_app_flutter/pages/event/event_main.dart';
import 'package:mamang_app_flutter/pages/promo/detail.dart';
import 'package:mamang_app_flutter/pages/promo/promo_main.dart';
import 'package:mamang_app_flutter/pages/review/ratings_reviews.dart';
import 'package:mamang_app_flutter/pages/saved/puzzle_detail.dart';
import 'package:mamang_app_flutter/pages/saved/saved_detail.dart';
import 'package:mamang_app_flutter/pages/saved/saved_voucher.dart';

final List<GetPage> routesPromo = [
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
  GetPage(
    name: '/ratings-reviews',
    page: () => const GeneralLayout(content: RatingsReviews()),
  ),
];