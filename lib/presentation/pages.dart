import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> getPages() {
    // var args = Get.arguments as Map<String, dynamic>;
    return [
      GetPage(name: RouteList.splashScreen, page: () => SplashScreen()),
    ];
  }
}