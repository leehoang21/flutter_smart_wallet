import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_icon.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'QS',
    primaryColor: AppColor.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstants.roundedRadius),
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    iconTheme: ThemeIcon.getDefaultIconTheme(),
    appBarTheme:
        const AppBarTheme(color: AppColor.backgroundColor, elevation: 0.0),
    toggleableActiveColor: AppColor.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColor.ebonyClay),
      unselectedIconTheme: IconThemeData(color: AppColor.grey),
      unselectedLabelStyle: TextStyle(color: AppColor.grey),
      selectedLabelStyle: TextStyle(color: AppColor.ebonyClay),
      unselectedItemColor: AppColor.grey,
      selectedItemColor: AppColor.ebonyClay,
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: AppColor.primaryColor),
  );
}
