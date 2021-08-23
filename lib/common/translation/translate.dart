import 'package:get/get.dart';

import 'en.dart';
import 'vi.dart';

class CommonTranslate extends Translations {
  static final String localeCodeVi = 'vi_VN';
  static final String localeCodeEn = 'en_US';

  @override
  Map<String, Map<String, String>> get keys => {
    localeCodeVi: vi,
    localeCodeVi: en,
  };

  static String? getString(String? key) {
    Map<String, String> selectedLanguage = Get.locale.toString() == localeCodeEn ? en : vi;
    return selectedLanguage.containsKey(key) && selectedLanguage[key] != null
        ? selectedLanguage[key]
        : '--Empty String--';
  }

}