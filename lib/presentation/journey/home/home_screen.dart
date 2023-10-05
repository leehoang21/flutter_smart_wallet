import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/common/focus_detector_widget.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/common/utils/format_utils.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/cubit/home_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/card_widget/card_custom.dart';
import 'package:flutter_smart_wallet/presentation/widgets/refresh_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/constants/argument_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key ?? HomeConstants.key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.getIt.get<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: RefreshWidget(
                controller: _refreshController,
                enableLoadMore: false,
                onRefresh: () async {
                  await context.read<HomeCubit>().onConnected();
                  _refreshController.refreshCompleted();
                  return Future.value();
                },
                child: FocusDetector(
                  onVisibilityGained: () {
                    context.read<HomeCubit>().onConnected();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppImageWidget(
                                        path: ImageConstants.calendar),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      formatYear(time),
                                      style: ThemeText.body1.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CardCustom(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Revenue'.tr,
                                            style: ThemeText.caption,
                                          ),
                                          Text(
                                            context.watch<HomeCubit>().revenue,
                                            style: ThemeText.body1.copyWith(
                                              color: AppColor.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Expanded(
                                    child: CardCustom(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Expenses'.tr,
                                            style: ThemeText.caption,
                                          ),
                                          Text(
                                            context.watch<HomeCubit>().expense,
                                            style: ThemeText.body1.copyWith(
                                              color: AppColor.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CardCustom(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total'.tr,
                                      style: ThemeText.caption,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          context.watch<HomeCubit>().total > 0
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          color:
                                              context.watch<HomeCubit>().total >
                                                      0
                                                  ? AppColor.blue
                                                  : AppColor.red,
                                          size: 18.sp,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          context
                                                  .watch<HomeCubit>()
                                                  .total
                                                  .toString() +
                                              'đ',
                                          style: ThemeText.body1.copyWith(
                                            color: context
                                                        .watch<HomeCubit>()
                                                        .total >
                                                    0
                                                ? AppColor.blue
                                                : AppColor.red,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Align(
                                    //   alignment: Alignment.center,
                                    //   child: TextButton(
                                    //     onPressed: () {
                                    //       Injector.getIt
                                    //           .get<TabMangerCubit>()
                                    //           .changePage(1);
                                    //     },
                                    //     child: Row(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.center,
                                    //       children: [
                                    //         AppImageWidget(
                                    //           path: IconConstants.icMoney,
                                    //           width: 18.sp,
                                    //           height: 18.sp,
                                    //         ),
                                    //         Text(
                                    //           "Report",
                                    //           style: ThemeText.caption.copyWith(
                                    //             fontWeight: FontWeight.bold,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        if (context.watch<HomeCubit>().data(false).isNotEmpty)
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteList.listTransactionScreen,
                                  arguments: {
                                    ArgumentConstants.listTransaction:
                                        context.read<HomeCubit>().data(true)
                                  });
                            },
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                children: context
                                    .watch<HomeCubit>()
                                    .data(false)
                                    .entries
                                    .map<Widget>((e) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e.key,
                                            style: ThemeText.caption,
                                          ),
                                          Text(
                                            (e.value.fold(0,
                                                    (previousValue, element) {
                                                  if (element.category.type !=
                                                      'EXPENSES')
                                                    return previousValue +
                                                        element.amount;
                                                  return previousValue -
                                                      element.amount;
                                                }).toString()) +
                                                'đ',
                                            style: ThemeText.caption.copyWith(
                                              color: AppColor.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      for (var item in e.value)
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context,
                                                RouteList
                                                    .detailTransactionScreen,
                                                arguments: {
                                                  ArgumentConstants.transaction:
                                                      item,
                                                });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.h,
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 44.sp,
                                                  height: 44.sp,
                                                  child: AppImageWidget(
                                                      path:
                                                          "${ImageConstants.path}${item.category.name?.toLowerCase()}.png"),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "transaction_category_screen_${(item.category.name ?? '').toLowerCase()}"
                                                          .tr,
                                                      style: ThemeText.caption,
                                                    ),
                                                    Text(
                                                      item.note ?? '',
                                                      style: ThemeText.overline,
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Text(
                                                  (item.category.type ==
                                                              'EXPENSES'
                                                          ? '-'
                                                          : '+') +
                                                      item.amount.toString() +
                                                      'đ',
                                                  style: ThemeText.caption
                                                      .copyWith(
                                                    color: item.category.type ==
                                                            'EXPENSES'
                                                        ? AppColor.red
                                                        : AppColor.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectDate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CupertinoDatePicker(
            onDateTimeChanged: (date) {
              _onChangeDate(date, context);
            },
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime.now(),
          ),
        );
      },
    );
  }

  void _onChangeDate(DateTime date, BuildContext context) {
    context.read<HomeCubit>().changeDate(date);
    setState(() {});
  }
}
