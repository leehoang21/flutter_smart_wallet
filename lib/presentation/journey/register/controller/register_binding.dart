import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController(Get.find<AuthenticationUsecase>()));
  }

}