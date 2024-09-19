import 'package:get/state_manager.dart';

class BottomNavController extends GetxController {
  RxString curPage = 'home'.obs;

  void navigateTo(page) {
    curPage = page;
  }
}