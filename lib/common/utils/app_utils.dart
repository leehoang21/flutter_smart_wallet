import 'dart:developer';

import 'package:flutter_smart_wallet/model/wallet_type_model.dart';
import 'package:intl/intl.dart';

void logger(String message) {
  log('app_logger: {$message}');
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) =>
    o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}

List<WalletTypeModel> walletTypeList = [
  WalletTypeModel(id: 1, name: "Tiền mặt"),
  WalletTypeModel(id: 2, name: "Tài khoản ngân hàng")
];


const _locale = 'en';
String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
String get _currency => NumberFormat.compactSimpleCurrency(locale: 'vi').currencySymbol;
String formatMoney(String money) {
  return _formatNumber(money)+_currency;
}

String formatPhoneNumber(String phoneNumber) {
  String newPhoneNumber = '';

  for (int i = 0; i < phoneNumber.length; i++) {
    if (phoneNumber[i] != ' ') {
      newPhoneNumber += phoneNumber[i];
    }
    if (newPhoneNumber.length % 4 == 0) {
      newPhoneNumber += ' ';
    }
  }

  return newPhoneNumber.trim();
}
