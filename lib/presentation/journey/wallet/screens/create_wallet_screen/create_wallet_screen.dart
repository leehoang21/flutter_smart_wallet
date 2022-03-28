import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

class CreateWalletScreen extends StatelessWidget {
  CreateWalletScreen({Key? key}) : super(key: key);

  final walletTypeController = TextEditingController();
  final balanceController = TextEditingController();
  final walletNameController = TextEditingController();
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: 'vi').currencySymbol;
  String imagePath = '';

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
                        ..addListener(() {
                          if (balanceController.text.length > 1) {
                            String str =
                                '${_formatNumber(balanceController.text.substring(0, balanceController.text.length - 1).replaceAll(',', ''))}';
                            log(str);
                            balanceController.value = TextEditingValue(
                              text: str + _currency,
                              selection:
                                  TextSelection.collapsed(offset: str.length),
                            );
                            context
                                .read<CreateWalletCubit>()
                                .onChangedButtonState(
                                    walletNameController.text.isNotEmpty);
                          } else {
                            context
                                .read<CreateWalletCubit>()
                                .onChangedButtonState(false);
                          }
                        }),
                      onChanged: (string) {},
                      hintText: '0' + _currency,
                      keyboardType: TextInputType.number,
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
                                  walletNameController.text.isNotEmpty);
                        }),
                      readOnly: context
                              .read<CreateWalletCubit>()
                              .state
                              .walletTypeModel ==
                          walletTypeList.last,
                      onTap: () async {
                        if (context
                                .read<CreateWalletCubit>()
                                .state
                                .walletTypeModel ==
                            walletTypeList.last) {
                          final result = await Navigator.pushNamed(
                              context, RouteList.bankListScreen);
                          if (result != null) {
                            walletNameController.text =
                                (result as BankInfoModel).code ?? "";
                            imagePath = (result).logo ?? "";
                          }
                        }
                      },
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
                  onPressed: () {
                    context.read<CreateWalletCubit>().onCreateWallet(context,
                        name: walletNameController.text,
                        balance: balanceController.text,
                        imagePath: imagePath);
                    walletNameController.text = '';
                    balanceController.text = '';
                    FocusScope.of(context).unfocus();
                  },
                  buttonState:
                      context.watch<CreateWalletCubit>().state.buttonState,
                  title: translate('create'),
                )),
          ],
        ),
      );
    });
  }

  void showBottomSheet(BuildContext context) => showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext bottomContext) {
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
                                walletNameController.text = '';
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  )),
        );
      });
}
