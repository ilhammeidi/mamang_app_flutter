import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/business/charts/liked_area_chart.dart';
import 'package:mamang_app_flutter/ui/widgets/business/charts/saved_line_chart.dart';
import 'package:mamang_app_flutter/ui/widgets/business/charts/share_pie_chart.dart';
import 'package:mamang_app_flutter/ui/widgets/business/charts/view_bar_chart.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter_date.dart';

class BusinessAnalytics extends StatelessWidget {
  const BusinessAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    
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
        title: const Text('Business Analytics'),
      ),
      body: Column(children: [
        /// DATE FILTER
        const FilterDate(),
        SizedBox(height: spacingUnit(2)),

        /// CHART ANALYTICS
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.all(spacingUnit(1)),
            children: [
              /// VIEWS CHART
              const AppInputBox(content: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.remove_red_eye, size: iconSize, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Views', style: ThemeText.subtitle2,),
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('The total number of times your content has been displayed to users on a platform', style: ThemeText.caption, textAlign: TextAlign.center),
                ),
                ViewBarChart()
              ])),
              const VSpace(),

              /// SAVED CHART
              AppInputBox(content: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.bookmark, size: iconSize, color: ThemePalette.primaryMain),
                  const SizedBox(width: 4),
                  const Text('Saved', style: ThemeText.subtitle2,),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Statistics of your promo that has been saved by users', style: ThemeText.caption, textAlign: TextAlign.center),
                ),
                const SavedLineChart()
              ])),
              const VSpace(),

              /// LIKED CHART
              AppInputBox(content: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.favorite, size: iconSize, color: ThemePalette.tertiaryMain),
                  const SizedBox(width: 4),
                  const Text('Liked', style: ThemeText.subtitle2,),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Statistics of your promo that has been liked by users', style: ThemeText.caption, textAlign: TextAlign.center),
                ),
                const LikedAreaChart()
              ])),
              const VSpace(),

              /// SHARE CHART
              const AppInputBox(content: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.share, size: iconSize, color: Colors.green),
                  SizedBox(width: 4),
                  Text('Share', style: ThemeText.subtitle2,),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Percentage of your promo that has been shared by users to social medias', style: ThemeText.caption, textAlign: TextAlign.center),
                ),
                SharePieChart()
              ])),
              const VSpaceBig()
            ]
          )
        )
      ]),
    );
  }
}