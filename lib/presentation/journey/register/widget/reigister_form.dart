import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController mailController;
  final TextEditingController phoneController;
  final _registerFormKey = GlobalKey<FormState>();

  RegisterForm(
      {Key? key,
      required this.nameController,
      required this.mailController,
      required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          TextFieldWidget(
            controller: nameController,
            hintText: RegisterConstants.name,
            validate: (value) => AppValidator.validateName(value),
          ),
          SizedBox(
            height: RegisterConstants.sizeBoxHeight18,
          ),
          TextFieldWidget(
            controller: mailController,
            hintText: RegisterConstants.emailAddress,
            validate: (value) => AppValidator.validateEmail(value),
          ),
          SizedBox(
            height: RegisterConstants.sizeBoxHeight18,
          ),
          TextFieldWidget(
            controller: phoneController,
            hintText: RegisterConstants.phone,
            validate: (value) => AppValidator.validatePhoneNumber(value),
          ),
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
        ],
      ),
    );
  }

  void _register() {
    if (_registerFormKey.currentState!.validate()) {
      Get.toNamed(RouteList.verifyOtpScreen);
    }
  }
}
