import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class ProfileBannerHeader extends SliverPersistentHeaderDelegate {
  const ProfileBannerHeader({
    required this.maxExtent,
    required this.minExtent
  });

  @override
  final double maxExtent;
  
  @override
  final double minExtent;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    final showItem = shrinkOffset < 150;

    return Stack(
      fit: StackFit.expand,
      children: [
        /// BACKGROUND
        Image.network(
          'https://picsum.photos/800/600/?random=hotel_jkt',
          fit: BoxFit.cover
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.all(spacingUnit(2)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AnimatedOpacity(
                opacity: showItem ? 1 : 0.2,
                duration: const Duration(milliseconds: 100),
                child: AnimatedScale(
                  scale: showItem ? 1 : 0.5,
                  duration: const Duration(milliseconds: 100),
                  child: Chip(
                    label: const Text('Sport', style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).primaryColor,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  )
                ),
              ),
              const SizedBox(height: 16,),
              AnimatedOpacity(
                opacity: showItem ? 1 : 0,
                duration: const Duration(milliseconds: 900),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white))
                ),
              ),
              const SizedBox(height: 16,),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 900),
                child: showItem ? Text(
                  '22 May 2024',
                  key: const ValueKey<int>(1), 
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)
                ) : const SizedBox()
              ),
            ]),
          ),
        ),
        Positioned(
          top: 0,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            crossFadeState: showItem ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                const Text('Title First', style: TextStyle(color: Colors.white),),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, size: 24, color: Colors.white)
                )
              ],),
            ),
            secondChild: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text('Last FIxed Child'),
            ),
          )
        ),
      ]
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();
}