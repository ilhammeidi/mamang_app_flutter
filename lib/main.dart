import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:mamang_app_flutter/pages/app_routes.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
    return SafeArea(
      child: GetMaterialApp.router(
        title: "Mamang App",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: ThemePalette.primaryMain,
          primaryColorDark: ThemePalette.primaryDark,
          primaryColorLight: ThemePalette.primaryLight,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
          ),
          colorScheme: ColorScheme.light(
            primary: ThemePalette.primaryMain,
            onPrimary: Colors.white,
            primaryContainer: ThemePalette.primaryLight,
            onPrimaryContainer: ThemePalette.primaryDark,
            secondary: ThemePalette.secondaryMain,
            onSecondary: Colors.white,
            secondaryContainer: ThemePalette.secondaryLight,
            onSecondaryContainer: ThemePalette.secondaryDark,
            tertiary: ThemePalette.tertiaryMain,
            onTertiary: Colors.white,
            tertiaryContainer: ThemePalette.tertiaryLight,
            onTertiaryContainer: ThemePalette.tertiaryDark,
            surface: ThemePalette.paperLight,
            onSurface: Colors.black,
            surfaceContainerLowest: ThemePalette.defaultLight,
            onSurfaceVariant: Colors.grey[600],
            error: Colors.red,
            onError: Colors.white,
            brightness: Brightness.light,
            outline: Colors.grey[300],
          ),
        ),
        darkTheme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: ThemePalette.primaryMain,
          primaryColorDark: ThemePalette.primaryDark,
          primaryColorLight: ThemePalette.primaryLight,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: ThemePalette.primaryMain,
            onPrimary: Colors.white,
            primaryContainer: ThemePalette.primaryDark,
            onPrimaryContainer: ThemePalette.primaryLight,
            secondary: ThemePalette.secondaryMain,
            onSecondary: Colors.white,
            secondaryContainer: ThemePalette.secondaryDark,
            onSecondaryContainer: ThemePalette.secondaryLight,
            tertiary: ThemePalette.tertiaryMain,
            onTertiary: Colors.white,
            tertiaryContainer: ThemePalette.tertiaryDark,
            onTertiaryContainer: ThemePalette.tertiaryLight,
            surface: ThemePalette.paperDark,
            onSurface: Colors.white,
            surfaceContainerLowest: ThemePalette.defaultDark,
            onSurfaceVariant: Colors.grey.shade300,
            error: Colors.red,
            onError: Colors.white,
            brightness: Brightness.dark,
            outline: Colors.grey[400]
          )
        ),
        routeInformationParser: AppRoutes.routes.routeInformationParser,
        routeInformationProvider: AppRoutes.routes.routeInformationProvider,
        routerDelegate: AppRoutes.routes.routerDelegate,
      ),
    );
  }
}
