import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_options.dart';

class CoverHeader extends StatelessWidget {
  const CoverHeader({
    super.key,
    required this.animationRef,
    required this.coverOptions,
    required this.avatar,
    required this.name,
    this.isJoin = false,
  });

  final AnimationController animationRef;
  final Widget coverOptions;
  final String avatar;
  final String name;
  final bool isJoin;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: colorScheme.surfaceContainerLowest,
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
              child: coverOptions
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0,-1),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animationRef, curve: Curves.decelerate)),
              child: Container(
                width: double.infinity,
                height: 100,
                color: colorScheme.surfaceContainerLowest,
                child: OptionsFixed(
                  avatar: avatar,
                  name: name,
                  isJoin: isJoin,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoverTab extends StatelessWidget {
  const CoverTab({super.key, required this.tabController, required this.menuList});

  final TabController? tabController;
  final List<String> menuList;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 40,
        maxHeight: 40,
        child: Container(
          color: colorScheme.surfaceContainerLowest,
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.all(0),
            tabs: menuList.map((item) => Tab(
              child: Text(item, style: ThemeText.paragraph)
            )).toList(),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}