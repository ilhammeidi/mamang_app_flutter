import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key, this.withPrice = true});

  final bool withPrice;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(spacingUnit(2)),
      color: colorScheme.primaryContainer.withOpacity(0.25),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        /// ICON
        const ProIcon(),
        const SizedBox(width: 16),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pro', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
            RichText(
              text: TextSpan(
                text: 'Duration: ',
                style: ThemeText.paragraph.copyWith(color: colorScheme.onSurface),
                children: const [
                  TextSpan(
                    text: '14 days',
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              ),
            ),
            const Text('14 May - 28 May', style: ThemeText.paragraph)
          ],
        )),
        const SizedBox(width: 8),
        withPrice ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('\$24.00', style: ThemeText.title2.copyWith(color: ThemePalette.primaryMain, fontWeight: FontWeight.bold),),
          Text('Including tax 12%', style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant))
        ]) : Container()
      ]),
    );
  }
}