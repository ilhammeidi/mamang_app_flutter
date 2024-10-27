import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class AddressPanel extends StatelessWidget {
  const AddressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(children: [
      CircleAvatar(
        radius: 15.r,
        backgroundColor: colorScheme.surface,
        child: CircleAvatar(
          radius: 14.r,
          backgroundImage: NetworkImage(ImgApi.photo[59]),
        )
      ),
      SizedBox(width: spacingUnit(1)),
      const Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Indisains Software House', overflow: TextOverflow.ellipsis, style: ThemeText.subtitle),
          Text('Jl. Raya Sanggingan Banjar Lungsiakan, Kedewatan, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571', overflow: TextOverflow.ellipsis, style: ThemeText.caption),
        ]),
      )
    ]);
  }
}