import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class AllPromoController extends GetxController {
  final rawData = promoList;

  var allData = <Promotion>[].obs;
  var filteredList = <Promotion>[].obs;
  var selectedPromo = Promotion().obs;
  var isNotFound = false.obs;

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

  void getPromo(int id) {
    Promotion result = allData.firstWhere((item) => item.id == id, orElse: () => Promotion());
    
    if (result.id == 0) {
      isNotFound.value = true;
    } else {
      selectedPromo.update((promoVal) {
        promoVal!.id = result.id;
        promoVal.userId = result.userId;
        promoVal.name = result.name;
        promoVal.thumb = result.thumb;
        promoVal.category = result.category;
        promoVal.desc = result.desc;
        promoVal.distance = result.distance;
        promoVal.price = result.price;
        promoVal.location = result.location;
        promoVal.date = result.date;
        promoVal.verified = result.verified;
        promoVal.published = result.published;
        promoVal.stared = result.stared;
        promoVal.saved = result.saved;
        promoVal.type = result.type;
        promoVal.xp = result.xp;
        promoVal.level = result.level;
        promoVal.liked = result.liked;
      });
    }

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