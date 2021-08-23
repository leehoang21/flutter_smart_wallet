import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseConfig());
    Get.put(AppController());
  }

}