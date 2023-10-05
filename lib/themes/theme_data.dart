import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColor.ebonyClay),
      unselectedIconTheme: IconThemeData(color: AppColor.grey),
      unselectedLabelStyle: TextStyle(color: AppColor.grey),
      selectedLabelStyle: TextStyle(color: AppColor.ebonyClay),
      unselectedItemColor: AppColor.grey,
      selectedItemColor: AppColor.ebonyClay,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.ebonyClay,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle:
          TextStyle(fontSize: AppDimens.space_16, color: AppColor.ebonyClay),
      unselectedLabelStyle: TextStyle(
          fontSize: AppDimens.space_16, color: AppColor.secondaryColor),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
  );
}
