import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/pages/app_routes.dart';
import 'package:mamang_app_flutter/ui/themes/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final RxString _themeMode = 'auto'.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getThemeStatus() async {
    var mode = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('appTheme') ?? 'auto';
    }).obs;

    _themeMode.value = await mode.value;

    switch(_themeMode.value) {
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
      break;
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
      break;
      default:
      break;
    }
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
          title: branding.name,
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
