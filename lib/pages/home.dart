import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/home/header.dart';
import 'package:mamang_app_flutter/ui/widgets/home/search.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomeHeader(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(child: SearchHome()),
            SliverToBoxAdapter(child: Container(
              height: 1000,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}