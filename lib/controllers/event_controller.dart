import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/events.dart';

class EventController extends GetxController {
  final rawData = eventList;

  var allData = <Event>[].obs;
  var filteredList = <Event>[].obs;
  final selectedEvent = Event().obs;

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
    var result = eventList.where((item) => item.id == id).toList();
    selectedEvent.update((eventValue) {
      eventValue!.id = result[0].id;
      eventValue.title = result[0].title;
      eventValue.desc = result[0].desc;
      eventValue.thumb = result[0].thumb;
      eventValue.clue1 = result[0].clue1;
      eventValue.clue2 = result[0].clue2;
      eventValue.clue3 = result[0].clue3;
      eventValue.date = result[0].date;
      eventValue.liked = result[0].liked;
      eventValue.point = result[0].point;
    });
  }
}