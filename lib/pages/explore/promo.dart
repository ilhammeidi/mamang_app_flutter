import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list_single.dart';

class RecommendedPromo extends StatelessWidget {
  const RecommendedPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Promotion> promoData = [
      promoList[71],
      promoList[6],
      promoList[34],
      promoList[88],
      promoList[55],
      promoList[12],
      promoList[44],
      promoList[69],
      promoList[90],
      promoList[80],
    ];

    return PromoListSingle(
      items: promoData,
      title: 'Recomended',
      desc: 'Limited Time Offer: Enjoy 10% Off Your First Purchase!',
    );
  }
}


class FlashSalePromo extends StatelessWidget {
  const FlashSalePromo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Promotion> promoData = [
      promoList[10],
      promoList[78],
      promoList[65],
      promoList[23],
      promoList[91],
      promoList[88],
      promoList[11],
      promoList[16],
      promoList[21],
      promoList[46],
    ];

    return PromoListSingle(
      items: promoData,
      title: 'Flash Sale',
      desc: 'Flash Sale: Up to 40% Off Sitewide!',
    );
  }
}