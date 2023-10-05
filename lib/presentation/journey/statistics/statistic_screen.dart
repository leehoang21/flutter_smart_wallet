import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/journey/statistics/cubit/statistic_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/statistics/statistic_screen_constants.dart';

import 'pie_chart_widget.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({Key? key}) : super(key: key ?? StatisticScreenConstant.key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.getIt.get<StatisticCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: PieChartWidget(
                      categoryType: 'REVENUE',
                    ),
                  ),
                  Expanded(
                    child: PieChartWidget(
                      categoryType: 'EXPENSES',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
