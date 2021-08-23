import 'package:flutter/material.dart';

import 'package:flutter_smart_wallet/common/extensions/size_extension.dart';
import 'theme_color.dart';

class ThemeIcon {
  static IconThemeData getDefaultIconTheme() => const IconThemeData();
}

extension CustomIconTheme on IconThemeData {
  IconThemeData get appBarIconTheme => IconThemeData(
        color: AppColor.primaryColor,
        size: 18.sp,
      );
}
