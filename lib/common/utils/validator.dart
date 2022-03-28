import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

class AppValidator {
  static String _validatePhone = r'0\d{8,}';
  static RegExp expPhoneNumber = RegExp(_validatePhone);
  static String _validateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static RegExp expEmail = RegExp(_validateEmail);

  bool isNullEmpty(Object o) => "" == o;
  static bool validateCreateTransactionButton(int? amount,
          CategoryModel? category, DateTime? spendTime, WalletModel? wallet) =>
      amount != null &&
      amount != 0 &&
      category != null &&
      spendTime != null &&
      wallet != null;
}
