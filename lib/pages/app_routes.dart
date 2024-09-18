import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';

final appRoutes = GoRouter(
  navigatorKey: Get.key,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SampleForm()
    ),
    GoRoute(
      path: '/dark-mode',
      builder: (context, state) => SampleDarkLight()
    )
  ]
);