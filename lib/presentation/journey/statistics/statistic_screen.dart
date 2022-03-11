import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/statistics/statistic_screen_constants.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({Key? key}) : super(key: key ?? StatisticScreenConstant.key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Statistic'),
    );
  }
}
