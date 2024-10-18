import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/chat.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/chat/chat_list.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: const Text('Inbox'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(width: 8)
        ],
        centerTitle: false,
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
            Tab(child: Text('Message'.toUpperCase(), style: ThemeText.subtitle)),
            Tab(child: Text('Group'.toUpperCase(), style: ThemeText.subtitle)),
          ]
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: spacingUnit(2)),
        child: TabBarView(
          controller: _tabController,
          children: [
            ChatList(data: chatListPersonal),
            ChatList(data: chatListGroup),
          ],
        ),
      )
    );
  }
}