import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/transaction.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: spacingUnit(2)),
      physics: const ClampingScrollPhysics(),
      itemCount: transactionList.length,
      itemBuilder: ((BuildContext context, int index) {
        Transaction item = transactionList[index];
        return Column(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed('/payment/status');
              },
              contentPadding: EdgeInsets.all(spacingUnit(1)),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: item.color.withOpacity(0.25),
                child: Icon(item.icon, color: item.color),
              ),
              title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(item.title, overflow: TextOverflow.ellipsis, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
                Text('\$${item.price}', textAlign: TextAlign.end, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
              ]),
              subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(item.date, style: ThemeText.caption,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ThemeButton.btnSmall.merge(ThemeButton.outlinedPrimary(context)),
                    child: const Text('Buy Again', style: ThemeText.caption,),
                  ),
                ),
              ]),
            ),
            index < transactionList.length - 1 ? const LineList() : Container(),
          ],
        );
      })
    );
  }
}