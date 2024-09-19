import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mamang_app_flutter/pages/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';
import 'package:mamang_app_flutter/ui/layouts/home_layout.dart';

  // final appRoutes = GoRouter(
  //   navigatorKey: Get.key,
  //   initialLocation: '/',
  //   routes: <RouteBase>[
  //     GoRoute(
  //       path: '/',
  //       builder: (context, state) => const SampleForm()
  //     ),
  //     GoRoute(
  //       path: '/dark-mode',
  //       builder: (context, state) => SampleDarkLight()
  //     )
  //   ]
  // );

class AppRoutes {
  AppRoutes._();

  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSetting = GlobalKey<NavigatorState>(debugLabel: 'shellSetting');
  
  static final routes = GoRouter(
    navigatorKey: _rootNavigationKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeLayout(content: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                name: 'home',
                builder: (BuildContext context, GoRouterState state) => const SampleForm()
              ),
            ]
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellButton'),
            routes: <RouteBase>[
              GoRoute(
                path: '/buttons',
                name: 'buttons',
                builder: (BuildContext context, GoRouterState state) => const SampleButton()
              ),
            ]
          ),
        ]
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        path: '/dark-mode',
        name: 'setting',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SampleDarkLight(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          }
        )
      ),
    ]
  );
}

