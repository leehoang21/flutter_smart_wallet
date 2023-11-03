import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/language_constants.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/common/langue_storage.dart';
import 'package:flutter_smart_wallet/presentation/app.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'common/configs/firebase_config.dart';
import 'firebase_options.dart';

Future<void> main() async {
  Injector.configDependency();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'e-spend',
  );
  await FirebaseConfig.init();
  final delegate = await LocalizationDelegate.create(
    fallbackLocale: LanguageConstants.en,
    supportedLocales: [
      LanguageConstants.vi,
      LanguageConstants.en,
    ],
    preferences: TranslatePreferences(),
  );
  runApp(
    LocalizedApp(
      delegate,
      App(),
    ),
  );
}
