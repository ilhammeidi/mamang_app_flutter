import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list.dart';
import 'package:mamang_app_flutter/ui/widgets/home/categories_grid.dart';
import 'package:mamang_app_flutter/ui/widgets/home/header.dart';
import 'package:mamang_app_flutter/ui/widgets/home/premium_slider.dart';
import 'package:mamang_app_flutter/ui/widgets/home/search.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list_double.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final ScrollController _scrollref = ScrollController();

  bool _isFixed = false;

  @override
  void dispose() {
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 200) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: HomeHeader(isFixed: _isFixed),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: CustomScrollView(
          controller: _scrollref,
          slivers: <Widget>[
            const SliverToBoxAdapter(child: SearchHome()),
            const SliverToBoxAdapter(child: VSpace()),
            const CategoriesGrid(),
            const SliverToBoxAdapter(child: VSpaceBig()),
            const SliverToBoxAdapter(child: PremiumSlider()),
            const SliverToBoxAdapter(child: VSpaceBig()),
            const SliverToBoxAdapter(child: PromoListDouble()),
            const SliverToBoxAdapter(child: VSpaceBig()),
            const SliverToBoxAdapter(child: EventList()),
            SliverToBoxAdapter(child: Container(
              height: 700,
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