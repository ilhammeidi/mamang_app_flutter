import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class BusinessHeader extends StatelessWidget {
  const BusinessHeader({super.key, this.isFixed = false});

  final bool isFixed;
  static final bool _isDark = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      /// GRADIENT BG
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: _isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
      ),
      titleSpacing: spacingUnit(1),
      title: Row(children: [
        CircleAvatar(
          radius: 15.r,
          backgroundColor: colorScheme.surface,
          child: CircleAvatar(
            radius: 14.r,
            backgroundImage: NetworkImage(ImgApi.photo[59]),
          )
        ),
        SizedBox(width: spacingUnit(1)),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Indisains Software House', overflow: TextOverflow.ellipsis, style: ThemeText.subtitle.copyWith(color: Colors.white)),
            Text('Jl. Raya Sanggingan Banjar Lungsiakan, Kedewatan, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571', overflow: TextOverflow.ellipsis, style: ThemeText.caption.copyWith(color: Colors.white)),
          ]),
        )
      ]),
      /// ACTION BUTTONS
      actions: [
        const SizedBox(width: 1),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.help_outline_outlined, size: 36, color: Colors.white)
        ),
        IconButton(
          onPressed: () {
            Get.toNamed('/business-new');
          },
          icon: const Icon(Icons.add_circle_outline, size: 36, color: Colors.white)
        ),
      ],
      /// BOTTOM ROUNDED DECORATION
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 20,
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(isFixed ? 1 : 0),
            borderRadius: BorderRadius.only(
              topLeft: isFixed ? const Radius.circular(20) : const Radius.circular(0),
              topRight: isFixed ? const Radius.circular(20) : const Radius.circular(0)
            )
          ),
        ),
      ),
    );
  }
}