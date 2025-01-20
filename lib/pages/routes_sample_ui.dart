import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_colrow.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_button.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_dark_light.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_form_builder.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_forms.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_shadow.dart';
import 'package:mamang_app_flutter/pages/sample_ui/sample_shimmer.dart';

final List<GetPage> routesSampleUi = [
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
  GetPage(
    name: '/colrow',
    page: () => const SampleColrow()
  ),
];