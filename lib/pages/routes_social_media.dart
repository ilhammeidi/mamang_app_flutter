import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/social_media/create_post.dart';
import 'package:mamang_app_flutter/pages/social_media/create_short_post.dart';
import 'package:mamang_app_flutter/pages/social_media/groups.dart';
import 'package:mamang_app_flutter/pages/social_media/post_detail.dart';

final List<GetPage> routesSocialMedia = [
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
];
