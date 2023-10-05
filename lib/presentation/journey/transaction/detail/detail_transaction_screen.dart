import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/detail/widget/detail_photo_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

import 'bloc/detail_transaction_bloc.dart';
import 'detail_transaction_constants.dart';
import 'widget/detail_transaction_form.dart';

class DetailTransactionScreen extends StatefulWidget {
  final TransactionModel data;
  const DetailTransactionScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  State<DetailTransactionScreen> createState() =>
      _DetailTransactionScreenState();
}

class _DetailTransactionScreenState extends State<DetailTransactionScreen> {
  @override
  void initState() {
    context.read<DetailTransactionBloc>().init(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundColor: AppColor.white,
      appbar: AppBarWidget(
        color: AppColor.white,
        title: DetailTransactionConstants.detailTransaction,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: AppDimens.height_24,
                    ),
                    DetailTransactionForm(),
                    SizedBox(
                      height: AppDimens.height_12,
                    ),
                    DetailPhotoWidget(),
                    SizedBox(
                      height: AppDimens.height_36,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextButtonWidget(
                    //           onPressed: () {
                    //             Navigator.pushNamed(
                    //                 context, RouteList.createTransaction,
                    //                 arguments: {
                    //                   ArgumentConstants.transaction: context
                    //                       .read<DetailTransactionBloc>()
                    //                       .state
                    //                       .data
                    //                 });
                    //           },
                    //           title: DetailTransactionConstants.update),
                    //     ),
                    //     SizedBox(
                    //       width: 20.w,
                    //     ),
                    //     Expanded(
                    //       child: TextButtonWidget(
                    //           buttonColor: AppColor.red,
                    //           onPressed: () {},
                    //           title: DetailTransactionConstants.delete),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
