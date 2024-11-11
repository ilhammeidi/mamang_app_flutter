import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:math' as math;
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class ProfileGroup extends StatefulWidget {
  const ProfileGroup({super.key});

  @override
  State<ProfileGroup> createState() => _ProfileGroupState();
}

class _ProfileGroupState extends State<ProfileGroup> with TickerProviderStateMixin {
  final ScrollController _scrollref = ScrollController();
  late AnimationController _slideRef;
  
  TabController? _tabController;

  @override
  void initState() {
    _slideRef = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _slideRef.dispose();
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle iconBtn = IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );

    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset >= 300) {
          _slideRef.forward();
        } else {
          _slideRef.reverse();
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollref,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                backgroundColor: Colors.brown,
                centerTitle: false,
                automaticallyImplyLeading: false,
                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/profile_banner.jpg',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: spacingUnit(1),
                      left: spacingUnit(1),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: iconBtn,
                        icon: const Icon(Icons.arrow_back_ios_new, size: 22),
                      )
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          boxShadow: [BoxShadow(
                            color: colorScheme.surfaceContainerLowest,
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0, 2),
                          )],
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('John Doe', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 4),
                          Text('On Your contact', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: spacingUnit(2),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=2'),
                      )
                    ),
                  ]
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 90,
                  maxHeight: 90,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        color: colorScheme.surface,
                        child: Center(
                          child: Text(
                            'NOT PINNED',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0,-1),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(parent: _slideRef, curve: Curves.decelerate)),
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
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 40,
                  child: Container(
                    color: Colors.green[200],
                    child: TabBar(
                      controller: _tabController,
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
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE1"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE2"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE3"),
                        ),
                      ),
                    ],
                  ),
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