import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/bottom_nav/bottom_nav_menu.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: SafeArea(child: Scaffold(
          body: content,
          bottomNavigationBar: const BottomNavMenu(),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/explore');
            },
            backgroundColor: ThemePalette.primaryMain,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.search, color: Colors.white)
          ),
        )),
      ),
    );
  }
}