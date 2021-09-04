import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/controller/register_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/widget/reigister_form.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        leading: AppBarButton(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
            size: RegisterConstants.sizeBoxHeight18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: RegisterConstants.paddingTop,
              left: LayoutConstants.paddingHorizontalApp,
              right: LayoutConstants.paddingHorizontalApp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                RegisterConstants.signUpAnd,
                style: ThemeText.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              Text(
                RegisterConstants.starting,
                style: ThemeText.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(
                height: RegisterConstants.sizeBoxHeight75,
              ),
              RegisterForm(
                  nameController: _nameController,
                  mailController: _mailController,
                  phoneController: _phoneController),
              SizedBox(
                height: RegisterConstants.sizeBoxHeight129,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    RegisterConstants.signUp,
                    style: ThemeText.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: RegisterConstants.signUpFontSize,
                    ),
                  ),
                  IconButtonWidget(
                      onPressed: _register, iconSource: IconConstants.nextIcon)
                ],
              ),
              SizedBox(
                height: RegisterConstants.sizeBoxHeight46,
              ),
              InkWell(
                onTap: _login,
                child: Text(
                  RegisterConstants.signIn,
                  style: ThemeText.caption.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: AppColor.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    Get.toNamed(RouteList.verifyOtpScreen);
  }

  void _login() {
    Get.toNamed(RouteList.loginScreen);
  }
}
