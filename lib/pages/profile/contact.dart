import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/settings/contact_list.dart';
import 'package:mamang_app_flutter/ui/widgets/settings/message_form.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> with SingleTickerProviderStateMixin {
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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Help and Support'),
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
            Tab(child: Text('Contact'.toUpperCase(), style: ThemeText.subtitle)),
          ]
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        MessageForm(),
        ContactList()
      ])
    );
  }
}