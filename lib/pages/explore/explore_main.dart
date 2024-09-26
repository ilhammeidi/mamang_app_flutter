import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/banner.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/mini_map.dart';
import 'package:mamang_app_flutter/ui/widgets/explore/search.dart';

class ExploreMain extends StatelessWidget {
  const ExploreMain({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: BannerExplore()),
        const SliverToBoxAdapter(child: MiniMap()),
        SliverStickyHeader.builder(
          builder: (context, state) {
            return SearchExplore(gradientOpacity: state.isPinned ? 0 : 1);
          },
          sliver: SliverList(delegate: SliverChildListDelegate([
            Container(
              height: 1500,
              color: Colors.white
            )
          ]))
        ),
      ],
    );
  }
}