import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class CoverHeader extends StatelessWidget {
  const CoverHeader({super.key, required this.animationRef});

  final AnimationController animationRef;

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
              color: colorScheme.surface,
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
              child: Row(children: [
                const Spacer(),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    onPressed: () {},
                    style: ThemeButton.outlinedPrimary(context),
                    icon: Icon(Icons.more_horiz, size: 16, color: ThemePalette.primaryMain),
                  ),
                ),
                SizedBox(
                  width: spacingUnit(1)
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    onPressed: () {},
                    style: ThemeButton.outlinedPrimary(context),
                    icon: Icon(Icons.message_outlined, size: 16, color: ThemePalette.primaryMain),
                  ),
                ),
                SizedBox(
                  width: spacingUnit(1)
                ),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.tonalPrimary(context),
                  child: const Row(children: [
                    Icon(Icons.person_add_outlined),
                    SizedBox(width: 4),
                    Text('Follow')
                  ])
                )
              ])
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0,-1),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animationRef, curve: Curves.decelerate)),
              child: Container(
                width: double.infinity,
                color: colorScheme.surface,
                child: const Center(
                  child: Text(
                    "PINNED HEADER",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoverTab extends StatelessWidget {
  const CoverTab({super.key, required this.tabController});

  final TabController? tabController; 

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 40,
        maxHeight: 40,
        child: Container(
          color: Colors.green[200],
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  'TITLE1',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'TITLE2',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'TITLE3',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
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