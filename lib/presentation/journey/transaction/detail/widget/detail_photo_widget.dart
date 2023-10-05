import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/detail/bloc/detail_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';

class DetailPhotoWidget extends StatefulWidget {
  @override
  State<DetailPhotoWidget> createState() => _DetailPhotoWidgetState();
}

class _DetailPhotoWidgetState extends State<DetailPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
        builder: (context, state) {
      final _photos = state.data.photos ?? [];
      final _length = _photos.length;
      return GridView.count(
        crossAxisCount: 3,
        primary: false,
        shrinkWrap: true,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
        children: List.generate(_length, (index) {
          final photo = _photos[index];
          return ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(LayoutConstants.roundedRadius),
            ),
            child: AppImageWidget(
              path: photo,
              fit: BoxFit.fill,
              width: AppDimens.height_100,
              height: AppDimens.height_100,
            ),
          );
        }),
      );
    });
  }
}
