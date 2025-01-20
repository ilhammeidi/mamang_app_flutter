import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/layouts/general_layout.dart';
import 'package:mamang_app_flutter/pages/business/analytics.dart';
import 'package:mamang_app_flutter/pages/business/business_main.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_cc.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_transfer.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_vac.dart';
import 'package:mamang_app_flutter/pages/payment/payment_detail_wallet.dart';
import 'package:mamang_app_flutter/pages/payment/payment_history.dart';
import 'package:mamang_app_flutter/pages/payment/payment_method.dart';
import 'package:mamang_app_flutter/pages/payment/payment_status.dart';
import 'package:mamang_app_flutter/pages/pricing/pricing_business.dart';
import 'package:mamang_app_flutter/pages/business/detail.dart';
import 'package:mamang_app_flutter/pages/business/form.dart';
import 'package:mamang_app_flutter/pages/business/create_new.dart';
import 'package:mamang_app_flutter/pages/business/report.dart';

final List<GetPage> routesBusiness = [
  GetPage(
    name: '/business',
    page: () => const GeneralLayout(content: BusinessMain()),
  ),
  GetPage(
    name: '/business/:id',
    page: () => const GeneralLayout(content: BusinessDetail()),
  ),
  GetPage(
    name: '/business-report',
    page: () => GeneralLayout(content: BusinessReport()),
  ),
  GetPage(
    name: '/business-analytics',
    page: () => const GeneralLayout(content: BusinessAnalytics()),
  ),
  GetPage(
    name: '/business-new',
    page: () => const GeneralLayout(content: PricingBusiness()),
  ),
  GetPage(
    name: '/business-new/payment',
    page: () => const GeneralLayout(content: CreateNewBusiness()),
  ),
  GetPage(
    name: '/business-new/form',
    page: () => const GeneralLayout(content: BusinessForm()),
  ),
  GetPage(
    name: '/payment',
    page: () => const GeneralLayout(content: PaymentMethod()),
  ),
  GetPage(
    name: '/payment/credit-card',
    page: () => const GeneralLayout(content: PaymentDetailCC()),
  ),
  GetPage(
    name: '/payment/ewallet',
    page: () => const GeneralLayout(content: PaymentDetailWallet()),
  ),
  GetPage(
    name: '/payment/transfer',
    page: () => const GeneralLayout(content: PaymentDetailTransfer()),
  ),
  GetPage(
    name: '/payment/vac',
    page: () => const GeneralLayout(content: PaymentDetailVac()),
  ),
  GetPage(
    name: '/payment/status',
    page: () => const GeneralLayout(content: PaymentStatus()),
  ),
  GetPage(
    name: '/payment/history',
    page: () => const GeneralLayout(content: PaymentHistory()),
  ),
];