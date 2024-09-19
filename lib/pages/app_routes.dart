import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_forms.dart';
import 'package:mamang_app_flutter/ui/layouts/home_layout.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: '/',
    page: () => const HomeLayout(content: SampleForm()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/buttons',
    page: () => const HomeLayout(content: SampleButton()),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/dark-mode',
    page: () => SampleDarkLight(),
  ),
];