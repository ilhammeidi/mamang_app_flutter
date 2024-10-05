import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class SavedPromoController extends GetxController {
  final rawData = promoList.where((item) => item.saved == true).toList();

  var savedPromo = <Promotion>[].obs;
  var filteredList = <Promotion>[].obs;
  var selectedPromo = Promotion().obs;

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

  void getPromo(id) {
    var result = savedPromo.where((item) => item.id == id).toList();
    selectedPromo.update((promoVal) {
      promoVal!.id = result[0].id;
      promoVal.userId = result[0].userId;
      promoVal.name = result[0].name;
      promoVal.thumb = result[0].thumb;
      promoVal.category = result[0].category;
      promoVal.desc = result[0].desc;
      promoVal.distance = result[0].distance;
      promoVal.price = result[0].price;
      promoVal.location = result[0].location;
      promoVal.date = result[0].date;
      promoVal.verified = result[0].verified;
      promoVal.published = result[0].published;
      promoVal.stared = result[0].stared;
      promoVal.saved = result[0].saved;
      promoVal.type = result[0].type;
      promoVal.xp = result[0].xp;
      promoVal.level = result[0].level;
      promoVal.liked = result[0].liked;
    });
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

  void filterByDistance(int selectedDistance) {
    if (selectedDistance > -1) {
      var result = savedPromo
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