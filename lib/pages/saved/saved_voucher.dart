import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/voucher_card.dart';

class SavedVoucher extends StatelessWidget {
  const SavedVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.surface,
            elevation: 2,
            shadowColor: Colors.black
          ),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Voucher Free Item', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        color: ThemePalette.primaryDark,
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: VoucherCard(
            date: '12 May 2025 - 30 May 2025',
          ),
        ),
      )
    );
  }
}