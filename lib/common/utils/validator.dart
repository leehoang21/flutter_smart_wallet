
class AppValidator {
  static String _validatePhone = r'0\d{8,}';
  static RegExp _expPhoneNumber = RegExp(_validatePhone);
  static String _validateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static RegExp _expEmail = RegExp(_validateEmail);

  bool isNullEmpty(Object o) => "" == o;
}
