import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class BusinessController extends GetxController {
  final rawData = promoList.where((item) => item.userId == 1).toList();

  var myBusiness = <Promotion>[].obs;
  var filteredBusiness = <Promotion>[].obs;
  var category = 'all'.obs;

  @override
  void onInit() {
    fetchBusiness();
    super.onInit();
  }

  void fetchBusiness() async {
    myBusiness.addAll(rawData);
    filteredBusiness.addAll(rawData);
    update();
  }

  void filterByCategory(String selectedCategory) {
    category.value = selectedCategory;
    if (selectedCategory != 'all') {
      var result = myBusiness
        .where((item) => item.category.contains(selectedCategory))
        .toList();
      filteredBusiness.value = result;
    } else {
      filteredBusiness.value = rawData;
    }
    update();
  }
}