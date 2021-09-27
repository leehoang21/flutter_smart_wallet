import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/domain/use_cases/user_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/verify_otp/controller/verify_otp_controller.dart';
import 'package:get/get.dart';

class VerifyOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerifyOtpController(Get.find<AuthenticationUsecase>(),
        Get.find<UserUsecase>(), Get.find<AppController>()));
  }
}
