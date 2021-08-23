import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/enums/snackbar_enum.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

class CommonSnackbar extends GetBar {
  final String title;
  final SnackbarEnum style;

  CommonSnackbar({required this.title, required this.style})
      : super(
          message: title,
          duration: Duration(seconds: 3),
          icon: style == SnackbarEnum.success ? Icon(
            Icons.check_circle,
            color: AppColor.green,
          ) : Icon(
            Icons.cancel,
            color: AppColor.red,
          ),
        );
}
