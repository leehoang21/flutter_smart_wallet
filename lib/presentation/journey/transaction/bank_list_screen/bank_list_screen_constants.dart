import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class BankListScreenConstants {
  static final viewPadding = 8.0.sp;
  static final logoImmageWidth = 72.0.sp;

  static final title = translate("transaction_bank_list_screen_choose_a_bank");
  static final searchBarHint =
      translate("transaction_bank_list_screen_search_bank");
  static final noResultText =
      translate("transaction_bank_list_screen_no_result");
  static final errorMessage =
      translate("error_message");
}
