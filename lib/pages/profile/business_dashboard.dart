import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/business/address_panel.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_panel.dart';
import 'package:mamang_app_flutter/ui/widgets/business/infographic_list.dart';
import 'package:mamang_app_flutter/ui/widgets/news/news_list.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_list_slider.dart';

class BusinessDashboard extends StatelessWidget {
  const BusinessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 150;

    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        const SizedBox(height: 4),
        const AddressPanel(),
        const VSpace(),
        const InfographicList(height: containerHeight),
        const VSpace(),
        BusinessPanel(),
        const VSpaceBig(),
        const ReviewListSlider(),
        const VSpaceBig(),
        const NewsList(),
        const VSpaceBig(),
      ],
    );
  }
}