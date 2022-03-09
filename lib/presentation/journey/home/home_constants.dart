import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeConstants {
  static final String homeTitle = translate('Verify_Account');
  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": IconConstants.bottomBarTransactionsIcon,
      "label": translate('transactions'),
    },
    {
      "iconPath": IconConstants.bottomBarStatisticsIcon,
      "label": translate('statistics'),
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
}
