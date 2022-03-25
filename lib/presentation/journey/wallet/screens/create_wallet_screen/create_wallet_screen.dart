import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/presentation/app.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../../common/utils/app_text_input_formatter.dart';

class CreateWalletScreen extends StatelessWidget {
  CreateWalletScreen({Key? key}) : super(key: key);

  final walletTypeController = TextEditingController();
  final balanceController = TextEditingController();
  final walletNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWalletCubit, CreateWalletState>(
        builder: (context, createWalletState) {
      walletTypeController.text = translate(
          context.watch<CreateWalletCubit>().state.walletTypeModel.id! == 1
              ? 'cash'
              : 'bank_account');
      return Scaffold(
        backgroundColor: AppColor.ebonyClay,
        appBar: AppBarWidget(
          centerWidget: Text(
            translate('wallets'),
            textAlign: TextAlign.center,
            style: ThemeText.style18Bold.copyWith(color: AppColor.white),
          ),
          //  color: AppColor.ebonyClay,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: AppDimens.space_16),
              padding: EdgeInsets.only(top: AppDimens.height_20),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimens.radius_20),
                      topRight: Radius.circular(AppDimens.radius_20))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(
                        "wallet_type",
                      ),
                      style: ThemeText.style14Medium
                          .copyWith(fontSize: AppDimens.space_16),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      onTap: () => showBottomSheet(context),
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icForm,
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                      ),
                      readOnly: true,
                      controller: walletTypeController,
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                      //   hintText: translate(createWalletState.walletTypeModel.id! == 1 ?'cash':'bank_account')
                    ),
                    SizedBox(height: AppDimens.space_16),
                    Text(
                      translate(
                        "wallet_info",
                      ),
                      style: ThemeText.style14Medium
                          .copyWith(fontSize: AppDimens.space_16),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      prefixIcon: AppImageWidget(
                          path: ImageConstants.icCoin,
                          height: AppDimens.space_26,
                          width: AppDimens.space_26),
                      controller: balanceController
                        // ..addListener(() {
                        //   context
                        //       .read<CreateWalletCubit>()
                        //       .onChangedButtonState(
                        //           balanceController.text.isNotEmpty &&
                        //               walletNameController.text.isNotEmpty);
                        // })
                      ,
                      hintText: '0đ',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        CurrencyTextInputFormatter(locate: 'vi_VN'),
                      ],
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      prefixIcon: AppImageWidget(
                          path: ImageConstants.icWalletName,
                          height: AppDimens.space_26,
                          width: AppDimens.space_26),
                      controller: walletNameController
                        ..addListener(() {
                          context
                              .read<CreateWalletCubit>()
                              .onChangedButtonState(
                                  balanceController.text.isNotEmpty &&
                                      walletNameController.text.isNotEmpty);
                        }),
                      hintText: translate('wallet_name'),
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: AppDimens.space_16,
                right: AppDimens.space_16,
                bottom: AppDimens.space_16,
                child: TextButtonWidget(
                  onPressed: () => context
                      .read<CreateWalletCubit>()
                      .onCreateWallet(
                          name: walletNameController.text,
                          balance: balanceController.text),
                  buttonState:
                      context.watch<CreateWalletCubit>().state.buttonState,
                  title: translate('confirm'),
                )),
          ],
        ),
        // bottomNavigationBar:    Container(
        //   color: AppColor.white,
        //   child: GestureDetector(
        //     onTap: ()=> context.read<CreateWalletCubit>().onChangedWalletTypeSelected(),
        //     child: Container(
        //         margin: EdgeInsets.all(AppDimens.space_16),
        //         height: AppDimens.height_52,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(AppDimens.radius_12),
        //             color: AppColor.grey
        //         ),
        //         child:   Center(child: Text(translate('create'), style: ThemeText.style14Medium.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),))
        //
        //     ),
        //   ),
        // )
      );
    });
  }

  void showBottomSheet(BuildContext context) => showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext bottomContext) {
        int selected = 1;
        return BlocProvider.value(
          value: BlocProvider.of<CreateWalletCubit>(context),
          child: BlocBuilder<CreateWalletCubit, CreateWalletState>(
              builder: (context, createWalletState) => Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        AppBarWidget(
                          centerWidget: Text(
                            translate(('wallet_type')),
                            textAlign: TextAlign.center,
                            style: ThemeText.style18Bold
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          action: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.close)),
                        ),
                        // Container(
                        //   width: ScreenUtil().screenWidth,
                        //   color: Colors.red,
                        //   child: Center(
                        //     child: Row(
                        //       // mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         // Expanded(
                        //         //   flex: 5,
                        //           //child:
                        //           Center(
                        //             child: Text(
                        //               translate(('wallet_type')),
                        //               style: ThemeText.style18Bold
                        //                   .copyWith(fontWeight: FontWeight.w500),
                        //             ),
                        //           ),
                        //         // ),
                        //         // Expanded(
                        //         //   flex: 1,
                        //           //child:
                        //           IconButton(
                        //               onPressed: () => Navigator.pop(context),
                        //               icon: Icon(Icons.close)),
                        //         // ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.space_16),
                          child: ListTile(
                            onTap: () => context
                                .read<CreateWalletCubit>()
                                .onChangedWalletTypeSelecting(
                                    walletTypeList.first),
                            dense: true,
                            leading: AppImageWidget(
                                path: ImageConstants.icCash,
                                height: AppDimens.space_26,
                                width: AppDimens.space_26),
                            title: Text(
                              translate('cash'),
                              style: ThemeText.style14Medium,
                            ),
                            trailing: Visibility(
                                visible: context
                                        .watch<CreateWalletCubit>()
                                        .state
                                        .walletTypeSelecting ==
                                    walletTypeList.first,
                                child: Icon(Icons.check)),
                          ),
                        ),
                        SizedBox(height: AppDimens.space_12),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.space_16),
                          child: ListTile(
                            onTap: () => context
                                .read<CreateWalletCubit>()
                                .onChangedWalletTypeSelecting(
                                    walletTypeList.last),
                            dense: true,
                            leading: AppImageWidget(
                                path: ImageConstants.icBankCard,
                                height: AppDimens.space_26,
                                width: AppDimens.space_26),
                            title: Text(
                              translate('bank_account'),
                              style: ThemeText.style14Medium,
                            ),
                            trailing: Visibility(
                                visible: context
                                        .watch<CreateWalletCubit>()
                                        .state
                                        .walletTypeSelecting ==
                                    walletTypeList.last,
                                child: Icon(Icons.check)),
                          ),
                        ),
                        SizedBox(height: AppDimens.space_12),
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppDimens.space_16,
                              right: AppDimens.space_16,
                              bottom: AppDimens.space_16),
                          child: TextButtonWidget(
                              buttonColor: AppColor.shadow,
                              title: translate('confirm'),
                              onPressed: () {
                                context
                                    .read<CreateWalletCubit>()
                                    .onChangedWalletTypeSelected();
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  )),
        );
      });
}
