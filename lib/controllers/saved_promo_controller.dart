import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class SavedPromoController extends GetxController {
  final rawData = promoList.where((item) => item.saved == true).toList();

  var savedPromo = <Promotion>[].obs;
  var filteredList = <Promotion>[].obs;

  var category = 'all'.obs;
  var sortby = 'date'.obs;

  @override
  void onInit() {
    fetchSavedPromo();
    super.onInit();
  }

  void fetchSavedPromo() async {
    savedPromo.addAll(rawData);
    filteredList.addAll(rawData);
    update();
  }

  void filterByCategory(String selectedCategory) {
    category.value = selectedCategory;
    if (selectedCategory != 'all') {
      var result = savedPromo
        .where((item) => item.category.contains(selectedCategory))
        .toList();
      
      filteredList.value = result;
    } else {
      filteredList.value = rawData;
    }
    update();
  }

  void sortDate(value, order) {
    if (order == 'asc') {
      savedPromo.sort((a, b) => a.date.compareTo(b.date));
    } else {
      savedPromo.sort((b, a) => a.date.compareTo(b.date));
    }
    update();
  }

  void sortDistance(val, order) {
    if (order == 'asc') {
      savedPromo.sort((a, b) => a.distance.compareTo(b.distance));
    } else {
      savedPromo.sort((b, a) => a.distance.compareTo(b.distance));
    }
    update();
  }
}