import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/controller/login_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/login_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/widgets/social_network_login.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  final _emailPhoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: LoginConstants.paddingTop,
              right: LayoutConstants.paddingHorizontalApp,
              left: LayoutConstants.paddingVerticalApp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LoginConstants.welcome,
                  style:
                      ThemeText.headline4.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  LoginConstants.back,
                  style:
                      ThemeText.headline4.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: LoginConstants.sizeBoxHeight75,
                ),
                TextFieldWidget(
                  controller: _emailPhoneController,
                  hintText: LoginConstants.emailOrPhone,
                  onChanged: _onChanged,
                  onSaved: _onSaved,
                  onEditingComplete: _onEditingComplete,
                ),
                SizedBox(
                  height: LoginConstants.sizeBoxHeight75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LoginConstants.signIn,
                      style: ThemeText.headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconButtonWidget(
                        onPressed: _login, iconSource: IconConstants.nextIcon)
                  ],
                ),
                SizedBox(
                  height: LoginConstants.sizeBoxHeight75,
                ),
                SocialNetWorkLogin(
                    googleLogin: _loginWithGoogle,
                    appleAccountLogin: _loginWithAppleAccount,
                    facebookLogin: _loginWithFacebook),
                SizedBox(
                  height: LoginConstants.sizeBoxHeight139,
                ), InkWell(
                  onTap: _register,
                  child: Text(
                    LoginConstants.signUp,
                    style: ThemeText.caption.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onChanged(String value) {}

  void _onSaved(String? value) {}

  void _onEditingComplete() {}

  void _login() {}

  void _loginWithGoogle() {}

  void _loginWithAppleAccount() {}

  void _loginWithFacebook() {}

  void _register() {
    Get.toNamed(RouteList.registerScreen);
  }
}
