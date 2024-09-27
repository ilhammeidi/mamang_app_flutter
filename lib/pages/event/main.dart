import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input_btn.dart';

class EventMain extends StatefulWidget {
  const EventMain({super.key});

  @override
  State<EventMain> createState() => _EventMainState();
}

class _EventMainState extends State<EventMain> {
  bool _showSearch = false;

  void handleToggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leadingWidth: 40,
        leading: Padding(
          padding: EdgeInsets.only(left: spacingUnit(1)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)
          ),
        ),
        centerTitle: false,
        /// TITLE AND SEARCH
        title: _showSearch ?
          SearchInputBtn(
            location: '/search-basic',
            title: 'Search Event',
            onCancel: () {
              handleToggleSearch();
            },
          ) : const Text('All Events'),
        actions: [
          /// SEARCH BUTTON
          !_showSearch ?
            IconButton(
              onPressed: () {
                handleToggleSearch();
              },
              icon: const Icon(Icons.search, size: 40)
            ) : Container(),
          /// HOME BUTTON
          IconButton(
            onPressed: () {
              Get.toNamed('/');
            },
            icon: const Icon(Icons.home_outlined, size: 40)
          ),
        ],
      ),
      body: EventList(items: eventList)
    );
  }
}