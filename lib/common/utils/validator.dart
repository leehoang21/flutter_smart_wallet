import 'package:flutter_smart_wallet/model/category_model.dart';

class AppValidator {
  static String _validatePhone = r'0\d{8,}';
  static RegExp _expPhoneNumber = RegExp(_validatePhone);
  static String _validateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static RegExp _expEmail = RegExp(_validateEmail);

  bool isNullEmpty(Object o) => "" == o;
  static bool validateCreataTransactionButton(
          String? amount, CategoryModel? category, DateTime? spendTime) =>
      amount != null &&
      amount.length <= 12 &&
      int.parse(amount) != 0 &&
      category != null &&
      spendTime != null;
}
