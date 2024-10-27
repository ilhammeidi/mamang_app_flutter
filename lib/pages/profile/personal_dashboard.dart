import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_point.dart';

class PersonalDashboard extends StatelessWidget {
  const PersonalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(spacingUnit(2)),
      children: const [
        PanelPoint(),
        VSpace(),
      ],
    );
  }
}