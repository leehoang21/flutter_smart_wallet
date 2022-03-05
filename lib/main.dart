import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/language_constants.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/app.dart';
import 'package:flutter_translate/flutter_translate.dart';

Future<void> main() async {
  Injector.setup();
  WidgetsFlutterBinding.ensureInitialized();
  final delegate = await LocalizationDelegate.create(
    fallbackLocale: LanguageConstants.en,
    supportedLocales: [
      LanguageConstants.vi,
      LanguageConstants.en,
    ],
  );
  runApp(
    LocalizedApp(
      delegate,
      App(),
    ),
  );
}
