import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslatePreferences extends ITranslatePreferences {
  final String _locale = 'locale';
  @override
  Future<Locale?> getPreferredLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final locale = prefs.getString(_locale);

    return Locale(locale ?? 'en');
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_locale, locale.languageCode);
  }
}
