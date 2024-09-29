import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list_slider.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list_single.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/select_category_grid.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_tags.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Promotion> promoData = [
      promoList[4],
      promoList[19],
      promoList[31],
      promoList[41],
      promoList[55],
      promoList[12],
      promoList[44],
      promoList[67],
      promoList[69],
      promoList[80],
    ];

    final List<Event> eventsData = [
      eventList[7],
      eventList[8],
      eventList[9],
      eventList[10],
      eventList[11],
      eventList[12],
    ];

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: SearchInput()
      ),
      body: ListView(children: [
        const VSpace(),
        const TagHistory(),
        const VSpace(),
        const TagTrending(),
        const VSpace(),
        const SelectCategoryGrid(),
        const VSpace(),
        PromoListSingle(items: promoData, title: "Recommended Promo"),
        const VSpace(),
        EventListSlider(items: eventsData, title: "Recommended Event")
      ]),
    );
  }
}