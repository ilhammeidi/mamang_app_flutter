import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/fadded_bottom_header.dart';
import 'package:mamang_app_flutter/ui/widgets/home/download_mobile_app.dart';
import 'package:mamang_app_flutter/ui/widgets/home/latest_event.dart';
import 'package:mamang_app_flutter/ui/widgets/home/categories_grid.dart';
import 'package:mamang_app_flutter/ui/widgets/home/header.dart';
import 'package:mamang_app_flutter/ui/widgets/home/premium_slider.dart';
import 'package:mamang_app_flutter/ui/widgets/home/search.dart';
import 'package:mamang_app_flutter/ui/widgets/news/news_list.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list_double.dart';
import 'package:mamang_app_flutter/ui/widgets/home/user_grid.dart';

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
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollref,
            slivers: <Widget>[
              // Search and Banner
              const SliverToBoxAdapter(child: SearchHome()),
              const SliverToBoxAdapter(child: VSpace()),
          
              // Download Mobile Apps
              SliverToBoxAdapter(child: kIsWeb ? const DownloadMobileApp() : Container()),
          
              // Categories
              const CategoriesGrid(),
              const SliverToBoxAdapter(child: VSpace()),
          
              // Slider Carousel
              const SliverToBoxAdapter(child: PremiumSlider()),
              const SliverToBoxAdapter(child: VSpaceBig()),
          
              // Promotions
              const SliverToBoxAdapter(child: PromoListDouble()),
              const SliverToBoxAdapter(child: VSpaceBig()),
          
              // Events
              const SliverToBoxAdapter(child: LatestEvent()),
              
              // News
              const SliverToBoxAdapter(child: VSpace()),
              const SliverToBoxAdapter(child: NewsList()),
              const SliverToBoxAdapter(child: VSpaceBig()),
              // Active Users
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: UserGrid(),
              ),
              const SliverToBoxAdapter(child: SizedBox(
                height: 120,
              )),
            ],
          ),
          Positioned(
            top: 100,
            child: Opacity(
              opacity: _isFixed ? 1 : 0,
              child: const FadedBottomHeader()
            ),
          ),
        ],
      ),
    );
  }
}