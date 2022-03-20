import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_translate/flutter_translate.dart';

class WalletListScreen extends StatelessWidget {
  const WalletListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: translate('wallets'),
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.white,
          ),
        ),
        body:Stack(
          children: [
            Positioned(
                right: AppDimens.width_16,
                bottom: AppDimens.space_30,
                child: _buildAddButton()),
           // Expanded(
           //   child:  Column(
           //     children: [
                 BlocBuilder<WalletListCubit, WalletListState>(
                     builder: (context, walletListState) {

                       if (walletListState is WalletListLoaded) {
                         return ListView.builder(
                           itemBuilder: (context, index) => _buildWalletItem(walletListState.walletList[index]),
                           itemCount: walletListState.walletList.length,
                         );
                       }

                       if (walletListState is WalletListError) {
                         return Center(
                           child: Text(translate("error_message")),
                         );
                       }
                       return LoaderWidget();
                     })
           //       // Expanded(
           //       //   child:  RefreshWidget(
           //       //       controller: controller.notiRefreshController,
           //       //       onRefresh: controller.onRefresh,
           //       //       child: controller.rxLoadedList.value == LoadedType.start
           //       //           ? _buildNotiSkeletonLists()
           //       //           : controller.notisList.value.isEmpty
           //       //           ? SizedBox()
           //       //           : ListView.builder(
           //       //           shrinkWrap: true,
           //       //           itemCount: controller.notisList.value.length,
           //       //           itemBuilder: (context, index) =>
           //       //               _buildNotiListTile(controller.notisList.value[index]))),
           //       // ),
           //
           //     ],
           //   ),
           // )

          ],
        ));

  }
  
  Widget _buildAddButton()
  {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.ebonyClay
        ),
        child: Icon(Icons.add, size: AppDimens.height_52,color: AppColor.white,),
      ),
    );
  }

  Widget _buildWalletItem(WalletModel wallet) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
    // height: 60,
     width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppDimens.radius_16),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 10,
            offset: Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
             // color: Colors.orange,
            margin: EdgeInsets.only(
                left: AppDimens.space_16, top: AppDimens.space_4,bottom: AppDimens.space_4, right: AppDimens.space_16),
            width: AppDimens.height_52,
            height: AppDimens.height_52,
            child: Image.asset(IconConstants.icWallet,
              height: AppDimens.height_52,
                     width: AppDimens.height_52,)
            // isNullEmptyOrFalse(wallet.walletImage)
            //     ? AppImageWidget(
            //         path: wallet.walletImage!,
            //         height: AppDimens.height_52,
            //         width: AppDimens.height_52)
            //     : AppImageWidget(
            //         path: IconConstants.icWallet,
            //         height: AppDimens.height_52,
            //         width: AppDimens.height_52,
            //       ),
          ),
          Container(
         //   color: Colors.red,
            margin: EdgeInsets.symmetric(vertical: AppDimens.space_4),
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 wallet.walletName ?? "",
                  //"cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc",
                  style: ThemeText.style14Medium,
                  softWrap: true,
                ),
                Text(
                  formatMoney(wallet.balance.toString()),
                  style: ThemeText.style12Regular.copyWith(color: AppColor.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
