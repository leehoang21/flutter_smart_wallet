import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexTab = 0.obs;

  void changeTab(int index) {
    indexTab.value = index;
  }
}
