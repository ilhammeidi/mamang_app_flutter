import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/pages/app_routes.dart';
import 'package:mamang_app_flutter/ui/themes/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final RxBool _isDarkTheme = false.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getThemeStatus() async {
    var isDark = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('isDarkTheme') ?? false;
    }).obs;

    _isDarkTheme.value = await isDark.value;
    Get.changeThemeMode(_isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }

  MainApp({super.key}) {
    _getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Mamang App",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: lightColorScheme,
          darkTheme: darkColorScheme,
          initialRoute: '/',
          getPages: appRoutes,
          // routeInformationParser: AppRoutes.routes.routeInformationParser,
          // routeInformationProvider: AppRoutes.routes.routeInformationProvider,
          // routerDelegate: AppRoutes.routes.routerDelegate,
        );
      }
    );
  }
}
