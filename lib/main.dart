import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/translation/translate.dart';
import 'package:flutter_smart_wallet/presentation/journey/root_screen.dart';
import 'package:flutter_smart_wallet/presentation/pages.dart';
import 'package:flutter_smart_wallet/themes/theme_data.dart';
import 'package:get/get.dart';

import 'common/bindings/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    initialBinding: AppBinding(),
    initialRoute: RouteList.splashScreen,
    getPages: AppPages.getPages(),
    translations: CommonTranslate(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [const Locale('vi', 'VN'), const Locale('en', 'US')],
    locale: const Locale('vi', 'VN'),
    fallbackLocale: const Locale('vi', 'VN'),
    theme: appTheme(),
    builder: (context, child) {
      return RootScreen(child!);
    },
  ));
}
