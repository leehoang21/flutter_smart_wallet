import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/login_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> getPages() {
    // var args = Get.arguments as Map<String, dynamic>;
    return [
      GetPage(name: RouteList.splashScreen, page: () => SplashScreen()),
      GetPage(name: RouteList.loginScreen, page: () => LoginScreen()),
      GetPage(name: RouteList.registerScreen, page: () => RegisterScreen()),
      GetPage(name: RouteList.verifyOtpScreen, page: () => VerifyOtpScreen())
    ];
  }
}