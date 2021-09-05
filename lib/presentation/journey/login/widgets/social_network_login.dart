import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/login_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class SocialNetWorkLogin extends StatelessWidget {
  final Function() googleLogin;
  final Function() appleAccountLogin;
  final Function() facebookLogin;

  const SocialNetWorkLogin(
      {Key? key,
      required this.googleLogin,
      required this.appleAccountLogin,
      required this.facebookLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
          onPressed: googleLogin,
          buttonColor: AppColor.white,
          iconSource: IconConstants.googleIcon,
          borderColor: AppColor.fieldColor,
        ),
        IconButtonWidget(
          onPressed: appleAccountLogin,
          buttonColor: AppColor.white,
          iconSource: IconConstants.appIcon,
          borderColor: AppColor.fieldColor,
        ),
        IconButtonWidget(
          onPressed: facebookLogin,
          buttonColor: AppColor.white,
          iconSource: IconConstants.fbIcon,
          borderColor: AppColor.fieldColor,
        ),
      ],
    );
  }
}
