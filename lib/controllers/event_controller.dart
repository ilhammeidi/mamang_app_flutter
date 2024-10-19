import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/events.dart';

class EventController extends GetxController {
  final rawData = eventList;

  var allData = <Event>[].obs;
  var filteredList = <Event>[].obs;
  final selectedEvent = Event().obs;
  var isNotFound = false.obs;

  @override
  void onInit() {
    fetchEvent();
    super.onInit();
  }

  void fetchEvent() async {
    allData.addAll(rawData);
    filteredList.addAll(rawData);
    update();
  }

  void getEvent(id) {
    var result = eventList.firstWhere((item) => item.id == id, orElse: () => Event());

    if (result.id == '0') {
      isNotFound.value = true;
    } else {
      selectedEvent.update((eventValue) {
        eventValue!.id = result.id;
        eventValue.title = result.title;
        eventValue.desc = result.desc;
        eventValue.thumb = result.thumb;
        eventValue.clue1 = result.clue1;
        eventValue.clue2 = result.clue2;
        eventValue.clue3 = result.clue3;
        eventValue.date = result.date;
        eventValue.liked = result.liked;
        eventValue.point = result.point;
        eventValue.category = result.category;
      });
    }
  }
}