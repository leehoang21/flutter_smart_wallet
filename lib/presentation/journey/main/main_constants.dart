import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/account_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/goal/goal_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/statistics/statistic_screen.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MainConstants {
  static final floatingActionButtonDimension = 56.sp;
  static final floatingActionButtonIconSize = 52.sp;

  static const screenAnimatingDuration = Duration(milliseconds: 300);

  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": IconConstants.bottomBarTransactionsIcon,
      "label": translate('transactions'),
    },
    {
      "iconPath": IconConstants.bottomBarStatisticIcon,
      "label": translate('Statistic'),
    },
    {
      "iconPath": IconConstants.bottomBarGoalIcon,
      "label": translate('goal'),
    },
    {
      "iconPath": IconConstants.bottomBarMyPageIcon,
      "label": translate('my_page'),
    },
  ];

  static final screens = [
    HomeScreen(),
    StatisticScreen(),
    GoalScreen(),
    AccountScreen(),
  ];
}
