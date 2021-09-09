import 'dart:developer';

import 'package:get/get.dart';

class AppValidator {
  static String _validatePhone = r'0\d{8,}';
  static RegExp _expPhoneNumber = RegExp(_validatePhone);
  static String _validateEmail =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/';
  static RegExp _expEmail = RegExp(_validateEmail);


  static String? validatePhoneNumber(String? value) {
    log('deubg');
    if (value == null || value.isEmpty) {
      return 'required_phone_number'.tr;
    }
    if (!_expPhoneNumber.hasMatch(value) || value.length > 10) {
      return 'invalid_phone_number'.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_email'.tr;
    }
    if (!_expEmail.hasMatch(value)) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty){
      return 'required_name'.tr;
    }
    return null;
  }

  bool isNullEmpty(Object o) => "" == o;
}
