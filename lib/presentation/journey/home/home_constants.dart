import 'package:flutter/material.dart';
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

  static final pages = [
    const Center(
      key: ValueKey<int>(0),
      child: Text("Transactions"),
    ),
    const Center(
      key: ValueKey<int>(1),
      child: Text("Statistic"),
    ),
    const Center(
      key: ValueKey<int>(2),
      child: Text("Goal"),
    ),
    const Center(
      key: ValueKey<int>(3),
      child: Text("Transaction"),
    ),
  ];
}
