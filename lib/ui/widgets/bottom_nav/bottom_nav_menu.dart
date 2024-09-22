import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = Get.currentRoute;
    
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      shadowColor: Colors.black,
      notchMargin: 10,
      height: 80,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: 60,
              width: constraints.maxWidth / 2 - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItem(
                    title: 'Home',
                    icon: Icons.store_outlined, 
                    iconActive: Icons.store,
                    isActive: currentRoute == '/',
                    onTap: () {
                      Get.toNamed('/');
                    }
                  ),
                  MenuItem(
                    title: 'Saved',
                    icon: Icons.bookmark_outline,
                    iconActive: Icons.bookmark,
                    isActive: currentRoute == '/saved',
                    onTap: () {
                      Get.toNamed('/saved');
                    }
                  )
                ]
              )
            ),
            SizedBox(
              height: 60,
              width: constraints.maxWidth / 2 - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItem(
                    title: 'Business',
                    icon: Icons.all_inbox_outlined,
                    iconActive: Icons.all_inbox,
                    isActive: currentRoute == '/business',
                    onTap: () => Get.toNamed('/business')
                  ),
                  MenuItem(
                    title: 'Profile',
                    icon: Icons.person_outline,
                    iconActive: Icons.person,
                    isActive: currentRoute == '/profile',
                    onTap: () => Get.toNamed('/profile')
                  ),
                ]
              )
            )
          ]);
        }
      )
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.iconActive,
    required this.onTap,
  });

  final IconData icon;
  final IconData iconActive;
  final String title;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation (
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => {
          onTap()
        },
        child: SizedBox(
          width: 60,
          height: 60,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            isActive ?
              Icon(iconActive, color: ThemePalette.primaryMain)
              : Icon(icon),
            Text(title, style: TextStyle(color: isActive ? ThemePalette.primaryMain : Theme.of(context).colorScheme.onSurface))
          ]),
        ),
      ),
    );
  }
}