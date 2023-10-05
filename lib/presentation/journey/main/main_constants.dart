import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/account_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_screen.dart';

class MainConstants {
  static final floatingActionButtonDimension = 56.sp;
  static final floatingActionButtonIconSize = 52.sp;

  static const screenAnimatingDuration = Duration(milliseconds: 300);

  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": IconConstants.bottomBarTransactionsIcon,
      "label": 'transactions',
    },
    // {
    //   "iconPath": IconConstants.bottomBarStatisticIcon,
    //   "label": translate('report'),
    // },
    // {
    //   "iconPath": IconConstants.bottomBarGoalIcon,
    //   "label": translate('wallet'),
    // },
    {
      "iconPath": IconConstants.bottomBarMyPageIcon,
      "label": 'my_page',
    },
  ];

  static final screens = [
    HomeScreen(),
    // StatisticScreen(),
    // WalletList2Screen(),
    AccountScreen(),
  ];
}
