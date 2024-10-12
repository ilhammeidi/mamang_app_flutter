import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/promos.dart';

class SavedPromoController extends GetxController {
  final rawData = promoList.where((item) => item.saved == true).toList();
  final rawLiked = promoList.where((item) => item.liked == true).toList();

  var savedPromo = <Promotion>[].obs;
  var filteredList = <Promotion>[].obs;
  var selectedPromo = Promotion().obs;
  var likedPromo = <Promotion>[].obs;

  var category = 'all'.obs;
  var sortby = 'date'.obs;

  @override
  void onInit() {
    fetchSavedPromo();
    fetchLikedPromo();
    super.onInit();
  }

  void fetchSavedPromo() async {
    savedPromo.addAll(rawData);
    filteredList.addAll(rawData);
    update();
  }

  void fetchLikedPromo() async {
    likedPromo.addAll(rawLiked);
    update();
  }

  void getPromo(id) {
    var result = savedPromo.firstWhere((item) => item.id == id);
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