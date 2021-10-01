import 'package:flutter_smart_wallet/common/constants/argument_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/verify_otp/controller/verify_otp_binding.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/controller/home_binding.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'journey/authentication/login/controller/login_binding.dart';
import 'journey/authentication/login/login_screen.dart';
import 'journey/authentication/register/controller/register_binding.dart';
import 'journey/authentication/register/register_screen.dart';
import 'journey/authentication/verify_otp/verify_otp_screen.dart';
import 'journey/main/main_screen.dart';
import 'journey/splash/splash_screen.dart';

class AppPages {
  static List<GetPage> getPages() {
    // var args = Get.arguments as Map<String, dynamic>;
    return [
      GetPage(name: RouteList.splashScreen, page: () => SplashScreen()),
      GetPage(
          name: RouteList.loginScreen,
          page: () => LoginScreen(),
          binding: LoginBinding()),
      GetPage(
          name: RouteList.mainScreen,
          page: () => HomeScreen(),
          binding: HomeBinding()),
      GetPage(name: RouteList.loginScreen, page: () => LoginScreen()),
      GetPage(
          name: RouteList.registerScreen,
          page: () => RegisterScreen(
            phone:  Get.arguments[ArgumentConstants.phoneNumber],
          ),
          binding: RegisterBinding()),
      GetPage(
          name: RouteList.verifyOtpScreen,
          page: () => VerifyOtpScreen(
                phoneNumber: Get.arguments[ArgumentConstants.phoneNumber],
                verificationId: Get.arguments[ArgumentConstants.verificationId],
                resendToken: Get.arguments[ArgumentConstants.smsCode],
              ),
          binding: VerifyOtpBinding()),
      GetPage(name: RouteList.mainScreen, page: () => MainScreen())
    ];
  }
}
