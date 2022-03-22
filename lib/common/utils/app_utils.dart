import 'dart:developer';

import 'package:flutter_smart_wallet/model/wallet_type_model.dart';

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

String formatMoney(String money) {
  String newMoney = '';
  int isDouble = money.indexOf('.');
  if (isDouble != -1) {
    money = money.replaceRange(isDouble, money.length, '');
  }
  if (money.length > 3) {
    int head = money.length % 3;
    newMoney += money.substring(0, head);
    if (newMoney.length > 0) {
      newMoney += '.';
    }
    for (int i = head; i < money.length; i = i + 3) {
      newMoney += money.substring(i, i + 3);
      if ((i + 3) != money.length) newMoney += '.';
    }
    return newMoney+'đ';
  }

  return money+'đ';
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
