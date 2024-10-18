import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final promoResults = List<Promotion>.generate(10, (int index) => promoList[index]);
  final eventResults = List<Event>.generate(10, (int index) => eventList[index]);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const SearchInput(),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            child: IconButton(
              onPressed: () {
                Get.offAndToNamed('/');
              },
              icon: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store_outlined, size: 24),
                  Text('Home', style: ThemeText.caption,)
                ],
              )
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: ThemePalette.primaryMain,
          labelColor: ThemePalette.primaryMain,
          tabAlignment: TabAlignment.start,
          unselectedLabelColor: Colors.grey.shade500,
          isScrollable: true,
          dividerHeight: 0,
          padding: EdgeInsets.only(left: spacingUnit(2)),
          labelPadding: EdgeInsets.only(right: spacingUnit(5)),
          tabs: [
            Tab(child: Text('Promos'.toUpperCase(), style: ThemeText.subtitle)),
            Tab(child: Text('Events'.toUpperCase(), style: ThemeText.subtitle)),
          ]
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(top: spacingUnit(2)),
        child: TabBarView(
          controller: _tabController,
          children: [
            PromoList(items: promoResults),
            EventList(items: eventResults)
          ],
        ),
      )
    );
  }
}