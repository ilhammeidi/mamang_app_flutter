import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class BusinessController extends GetxController {
  final rawData = promoList.where((item) => item.userId == 1).toList();

  var myBusiness = <Promotion>[].obs;

  @override
  void onInit() {
    fetchBusiness();
    super.onInit();
  }

  void fetchBusiness() async {
    myBusiness.addAll(rawData);
    update();
  }
}