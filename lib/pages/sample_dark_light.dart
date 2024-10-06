import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SampleDarkLight extends StatelessWidget {
  SampleDarkLight({super.key}) {
    _getThemeStatus();
  }

  final RxBool _isDarkTheme = false.obs;

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getThemeStatus() async {
    // var isDark = _prefs.then((SharedPreferences prefs) {
    //   return prefs.getBool('isDarkTheme') ?? false;
    // }).obs;

    // _isDarkTheme.value = await isDark.value;
  }

  _saveThemeStatus() async {
    // SharedPreferences pref = await _prefs;
    // pref.setBool('isDarkTheme', _isDarkTheme.value);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Get.back(), child: const Text('go back')),
            Obx(() => Text('Click on switch to change to ${_isDarkTheme.value ? 'Dark' : 'Light'} theme')),
            ObxValue((data) => Switch(
              value: _isDarkTheme.value,
              onChanged: (val) {
                _isDarkTheme.value = val;
                Get.changeThemeMode(_isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
                _saveThemeStatus();
              },
            ), false.obs)
          ]
        )
      )
    );
  }
}