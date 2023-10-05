import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/cubit/account_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';

class Avata extends StatelessWidget {
  Avata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.sp,
      height: 80.sp,
      child: context.watch<AccountCubit>().state.userModel.avatar != null
          ? CircleAvatar(
              backgroundImage: AppImageWidget(
                path:
                    context.watch<AccountCubit>().state.userModel.avatar ?? '',
              ).im,
            )
          : CircleAvatar(
              backgroundImage: AssetImage(ImageConstants.defaultAvatarImg),
            ),
    );
  }
}
