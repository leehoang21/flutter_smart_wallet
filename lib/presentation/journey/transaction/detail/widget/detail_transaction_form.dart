import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/detail/bloc/detail_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

import '../../create/create_transaction_constants.dart';

class ItemDetailTransactionWidget extends StatelessWidget {
  const ItemDetailTransactionWidget({
    super.key,
    required this.image,
    required this.title,
    this.titleColor,
  });
  final String image;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 5.h,
      ),
      child: Row(
        children: [
          AppImageWidget(
            path: image,
            width: 26.sp,
            height: 26.sp,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            title,
            style: ThemeText.caption.copyWith(
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailTransactionForm extends StatefulWidget {
  const DetailTransactionForm({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailTransactionForm> createState() => _DetailTransactionFormState();
}

class _DetailTransactionFormState extends State<DetailTransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailTransactionWidget(
            image: ImageConstants.coinIcon,
            title: (context
                    .watch<DetailTransactionBloc>()
                    .state
                    .data
                    .amount
                    .toString()) +
                'đ'),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: ImageConstants.wallet,
            title: (context
                        .watch<DetailTransactionBloc>()
                        .state
                        .data
                        .wallet
                        .walletName ??
                    '')
                .toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: isNullEmpty(context
                    .watch<DetailTransactionBloc>()
                    .state
                    .data
                    .category
                    .name)
                ? ImageConstants.category
                : "${ImageConstants.path}${(context.watch<DetailTransactionBloc>().state.data.category.name ?? '').toLowerCase()}.png",
            title: (context
                        .watch<DetailTransactionBloc>()
                        .state
                        .data
                        .category
                        .name ??
                    '')
                .toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: ImageConstants.calendar,
            title: (context.watch<DetailTransactionBloc>().state.data.time)
                .toString()),
        if (!isNullEmpty(
            context.watch<DetailTransactionBloc>().state.data.note))
          Column(
            children: [
              SizedBox(
                height: AppDimens.height_12,
              ),
              ItemDetailTransactionWidget(
                  image: ImageConstants.note,
                  title:
                      (context.watch<DetailTransactionBloc>().state.data.note)
                          .toString()),
            ],
          ),
        if (!isNullEmptyList(
            context.watch<DetailTransactionBloc>().state.data.photos))
          Column(
            children: [
              SizedBox(
                height: AppDimens.height_12,
              ),
              ItemDetailTransactionWidget(
                image: ImageConstants.colorCamera,
                title: CreateTransactionConstants.invoicePhotos,
              ),
            ],
          ),
        SizedBox(
          height: AppDimens.height_8,
        ),
      ],
    );
  }
}
