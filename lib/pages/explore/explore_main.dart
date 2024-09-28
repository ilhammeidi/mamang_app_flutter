import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mamang_app_flutter/pages/explore/ads.dart';
import 'package:mamang_app_flutter/pages/explore/event.dart';
import 'package:mamang_app_flutter/pages/explore/promo.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/banner.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/header.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/mini_map.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/search.dart';

class ExploreMain extends StatelessWidget {
  const ExploreMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              /// BANNER ILLLUSTRATION
              BannerExplore(),
              /// HEADER
              Positioned(
                child: SizedBox(child: HeaderExplore())
              ),
            ],
          )),
          /// MINI MAP
          const SliverToBoxAdapter(child: MiniMap()),
          SliverStickyHeader.builder(
            builder: (context, state) {
              /// SEARCH
              return SearchExplore(gradientOpacity: state.isPinned ? 0 : 1);
            },
            sliver: SliverList(delegate: SliverChildListDelegate([
              const VSpace(),
              const RecommendedPromo(),
              const VSpace(),
              const RecommendedEvent(),
              const VSpace(),
              const AdsFood(),
              const VSpaceBig(),
              const FlashSalePromo(),
              const VSpace(),
              const TopEvent(),
              const VSpace(),
              const AdsHoliday(),
              const SizedBox(height: 120,)
            ]))
          ),
        ],
      )
    );
  }
}