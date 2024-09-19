import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text('Home Layout', style: ThemeText.title),
          SizedBox(
            height: 400,
            child: content
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed('/'),
            child: const Text('sample forms')
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed('/buttons'),
            child: const Text('sample buttons')
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed('/dark-mode'),
            child: const Text('sample derk light')
          ),
        ]),
      )
    );
  }
}