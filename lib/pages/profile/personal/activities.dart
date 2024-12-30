import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/activity.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/activity_card.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const double itemHeight = 55;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: colorScheme.surface,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        /// TITLE AND SEARCH
        title: const Text('Your Activities'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 24,
                child: Container(
                  width: 3,
                  height: itemHeight * activityList.length,
                  decoration: BoxDecoration(
                    color: colorScheme.outline,
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              ListView.builder(
                itemCount: activityList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: ((context, index) {
                  Activity item = activityList[index];
                  return ActivityCard(
                    title: item.title,
                    time: item.date,
                    icon: item.icon,
                    color: item.color
                  );
                })
              )
            ],
          ),
          const VSpaceShort(),
        ]),
      ),
    );
  }
}