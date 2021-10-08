import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/login/login_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class SocialNetWorkLogin extends StatelessWidget {
  final Function() googleLogin;
  final Function() appleAccountLogin;
  final Function() facebookLogin;

  const SocialNetWorkLogin(
      {Key? key, required this.googleLogin, required this.appleAccountLogin, required this.facebookLogin})
      : super(key: key);

  Widget _socialIconButton(String iconPath) {
    return IconButtonWidget(
      onPressed: googleLogin,
      buttonColor: AppColor.white,
      iconSource: iconPath,
      borderColor: AppColor.fieldColor,
      iconHeight: LoginConstants.socialIconButtonSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _socialIconButton(IconConstants.googleIcon),
        _socialIconButton(IconConstants.appIcon),
        _socialIconButton(IconConstants.fbIcon),
      ],
    );
  }
}
