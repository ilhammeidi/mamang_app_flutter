import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class AllPromoController extends GetxController {
  final rawData = promoList;

  var allData = <Promotion>[].obs;
  var filteredList = <Promotion>[].obs;

  var category = 'all'.obs;
  var sortby = 'date'.obs;

  @override
  void onInit() {
    fetchPromo();
    super.onInit();
  }

  void fetchPromo() async {
    allData.addAll(rawData);
    filteredList.addAll(rawData);
    update();
  }

  void filterByCategory(String selectedCategory) {
    category.value = selectedCategory;
    if (selectedCategory != 'all') {
      var result = allData
        .where((item) => item.category.contains(selectedCategory))
        .toList();
      filteredList.value = result;
    } else {
      filteredList.value = rawData;
    }
    update();
  }

  void filterByDistance(int selectedDistance) {
    if (selectedDistance > -1) {
      var result = allData
        .where((item) => item.distance <= selectedDistance)
        .toList();
      filteredList.value = result;
    } else {
      filteredList.value = rawData;
    }
    update();
  }

  void sortDate(order) {
    if (order == 'asc') {
      filteredList.sort((a, b) => a.date.compareTo(b.date));
    } else {
      filteredList.sort((b, a) => a.date.compareTo(b.date));
    }
    update();
  }

  void sortDistance(order) {
    if (order == 'asc') {
      filteredList.sort((a, b) => a.distance.compareTo(b.distance));
    } else {
      filteredList.sort((b, a) => a.distance.compareTo(b.distance));
    }
    update();
  }
}