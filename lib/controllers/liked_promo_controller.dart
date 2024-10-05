import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class LikedPromoController extends GetxController {
  final rawData = promoList.where((item) => item.liked == true).toList();

  var likedPromo = <Promotion>[].obs;

  @override
  void onInit() {
    fetchSavedPromo();
    super.onInit();
  }

  void fetchSavedPromo() async {
    likedPromo.addAll(rawData);
    update();
  }
}