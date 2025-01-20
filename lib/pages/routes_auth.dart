import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/pages/auth/login.dart';
import 'package:mamang_app_flutter/pages/auth/otp_pin.dart';
import 'package:mamang_app_flutter/pages/auth/register.dart';
import 'package:mamang_app_flutter/pages/auth/reset_password.dart';
import 'package:mamang_app_flutter/pages/auth/welcome.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';

const int pageTransitionDuration = 200;

final List<GetPage> routesAuth = [
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
  GetPage(
    name: '/reset-password',
    page: () => const GeneralLayout(content: ResetPassword()),
  ),
  GetPage(
    name: '/otp',
    page: () => const GeneralLayout(content: OtpPin()),
  ),
];