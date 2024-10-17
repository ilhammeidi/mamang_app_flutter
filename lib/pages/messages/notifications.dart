import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/_http/_stub/_file_decoder_stub.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/notification.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/notifications/filters.dart';
import 'package:mamang_app_flutter/ui/widgets/notifications/notif_item.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List _filteredItems = [];
  String _selectedFilter = 'all';

  void handleFilter(type) {
    var result = notifList
      .where((item) => item.type == type)
      .toList();
    
    setState(() {
      _selectedFilter = type;
      if(type != 'all') {
        _filteredItems = result;
      } else {
         _filteredItems = notifList;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      _filteredItems = notifList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Row(children: [
          const Text('Notifications'),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: ThemePalette.tertiaryMain,
              shape: BoxShape.circle,
            ),
            child: Text(notifList.length.toString(), style: const TextStyle(color: Colors.white, fontSize: 14)),
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Row(children: [
              Icon(Icons.clear_all_outlined, size: 18),
              SizedBox(width: 4,),
              Text('Clear All')
            ]),
          ),
          const SizedBox(width: 8)
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          /// FILTER
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
            child: NotificationFilters(
              selected: _selectedFilter,
              onChangeFilter: handleFilter,
            ),
          ),

          /// NOTIFICATION ITEMS
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: _filteredItems.length,
              itemBuilder: ((BuildContext context, int index){
                NotificationModel item = _filteredItems[index];
                return NotifItem(
                  type: item.type,
                  title: item.title,
                  subtitle: item.subtitle,
                  date: item.date,
                  image: item.image,
                  isRead: item.isRead,
                  isLast: _filteredItems.length == index + 1,
                );
              })
            ),
          ),
        ],
      )
    );
  }
}