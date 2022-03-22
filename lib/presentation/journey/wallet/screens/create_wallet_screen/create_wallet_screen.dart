import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_translate/flutter_translate.dart';
class CreateWalletScreen extends StatelessWidget {
   CreateWalletScreen({Key? key}) : super(key: key);

  final walletTypeController = TextEditingController();
   final balanceController = TextEditingController();
   final walletNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWalletCubit,CreateWalletState>(
        builder: (context, createWalletState){
          walletTypeController.text =  translate(createWalletState.walletTypeModel.id! == 1 ?'cash':'bank_account');
          return Scaffold(
            appBar: AppBarWidget(
              title: translate('add_wallet'),
              leading: GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.white,
                ),
              ),
            ),
            body: Column(
              children: [
                Text(translate("wallet_type",), style: ThemeText.style14Medium.copyWith(fontSize: AppDimens.space_16),),
             //    TextFieldWidget(
             //      onTap:
             //      controller: walletTypeController,
             // //   hintText: translate(createWalletState.walletTypeModel.id! == 1 ?'cash':'bank_account')
             //      )
              ],
            ),
          );
        });
  }
}
