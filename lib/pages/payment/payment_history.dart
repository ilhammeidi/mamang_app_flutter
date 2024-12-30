import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/payment_list.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/filter_transaction.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  String _sortby = 'date_newest';
  String _category = 'all';

  void _onSortByDate(val) {
    setState(() {
      _sortby = val;
    });
  }

  void _onChangeCategory(val) {
    setState(() {
      _category = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Get.toNamed('/faq');
            },
          )
        ],
        centerTitle: false,
        title: const Text('Payment History'),
      ),
      body: Column(children: [
        const VSpaceShort(),
        FilterTransaction(
          sortby: _sortby,
          category: _category,
          onSortByDate: _onSortByDate,
          onChangeCategory: _onChangeCategory,
        ),
        const VSpaceShort(),
        const Expanded(child: PaymentList())
      ]),
    );
  }
}