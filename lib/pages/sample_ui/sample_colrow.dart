import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_breakpoints.dart';
import 'package:mamang_app_flutter/ui/utils/col_row.dart';

class SampleColrow extends StatelessWidget {
  const SampleColrow({super.key});

  @override
  Widget build(BuildContext context) {
    return ColRow(
      switched: ThemeBreakpoints.mdDown(context),
      reversed: ThemeBreakpoints.smDown(context),
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.cyan,
        )
      ]
    );
  }
}