// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/cubit/account_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/widgets/change_language_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

import '../../../../common/constants/route_list.dart';
import 'category.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categori(
            pathImage: 'assets/icons/categories.png',
            title: 'Category'.tr,
            action: () {
              Navigator.pushNamed(context, RouteList.categoryScreen);
            }),
        Categori(
            pathImage: IconConstants.icMoney,
            title: 'Wallet'.tr,
            action: () {
              Navigator.pushNamed(context, RouteList.walletListScreen);
            }),
        Categori(
            pathImage: 'assets/icons/language.png',
            title: 'Language'.tr,
            action: () {
              showBottomSheet(
                context: context,
                child: ChangeLanguegeWidget(),
              );
            }),

        // Categori(
        //     pathImage: IconConstants.bottomBarTransactionsIcon,
        //     title: 'Rate me',
        //     action: () {

        //       listTransaction
        //     }),
        // Categori(
        //     pathImage: 'assets/icons/aboutme.png',
        //     title: 'About me',
        //     action: () {}),
        Categori(
          pathImage: 'assets/icons/logout.png',
          title: 'Logout'.tr,
          action: () {
            context.read<AccountCubit>().signOut();
            Navigator.pushNamed(context, RouteList.loginScreen);
          },
        ),
      ],
    );
  }
}

Future<dynamic> showBottomSheet(
    {required Widget child, required BuildContext context}) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    barrierColor: Colors.black.withOpacity(0.25),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.r),
        topRight: Radius.circular(8.r),
      ),
    ),
    backgroundColor: AppColor.iron,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "change_language".tr,
              style: ThemeText.body1,
            ),
            SizedBox(
              height: 10.h,
            ),
            child,
          ],
        ),
      );
    },
  );
}
