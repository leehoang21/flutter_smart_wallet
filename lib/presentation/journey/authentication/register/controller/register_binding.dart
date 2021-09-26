import 'package:flutter_smart_wallet/domain/use_cases/user_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/register/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
        RegisterController(Get.find<UserUsecase>(), Get.find<AppController>()));
  }
}
