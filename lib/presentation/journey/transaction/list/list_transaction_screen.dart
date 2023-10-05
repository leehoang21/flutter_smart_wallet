import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

import '../../../../common/constants/argument_constants.dart';
import '../../../../common/constants/image_constants.dart';
import '../../../../common/constants/route_list.dart';
import '../../../../themes/theme_text.dart';
import '../../../widgets/app_image_widget.dart';
import 'list_transaction_constants.dart';

class ListTransactionScreen extends StatefulWidget {
  final Map<String, List<TransactionModel>> data;
  const ListTransactionScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  State<ListTransactionScreen> createState() => _ListTransactionScreenState();
}

class _ListTransactionScreenState extends State<ListTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundColor: AppColor.white,
      appbar: AppBarWidget(
        color: AppColor.white,
        title: ListTransactionConstants.detailTransaction,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.tuna,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: Column(
                children: widget.data.entries.map<Widget>((e) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.key,
                            style: ThemeText.caption,
                          ),
                          Text(
                            (e.value.fold(0, (previousValue, element) {
                                  return previousValue + element.amount;
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
                                context, RouteList.detailTransactionScreen,
                                arguments: {
                                  ArgumentConstants.transaction: item,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  (item.category.type == 'EXPENSES'
                                          ? '-'
                                          : '+') +
                                      item.amount.toString() +
                                      'đ',
                                  style: ThemeText.caption.copyWith(
                                    color: item.category.type == 'EXPENSES'
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
        );
      }),
    );
  }
}
