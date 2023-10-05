import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/login_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_svg/svg.dart';

class CircleIconWidget extends StatelessWidget {
  const CircleIconWidget({Key? key, required this.iconSvg}) : super(key: key);
  final String iconSvg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: LoginConstants.rCircle,
      height: LoginConstants.rCircle,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColor.iron),
      ),
      child: SvgPicture.asset(
        iconSvg,
        width: LoginConstants.sizeIcon,
        height: LoginConstants.sizeIcon,
      ),
    );
  }
}
